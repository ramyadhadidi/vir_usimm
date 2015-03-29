#ifndef OS_H
#define OS_H

#include "global_types.h"
#include "hash_lib.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "params.h"
#include "memory_controller.h"
#include "processor.h"
#include "cache.h"

#define OS_MAX_THREADS 16

#define L3_LATENCY 10
#define HDD_LATENCY 1

#define TLB_SIZE 1024
#define PTBR 123508959
//#define PTBR 0


// ROB Structure, used to release stall on instructions 
// when the read request completes
extern struct robstructure * ROB;
extern long long int CYCLE_VAL;
extern long long int BIGNUM;
extern LLCache *L3Cache;

typedef struct OS                OS;
typedef struct InvPageTableEntry InvPageTableEntry;
typedef struct PageTableEntry    PageTableEntry;
typedef struct PageTable         PageTable;
typedef struct InvPageTable      InvPageTable;
typedef struct VirtualPhysicalPair VirtualPhysicalPair;

typedef struct TLB 				TLB;
typedef struct TLBEntry 	TLBEntry;

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

struct PageTableEntry{
    uns  pfn;
};


struct VirtualPhysicalPair{
  uns vpn;
  uns pfn;
};


struct PageTable{
    Hash_Table  *entries;
    VirtualPhysicalPair last_xlation[OS_MAX_THREADS];
    uns64        max_entries;
    uns64        miss_count;
    uns64        total_evicts;
    uns64        evicted_dirty_page;
};

struct InvPageTableEntry{
    Flag valid;
    Flag dirty;
    Flag ref;
    uns  vpn;
};

struct InvPageTable{
  InvPageTableEntry  *entries;
  uns          num_entries;
  uns          refptr;
};

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
//TLB
struct TLBEntry {
	VirtualPhysicalPair pair;
	uns tid;
	
	uns LRU_position;
};

struct TLB {
	TLBEntry entries[TLB_SIZE];

	uns num_entries;
  uns64 TLB_access;
  uns64 TLB_hit;
  uns64 TLB_miss;
  uns64 TLB_eviction;
  uns64 TLB_L3_hit;
  uns64 TLB_Memory_Access;
  uns64 TLB_HDD_Access;
};

uns os_v2p_lineaddr_pfn(OS *os, Addr lineaddr, uns tid, Flag* pagehit, uns* delay);
Addr os_v2p_lineaddr_tlb(OS *os, Addr lineaddr, uns tid, uns* delay);
uns64 os_tlb_search(OS *os, uns64 vpn, uns tid, int* row, int *found);
//////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


struct OS {
    PageTable        *pt;
    InvPageTable     *ipt;

    uns               lines_in_page;
    uns               num_threads;
    uns64             num_pages;

    TLB*							tlb;
};



///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

OS*     os_new(uns num_pages, uns num_threads);
uns     os_vpn_to_pfn(OS *os, uns64 vpn, uns tid, Flag *hit);
void    os_print_stats(OS *os);

uns     os_get_victim_from_ipt(OS *os);
Addr    os_v2p_lineaddr(OS *os, Addr lineaddr, uns tid, Flag* pagehit, uns* delay);

//////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

#endif // OS_H
