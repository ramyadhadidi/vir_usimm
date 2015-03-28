#ifndef __PROCESSOR_H__
#define __PROCESSOR_H__

struct robstructure
{
  int head;
  int tail;
  int inflight;
  long long int * comptime;
  long long int * mem_address;
  int * optype;
  long long int * instrpc;
  int tracedone;

  long long int * fellow_inst;
  long long int * fellow_mem_address;
  int * fellow_optype;
} ;

#endif //__PROCESSOR_H__

