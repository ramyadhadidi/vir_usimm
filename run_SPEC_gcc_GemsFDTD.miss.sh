echo "VirUsimm SPEC gcc"
/home/ramyad/vir_usimm/bin/usimm 1 1 /home/ramyad/vir_usimm/input/17channel.cfg /home/ramyad/vir_usimm/input/SPEC/gcc > /home/ramyad/vir_usimm/output/18Apr_SPEC_gcc_PIMmiss1_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 2 /home/ramyad/vir_usimm/input/18channel.cfg /home/ramyad/vir_usimm/input/SPEC/gcc > /home/ramyad/vir_usimm/output/18Apr_SPEC_gcc_PIMmiss2_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 4 /home/ramyad/vir_usimm/input/20channel.cfg /home/ramyad/vir_usimm/input/SPEC/gcc > /home/ramyad/vir_usimm/output/18Apr_SPEC_gcc_PIMmiss4_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 8 /home/ramyad/vir_usimm/input/24channel.cfg /home/ramyad/vir_usimm/input/SPEC/gcc > /home/ramyad/vir_usimm/output/18Apr_SPEC_gcc_PIMmiss8_16_tlb128.o

#/home/ramyad/vir_usimm/bin/usimm 0 8 /home/ramyad/vir_usimm/input/1channel.cfg /home/ramyad/vir_usimm/input/SPEC/gcc > /home/ramyad/vir_usimm/output/18Apr_SPEC_gcc_ch1_tlb128.o
#/home/ramyad/vir_usimm/bin/usimm 0 8 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/SPEC/gcc > /home/ramyad/vir_usimm/output/18Apr_SPEC_gcc_ch16_tlb128.o

####


echo "VirUsimm SPEC GemsFDTD"
/home/ramyad/vir_usimm/bin/usimm 1 1 /home/ramyad/vir_usimm/input/17channel.cfg /home/ramyad/vir_usimm/input/SPEC/GemsFDTD > /home/ramyad/vir_usimm/output/18Apr_SPEC_GemsFDTD_PIMmiss1_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 2 /home/ramyad/vir_usimm/input/18channel.cfg /home/ramyad/vir_usimm/input/SPEC/GemsFDTD > /home/ramyad/vir_usimm/output/18Apr_SPEC_GemsFDTD_PIMmiss2_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 4 /home/ramyad/vir_usimm/input/20channel.cfg /home/ramyad/vir_usimm/input/SPEC/GemsFDTD > /home/ramyad/vir_usimm/output/18Apr_SPEC_GemsFDTD_PIMmiss4_16_tlb128.o
/home/ramyad/vir_usimm/bin/usimm 1 8 /home/ramyad/vir_usimm/input/24channel.cfg /home/ramyad/vir_usimm/input/SPEC/GemsFDTD > /home/ramyad/vir_usimm/output/18Apr_SPEC_GemsFDTD_PIMmiss8_16_tlb128.o

#/home/ramyad/vir_usimm/bin/usimm 0 8 /home/ramyad/vir_usimm/input/1channel.cfg /home/ramyad/vir_usimm/input/SPEC/GemsFDTD > /home/ramyad/vir_usimm/output/18Apr_SPEC_GemsFDTD_ch1_tlb128.o
#/home/ramyad/vir_usimm/bin/usimm 0 8 /home/ramyad/vir_usimm/input/hmc.cfg /home/ramyad/vir_usimm/input/SPEC/GemsFDTD > /home/ramyad/vir_usimm/output/18Apr_SPEC_GemsFDTD_ch16_tlb128.o
