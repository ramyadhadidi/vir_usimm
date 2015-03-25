#ifndef CACHE_H
#define CACHE_H


#include "utils.h"
#include <stdlib.h>
#include <stdbool.h>

#define IS_STORE(X)  (X == ACCESS_STORE || X == ACCESS_WRITEBACK);

extern long long int CYCLE_VAL;
extern int NUMCORES;

typedef enum{
    ACCESS_IFETCH      = 0,
    ACCESS_LOAD        = 1,
    ACCESS_STORE       = 2,
    ACCESS_UNSUPPORT0  = 3,
    ACCESS_UNSUPPORT1  = 4,
    ACCESS_PREFETCH    = 5,
    ACCESS_WRITEBACK   = 6,
    ACCESS_MAX         = 7 
} AccessTypes;



typedef struct{
    bool        valid;
    bool        dirty;
    Addr_t      tag;
    Addr_t      phy_addr;
    Addr_t      PC;
    BITVECTOR   sharing_dir;
    UINT32      LRUstackposition;
}LINE_STATE;

typedef struct{
    UINT32 numsets;
    UINT32 assoc;
    UINT32 threads;
    UINT32 linesize;
    UINT32 replPolicy;

    LINE_STATE               **line;

    // statistics
    COUNTER *lookups[ ACCESS_MAX ];
    COUNTER *misses[ ACCESS_MAX ];
    COUNTER *hits[ ACCESS_MAX ];

    // Lookup Parameters
    UINT32 lineShift;
    UINT32 indexShift;
    UINT32 indexMask;

    COUNTER mytimer;
    
}LLCache;

Addr_t GetTag(LLCache* llcache, Addr_t addr){
    return( (addr >> (llcache->lineShift) ) >> llcache->indexShift);
}

UINT32 GetSetIndex(LLCache* llcache, Addr_t addr){
    return( (addr >> (llcache->lineShift) ) & llcache->indexMask) ;
}


void InitCache(LLCache * llcache)
{
    // Initialize the Cache Access Functions
    llcache->lineShift  = CRC_FloorLog2( llcache->linesize );
    llcache->indexShift = CRC_FloorLog2( llcache->numsets );
    llcache->indexMask  = (1 << (llcache->indexShift)) - 1;

    // Create the cache structure (first create the sets)
    llcache->line = (LINE_STATE**) malloc( sizeof(LINE_STATE*)  *  llcache->numsets );

    // ensure that we were able to create cache
    assert(llcache->line);

    // If we were able to create the sets, now create the ways
    for(UINT32 setIndex=0; setIndex<llcache->numsets; setIndex++)
    {   
        llcache->line[ setIndex ] = malloc(sizeof(LINE_STATE)*(llcache->assoc));

        // Initialize the cache ways
        for(UINT32 way=0; way<llcache->assoc; way++)
        {   
            llcache->line[ setIndex ][ way ].tag   = 0xdeaddead;
            llcache->line[ setIndex ][ way ].valid = false;
            llcache->line[ setIndex ][ way ].dirty = false;
            llcache->line[ setIndex ][ way ].sharing_dir   = 0;
        }
    }

    // Initialize cache access timer
    llcache->mytimer = 0;

}
void InitStats(LLCache *llcache)
{
    for(UINT32 i=0; i<ACCESS_MAX; i++) 
    {   
        llcache->lookups[i] = (COUNTER*)malloc(sizeof( COUNTER)* NUMCORES );
        llcache->misses[i]  = (COUNTER*)malloc(sizeof( COUNTER)* NUMCORES );
        llcache->hits[i]    = (COUNTER*)malloc(sizeof( COUNTER)* NUMCORES );

        for(UINT32 t=0; t<NUMCORES; t++) 
        {   
            llcache->lookups[i][t] = 0;
            llcache->misses[i][t]  = 0;
            llcache->hits[i][t]    = 0;
        }   
    }   
}



