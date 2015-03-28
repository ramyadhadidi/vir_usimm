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

Addr_t GetTag(LLCache* llcache, Addr_t addr);
UINT32 GetSetIndex(LLCache* llcache, Addr_t addr);
void InitCache(LLCache * llcache);
void InitStats(LLCache *llcache);
void construct_cache(LLCache* llcache, UINT32 _cacheSize, UINT32 _assoc, UINT32 _tpc, UINT32 _linesize);
INT32 GetVictimInSet( LLCache* llcache, UINT32 tid, UINT32 setIndex, Addr_t PC, Addr_t paddr, UINT32 accessType );
void UpdateLRU( LLCache* llcache, UINT32 setIndex, INT32 updateWayID );
INT32 LookupSet( LLCache* llcache, UINT32 setIndex, Addr_t tag );
bool CacheInspect( LLCache* llcache, UINT32 tid, Addr_t PC, Addr_t paddr, UINT32 accessType );
LINE_STATE* CacheIsWriteback( LLCache* llcache, UINT32 tid, Addr_t PC, Addr_t paddr, UINT32 accessType );
bool LookupAndFillCache( LLCache* llcache, UINT32 tid, Addr_t PC, Addr_t paddr, UINT32 accessType );
void print_cache_stats(LLCache * llcache);


#endif
