echo "VirUsimm SPEC mcf"
/home/ramyad/vir_usimm/bin/usimm 1 1 /home/ramyad/vir_usimm/input/17channel.cfg /home/ramyad/vir_usimm/input/SPEC/mcf > /home/ramyad/vir_usimm/output/17Apr_SPEC_mcf_PIM1_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 2 /home/ramyad/vir_usimm/input/18channel.cfg /home/ramyad/vir_usimm/input/SPEC/mcf > /home/ramyad/vir_usimm/output/17Apr_SPEC_mcf_PIM2_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 4 /home/ramyad/vir_usimm/input/20channel.cfg /home/ramyad/vir_usimm/input/SPEC/mcf > /home/ramyad/vir_usimm/output/17Apr_SPEC_mcf_PIM4_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 8 /home/ramyad/vir_usimm/input/24channel.cfg /home/ramyad/vir_usimm/input/SPEC/mcf > /home/ramyad/vir_usimm/output/17Apr_SPEC_mcf_PIM8_16_tlb128.o

/home/ramyad/vir_usimm/bin/usimm 0 8 /home/ramyad/vir_usimm/input/1channel.cfg /home/ramyad/vir_usimm/input/SPEC/mcf > /home/ramyad/vir_usimm/output/17Apr_SPEC_mcf_ch1_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 0 8 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/SPEC/mcf > /home/ramyad/vir_usimm/output/17Apr_SPEC_mcf_ch16_tlb128.o
