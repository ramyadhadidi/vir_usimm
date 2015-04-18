echo "VirUsimm GUPS"
/home/ramyad/vir_usimm/bin/usimm 1 1 /home/ramyad/vir_usimm/input/17channel.cfg /home/ramyad/vir_usimm/input/GUPS/gups.out > /home/ramyad/vir_usimm/output/16Apr_GUPS_PIM1_16_tlb1024.o
/home/ramyad/vir_usimm/bin/usimm 1 2 /home/ramyad/vir_usimm/input/18channel.cfg /home/ramyad/vir_usimm/input/GUPS/gups.out > /home/ramyad/vir_usimm/output/16Apr_GUPS_PIM2_16_tlb1024.o
/home/ramyad/vir_usimm/bin/usimm 1 4 /home/ramyad/vir_usimm/input/20channel.cfg /home/ramyad/vir_usimm/input/GUPS/gups.out > /home/ramyad/vir_usimm/output/16Apr_GUPS_PIM4_16_tlb1024.o
/home/ramyad/vir_usimm/bin/usimm 1 8 /home/ramyad/vir_usimm/input/24channel.cfg /home/ramyad/vir_usimm/input/GUPS/gups.out > /home/ramyad/vir_usimm/output/16Apr_GUPS_PIM8_16_tlb1024.o

#/home/ramyad/vir_usimm/bin/usimm 0 8 /home/ramyad/vir_usimm/input/1channel.cfg /home/ramyad/vir_usimm/input/GUPS/gups.out > /home/ramyad/vir_usimm/output/15Apr_GUPS_1ch_tlb128.o
#/home/ramyad/vir_usimm/bin/usimm 0 8 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/GUPS/gups.out > /home/ramyad/vir_usimm/output/15Apr_GUPS_16ch_tlb128.o
#/home/ramyad/vir_usimm/bin/usimm 1 1 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/GRAPH500/s6.out
