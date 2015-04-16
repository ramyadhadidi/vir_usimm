echo "VirUsimm BlackScholes Swapt Fluid"
/home/ramyad/vir_usimm/bin/usimm 0 1 /home/ramyad/vir_usimm/input/1channel.cfg /home/ramyad/vir_usimm/input/PARSEC/black > /home/ramyad/vir_usimm/output/15Apr_PARSEC_black_1ch_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 0 2 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/PARSEC/black > /home/ramyad/vir_usimm/output/15Apr_PARSEC_black_16ch_tlb128.o

/home/ramyad/vir_usimm/bin/usimm 0 1 /home/ramyad/vir_usimm/input/1channel.cfg /home/ramyad/vir_usimm/input/PARSEC/swapt > /home/ramyad/vir_usimm/output/15Apr_PARSEC_swapt_1ch_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 0 2 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/PARSEC/swapt > /home/ramyad/vir_usimm/output/15Apr_PARSEC_swapt_16ch_tlb128.o

/home/ramyad/vir_usimm/bin/usimm 0 1 /home/ramyad/vir_usimm/input/1channel.cfg /home/ramyad/vir_usimm/input/PARSEC/fluid > /home/ramyad/vir_usimm/output/15Apr_PARSEC_fluid_1ch_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 0 2 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/PARSEC/fluid > /home/ramyad/vir_usimm/output/15Apr_PARSEC_fluid_16ch_tlb128.o
#/home/ramyad/vir_usimm/bin/usimm 1 1 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/GRAPH500/s6.out
