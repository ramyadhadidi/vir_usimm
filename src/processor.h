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

  int * active;
  unsigned int * waiting_cycles;
  unsigned int total_N_ops;
  unsigned int total_R_ops;
  unsigned int total_W_ops;
  unsigned int total_waiting_N_ops;
  unsigned int total_waiting_R_ops;
  unsigned int total_waiting_W_ops;
};

#endif //__PROCESSOR_H__