void construct_cache(LLCache* llcache, UINT32 _cacheSize, UINT32 _assoc, UINT32 _tpc, UINT32 _linesize) 
{

    // Start off with empty cache and replacement state
    llcache->line          = NULL;

    // Initialize parameters to the cache
    llcache->numsets  = _cacheSize / (_linesize * _assoc);
    llcache->assoc    = _assoc;
    llcache->threads  = _tpc;
    llcache->linesize = _linesize;

    // Initialize the cache
    fprintf(stdout, "Init Cache size=%d assoc=%d\n", _cacheSize, _assoc);
    InitCache(llcache);

    // Initialize the stats
    InitStats(llcache);
}


INT32 GetVictimInSet( LLCache* llcache, UINT32 tid, UINT32 setIndex, Addr_t PC, Addr_t paddr, UINT32 accessType )
{
    // Get pointer to replacement state of current set
    LINE_STATE *vicSet = llcache->line[ setIndex ];

    // First find and fill invalid lines
    for(UINT32 way=0; way<llcache->assoc; way++)
    {   
        if( vicSet[way].valid == false )
        {
            return way;
        }
    }

    // If no invalid lines, then replace based on replacement policy
    // Get pointer to replacement state of current set

    INT32   lruWay   = 0;

    // Search for victim whose stack position is assoc-1
    for(UINT32 way=0; way<llcache->assoc; way++)
    {
        if( vicSet[way].LRUstackposition == (llcache->assoc-1) ) 
        {
            lruWay = way;
            break;
        }
    }
    if(vicSet[lruWay].dirty == true){
 //       fprintf(stdout, "@%lld Evict something dirty\n", CYCLE_VAL);
    }

    // return lru way
    return lruWay;
}

void UpdateLRU( LLCache* llcache, UINT32 setIndex, INT32 updateWayID )
{
    // Determine current LRU stack position
    UINT32 currLRUstackposition = llcache->line[ setIndex ][ updateWayID ].LRUstackposition;

    // Update the stack position of all lines before the current line
    // Update implies incremeting their stack positions by one
    for(UINT32 way=0; way<llcache->assoc; way++)
    {
        if( llcache->line[setIndex][way].LRUstackposition < currLRUstackposition )
        {
            llcache->line[setIndex][way].LRUstackposition++;
        }
    }

    // Set the LRU stack position of new line to be zero
    llcache->line[ setIndex ][ updateWayID ].LRUstackposition = 0;
}

INT32 LookupSet( LLCache* llcache, UINT32 setIndex, Addr_t tag )
{
    // Get pointer to current set
    LINE_STATE *currSet = llcache->line[ setIndex ];

    // Find Tag
    for(UINT32 way=0; way<llcache->assoc; way++)
    {   
        if( currSet[way].valid && (currSet[way].tag == tag) )
        {   
            return way;
        }
    }

    // If not found, return -1
    return -1;
}


bool CacheInspect( LLCache* llcache, UINT32 tid, Addr_t PC, Addr_t paddr, UINT32 accessType )
{   

    UINT32 setIndex = GetSetIndex( llcache, paddr );  // Get the set index
    Addr_t tag      = GetTag( llcache, paddr );       // Determine Cache Tag

    INT32 wayID     = LookupSet( llcache, setIndex, tag );

    // if wayID = -1, miss, else it is a hit
    return (wayID != -1);
}

LINE_STATE* CacheIsWriteback( LLCache* llcache, UINT32 tid, Addr_t PC, Addr_t paddr, UINT32 accessType ){
    UINT32 setIndex = GetSetIndex( llcache, paddr );  // Get the set index
    Addr_t tag      = GetTag( llcache, paddr );       // Determine Cache Tag

    // Lookup the cache set to determine whether line is already in cache or not
    INT32 wayID     = LookupSet( llcache, setIndex, tag );


    if( wayID == -1 )
    {   
        wayID     = GetVictimInSet( llcache, tid, setIndex, PC, paddr, accessType );
        if(wayID != -1){
 //           fprintf(stdout, "@%lld IsWriteback %d\n", CYCLE_VAL, wayID);
            if(llcache->line[setIndex][wayID].dirty == 1){
                return &llcache->line[ setIndex ][ wayID ];
            }else{
                return NULL;
            }
        }else{
            fprintf(stdout, "Should never been here\n");
            assert(0);
        }
    }else{
        return NULL;
    }
    return NULL;
}

