
###########################################################################
##########  Baseline expts 
###########################################################################


#./runall.pl --w ship8 --f 2  --d "/u/moin/proj/pset/RESULTS/Cache8MB.DIP/" --o  " -cachesizemb 8 -replpolicy dip -leadersets 32 ";

#./runall.pl --w ship8 --f 4  --d "/home/cchou34/Work/CMPSim/CRC/RESULTS/Cache1MB.LRU" --o  " -cache UL3:1024:64:16 -LLCrepl 0 -threads 1";

#./runall.pl --w ship8 --f 4  --d "/home/cchou34/Work/CMPSim/CRC/RESULTS/Cache1MB.RND" --o  " -cache UL3:1024:64:16 -LLCrepl 1 -threads 1";

#./runall.pl --w ship8 --f 4  --d "/home/cchou34/Work/CMPSim/CRC/RESULTS/Cache1MB.DRRIP_sat_rndsel" --o  " -cache UL3:1024:64:16 -LLCrepl 2 -threads 1";

#./runall.pl --w refresh18 --i refresh18_name --f 18  --d "../output_norefresh" --o "0"

./runall.pl --w testA --i testA_name --f 2  --d "../output" --o "3"

#./runall.pl --w testA --i testA_name --f 2  --d "../dir_b" --o "4"

#./runall.pl --w SPEC2K6 --f 4  --d "/home/cchou34/Work/Research/pin-2.8-36111-gcc.3.4.6-ia32_intel64-linux/source/tools/PROJECT_CC/RESULTS/FPC8" --o  " -writetrace 0 -readtrace 1 -cc_scheme 4 ";
#./runall.pl --w SPEC2K6 --f 4  --d "/home/cchou34/Work/Research/pin-2.8-36111-gcc.3.4.6-ia32_intel64-linux/source/tools/PROJECT_CC/RESULTS/FPC8ROC_1" --o  " -writetrace 0 -readtrace 1 -cc_scheme 5 ";
#./runall.pl --w SPEC2K6 --f 4  --d "/home/cchou34/Work/Research/pin-2.8-36111-gcc.3.4.6-ia32_intel64-linux/source/tools/PROJECT_CC/RESULTS/FPC8ROC_2" --o  " -writetrace 0 -readtrace 1 -cc_scheme 6 ";
#./runall.pl --w SPEC2K6 --f 4  --d "/home/cchou34/Work/Research/pin-2.8-36111-gcc.3.4.6-ia32_intel64-linux/source/tools/PROJECT_CC/RESULTS/DYN" --o  " -writetrace 0 -readtrace 1 -cc_scheme 8 ";

#./runall.pl --w ship8 --f 4  --d "/home/cchou34/Work/CMPSim/CRC/RESULTS/Cache2MB.SHiP" --o  " -cache UL3:2048:64:16 -LLCrepl 2 -threads 1";
#./runall.pl --w ship8 --f 4  --d "/home/cchou34/Work/CMPSim/CRC/RESULTS/Cache8MB.DRRIP_sat" --o  " -cache UL3:8196:64:16 -LLCrepl 2 -threads 1";
