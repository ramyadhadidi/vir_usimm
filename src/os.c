#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "params.h"
#include "os.h"
#include "memory_controller.h"
#include "processor.h"

// ROB Structure, used to release stall on instructions 
// when the read request completes
extern struct robstructure * ROB;
extern long long int CYCLE_VAL;
extern long long int BIGNUM;

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////


OS *os_new(uns num_pages, uns num_threads)
{
    OS *os = (OS *) calloc (1, sizeof (OS));

    os->num_pages      = num_pages;
    os->num_threads    = num_threads;
    os->lines_in_page  = OS_PAGESIZE/CACHE_LINE_SIZE;

    os->pt     = (PageTable *) calloc (1, sizeof (PageTable));
    os->pt->entries     = (Hash_Table *) calloc (1, sizeof(Hash_Table));
    init_hash_table(os->pt->entries, "PageTableEntries", 4315027, sizeof( PageTableEntry ));
    os->pt->max_entries = os->num_pages;

    os->ipt     = (InvPageTable *) calloc (1, sizeof (InvPageTable));
    os->ipt->entries = (InvPageTableEntry *) calloc (os->num_pages, sizeof (InvPageTableEntry));
    os->ipt->num_entries = os->num_pages;

    assert(os->pt->entries);
    assert(os->ipt->entries);

    printf("Initialized OS for %u pages\n", num_pages);

    //TLB
    os->tlb = (TLB *) calloc(1,sizeof (TLB));
    os->tlb->num_entries = 0;

    return os;
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

uns os_vpn_to_pfn(OS *os, uns vpn, uns tid, Flag *hit)
{
    Flag first_access;
    PageTable *pt = os->pt;
    InvPageTable *ipt = os->ipt;
    PageTableEntry *pte;
    InvPageTableEntry *ipte;
    *hit = TRUE;

    assert(vpn>>28 == 0);
    vpn = (tid<<28)+vpn; // embed tid information in high bits
    
    if( pt->last_xlation[tid].vpn == vpn ){
	return pt->last_xlation[tid].pfn;
    }
    
    pte = (PageTableEntry *) hash_table_access_create(pt->entries, vpn, &first_access);

    if(first_access){
	pte->pfn = os_get_victim_from_ipt(os);
	ipte = &ipt->entries[ pte->pfn ]; 
	ipte->valid = TRUE;
	ipte->dirty = FALSE;
	ipte->vpn   = vpn;
	assert( (uns)pt->entries->count <= pt->max_entries);
	pt->miss_count++;
	*hit=FALSE;
    }

    ipte = &ipt->entries[ pte->pfn ]; 
    ipte->ref = TRUE;
    
    pt->last_xlation[tid].vpn = vpn;
    pt->last_xlation[tid].pfn = pte->pfn;

    return pte->pfn;
}


////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

uns os_get_victim_from_ipt(OS *os)
{
    PageTable *pt = os->pt;
    InvPageTable *ipt = os->ipt;
    uns ptr = ipt->refptr;
    uns max = ipt->num_entries;
    Flag found=FALSE;
    uns victim=0;
    uns random_invalid_tries=OS_NUM_RND_TRIES;
    uns tries=0;
    tries=tries; // To avoid warning
    random_invalid_tries=random_invalid_tries; //To avoid warning
    // try random invalid first
    while( tries < random_invalid_tries){
	victim = rand()%max;
	if(! ipt->entries[victim].valid ){
	    found = TRUE;
	    break;
	}
	tries++;
    }
    // try finding a victim if no invalid victim
    while(!found){
	  if( ! ipt->entries[ ptr ].valid ){
	    found = TRUE;
	  }
	
	  if( ipt->entries[ ptr ].valid && ipt->entries[ ptr ].ref == FALSE){
	    found = hash_table_access_delete(pt->entries, ipt->entries[ptr].vpn);
	    assert(found);
	  }else{
	    ipt->entries[ptr].ref = FALSE;
	  }
	  victim = ptr;
	  ipt->refptr = (ptr+1)%max;
	  ptr = ipt->refptr;
    }
    // update page writeback information
    if( ipt->entries[victim].valid){
	pt->total_evicts++;
	if(ipt->entries[victim].dirty ){
	    pt->evicted_dirty_page++;
	}
    }  
    return victim; 
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

void os_print_stats(OS *os)
{
    char header[256];
    sprintf(header, "OS");
    
    printf("\n\n");
    printf("\n%s_PAGE_MISS       \t : %llu",  header, os->pt->miss_count);
    printf("\n%s_PAGE_EVICTS     \t : %llu",  header, os->pt->total_evicts);
    printf("\n%s_FOOTPRINT       \t : %llu",  header, (os->pt->miss_count*OS_PAGESIZE)/(1024*1024));
    printf("\n");

}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

Addr os_v2p_lineaddr(OS *os, Addr lineaddr, uns tid, Flag* pagehit, uns* delay){
  uns vpn = lineaddr/os->lines_in_page;
  uns lineid = lineaddr%os->lines_in_page;
  uns pfn = os_vpn_to_pfn(os, vpn, tid, pagehit);
  Addr retval = (pfn*os->lines_in_page)+lineid;
  retval=retval<<6; //As the cache line is 64 bytes

  //Delay
  *delay = 0;

  return retval;
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
//TLB

uns os_v2p_lineaddr_pfn(OS *os, Addr lineaddr, uns tid, Flag* pagehit, uns* delay) {
  uns vpn = lineaddr/os->lines_in_page;
  uns lineid = lineaddr%os->lines_in_page;
  uns pfn = os_vpn_to_pfn(os, vpn, tid, pagehit);

  //Delay
  *delay = 0;

  return pfn;
}


Addr os_v2p_lineaddr_tlb(OS *os, Addr lineaddr, uns tid, uns* delay) {
    uns vpn = lineaddr/os->lines_in_page;
    uns lineid = lineaddr%os->lines_in_page;

    //Search TLB
    int row;
    int32 pfn_tlb_search = os_tlb_search(os, vpn, tid, &row);

    //Hit:  update TLB (LRU position)
    //      return address with 1 cycle delay
    if (pfn_tlb_search != -1) {
        assert(pfn_tlb_search > 0);
        //update LRU
        for (int i=0; i<os->tlb->num_entries; i++) {
            uns LRU = os->tlb->entries[row].LRU_position;
            if(os->tlb->entries[i].LRU_position < LRU )
               os->tlb->entries[i].LRU_position++; 
        }
        os->tlb->entries[row].LRU_position = 0;

        //return address with 1 cycle delay
        *delay = 1;
        Addr retval = (pfn_tlb_search*os->lines_in_page)+lineid;
        retval=retval<<6;
        return retval;
    }


    //Miss:
    //      update TLB
    //      send memory read request
    //          hit: done
    //          miss: add hdd access time
    Flag pagehit;
    uns pfn = os_v2p_lineaddr_pfn(os, lineaddr, tid, &pagehit, delay);

    // update TLB: insert new element
    for (int i=0; i<os->tlb->num_entries; i++)
            os->tlb->entries[i].LRU_position++;

    if (os->tlb->num_entries < TLB_SIZE) {
        //TLB is still empty
        os->tlb->entries[os->tlb->num_entries].LRU_position = 0;
        os->tlb->entries[os->tlb->num_entries].tid = tid;
        os->tlb->entries[os->tlb->num_entries].pair.vpn = vpn;
        os->tlb->entries[os->tlb->num_entries].pair.pfn = pfn;

        os->tlb->num_entries++;
    }
    else {
        //TLB is full - kickout oldest entry
        int oldest;
        for (int i=0; i<os->tlb->num_entries; i++)
            if(os->tlb->entries[i].LRU_position == os->tlb->num_entries) {
                oldest = i;
                break;
            }
        os->tlb->entries[oldest].LRU_position = 0;
        os->tlb->entries[oldest].tid = tid;
        os->tlb->entries[oldest].pair.vpn = vpn;
        os->tlb->entries[oldest].pair.pfn = pfn;
    }

    // send memory read request
    ROB[tid].mem_address[ROB[tid].tail] = PTBR + vpn;
    ROB[tid].optype[ROB[tid].tail] = 'R';
    ROB[tid].comptime[ROB[tid].tail] = CYCLE_VAL + BIGNUM;
    ROB[tid].instrpc[ROB[tid].tail] = 0;

    insert_read(PTBR + vpn, CYCLE_VAL, tid, ROB[tid].tail, 0);

    ROB[tid].tail = (ROB[tid].tail +1) % ROBSIZE;
    ROB[tid].inflight++;

    // Page fault! add hdd access time
    if (!pagehit) {}
}

int32 os_tlb_search(OS *os, uns vpn, uns tid, int* row) {
    for (int i=0; i<os->tlb->num_entries; i++) {
        if (tid == os->tlb->entries[i].tid)
            if (vpn == os->tlb->entries[i].pair.vpn) {
                *row = i;
                return os->tlb->entries[i].pair.pfn;
            }
    }

    //not found
    return -1;
}