bool LookupAndFillCache( LLCache* llcache, UINT32 tid, Addr_t PC, Addr_t paddr, UINT32 accessType )
{   

    LINE_STATE *currLine = NULL;

    // for modeling LRU
    ++llcache->mytimer;

    // manage stats for cache
    llcache->lookups[ accessType ][ tid ]++;

    // Process request
    bool  hit       = true;
    UINT32 setIndex = GetSetIndex( llcache, paddr );  // Get the set index
    Addr_t tag      = GetTag( llcache, paddr );       // Determine Cache Tag

    // Lookup the cache set to determine whether line is already in cache or not
    INT32 wayID     = LookupSet( llcache, setIndex, tag );


    if( wayID == -1 )
    {   
        hit = false;

        // get victim line to replace (wayID = -1, then bypass)
        wayID     = GetVictimInSet( llcache, tid, setIndex, PC, paddr, accessType );

        if( wayID != -1 )
        {   
            currLine  = &llcache->line[ setIndex ][ wayID ];

            // Update the line state accordingly
            currLine->valid          = true;
            currLine->tag            = tag;
            currLine->phy_addr       = paddr;
            currLine->PC             = PC;
            currLine->dirty          = IS_STORE( accessType );
            currLine->sharing_dir    = (1<<tid);

            // Update Replacement State
            UpdateLRU( llcache, setIndex, wayID);
        }

        // Update Stats
        llcache->misses[ accessType ][ tid ]++;
    }
    else
    {
        // get pointer to cache line we hit
        currLine         = &llcache->line[ setIndex ][ wayID ];

        // Update the line state accordingly
        currLine->dirty         |= IS_STORE( accessType );
        currLine->sharing_dir   |= (1<<tid);

        // Update Replacement State
        if( accessType != ACCESS_WRITEBACK )
        {
            UpdateLRU( llcache, setIndex, wayID);
        }

        // Update Stats
        llcache->hits[ accessType ][ tid ]++;
    }

    return hit;
}

void print_cache_stats(LLCache * llcache){
    COUNTER totLookups_type = 0, totMisses_type = 0, totHits_type = 0;
    COUNTER totLookups = 0, totMisses = 0, totHits = 0;

    printf("==========================================================\n");
    printf("==========            LLC Statistics           ===========\n");
    printf("==========================================================\n");
    printf("Cache Configuration: \n");
    printf("\tCache Size:     %dK\n", (llcache->numsets*llcache->assoc*llcache->linesize/1024));
    printf("\tLine Size:      %dB\n", llcache->linesize);
    printf("\tAssociativity:  %d\n", llcache->assoc);
    printf("\tTot # Sets:     %d\n", llcache->numsets);
    printf("\tTot # Threads:  %d\n\n", NUMCORES);
    
    printf("Cache Statistics: \n\n");
    
    for(UINT32 a=0; a<ACCESS_MAX; a++) 
    {   

        totLookups_type = 0;
        totMisses_type = 0;
        totHits_type = 0;
    
        for(UINT32 t=0; t<NUMCORES; t++) 
        {
            totLookups += llcache->lookups[a][t];
            totMisses  += llcache->misses[a][t];
            totHits    += llcache->hits[a][t];

            totLookups_type += llcache->lookups[a][t];
            totMisses_type  += llcache->misses[a][t];
            totHits_type    += llcache->hits[a][t];
        }

        if( totLookups_type ) 
        {
            printf("\t%d Accesses: %lld\n", a, totLookups_type);
            printf("\t%d Misses:   %lld\n", a, totMisses_type);
            printf("\t%d Hits:     %lld\n", a, totHits_type);
            printf("\t%d MissRate \t : %5f\n\n", a, ((double)totMisses_type/(double)totLookups_type)*100.0);

        }
    }
    if( totLookups ) 
    {
        printf("Overall Cache stat:\n");
        printf("Overall_Accesses: %lld\n", totLookups);
        printf("Overall_Misses:   %lld\n", totMisses);
        printf("Overall_Hits:     %lld\n", totHits);
        printf("Overall_MissRate \t : %5f\n\n", ((double)totMisses/(double)totLookups)*100.0);
    }


}


#endif
