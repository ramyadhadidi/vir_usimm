#!/usr/bin/perl -w

#******************************************************************************
# Benchmark Sets
# ************************************************************

%SUITES = ();

#***************************************************************
# SPEC2006 HIGH MPKI SUITE from IMAT TRACES
#***************************************************************
$SUITES{'spec2006_hmpki'}      = 
'input/hmc.cfg input/SPEC2006/mcf input/SPEC2006/mcf input/SPEC2006/mcf input/SPEC2006/mcf
input/hmc.cfg input/SPEC2006/lbm input/SPEC2006/lbm input/SPEC2006/lbm input/SPEC2006/lbm
input/hmc.cfg input/SPEC2006/soplex input/SPEC2006/soplex input/SPEC2006/soplex input/SPEC2006/soplex
input/hmc.cfg input/SPEC2006/milc input/SPEC2006/milc input/SPEC2006/milc input/SPEC2006/milc
input/hmc.cfg input/SPEC2006/libquantum input/SPEC2006/libquantum input/SPEC2006/libquantum input/SPEC2006/libquantum
input/hmc.cfg input/SPEC2006/omnetpp input/SPEC2006/omnetpp input/SPEC2006/omnetpp input/SPEC2006/omnetpp
input/hmc.cfg input/SPEC2006/gcc input/SPEC2006/gcc input/SPEC2006/gcc input/SPEC2006/gcc
input/hmc.cfg input/SPEC2006/sphinx input/SPEC2006/sphinx input/SPEC2006/sphinx input/SPEC2006/sphinx
input/hmc.cfg input/SPEC2006/GemsFDTD input/SPEC2006/GemsFDTD input/SPEC2006/GemsFDTD input/SPEC2006/GemsFDTD
input/hmc.cfg input/SPEC2006/leslie3d input/SPEC2006/leslie3d input/SPEC2006/leslie3d input/SPEC2006/leslie3d
input/hmc.cfg input/SPEC2006/wrf input/SPEC2006/wrf input/SPEC2006/wrf input/SPEC2006/wrf
input/hmc.cfg input/SPEC2006/cactusADM input/SPEC2006/cactusADM input/SPEC2006/cactusADM input/SPEC2006/cactusADM
input/hmc.cfg input/SPEC2006/zeusmp input/SPEC2006/zeusmp input/SPEC2006/zeusmp input/SPEC2006/zeusmp
input/hmc.cfg input/SPEC2006/bzip2 input/SPEC2006/bzip2 input/SPEC2006/bzip2 input/SPEC2006/bzip2
input/hmc.cfg input/SPEC2006/dealII input/SPEC2006/dealII input/SPEC2006/dealII input/SPEC2006/dealII
input/hmc.cfg input/SPEC2006/xalancbmk input/SPEC2006/xalancbmk input/SPEC2006/xalancbmk input/SPEC2006/xalancbmk';

$SUITES{'spec2006_hmpki_name'}      = 
'mcf
lbm
soplex
milc
libquantum
omnetpp
bwaves
gcc
sphinx
GemsFDTD
leslie3d
wrf
cactusADM
zeusmp
bzip2
dealII
xalancbmk';

#***************************************************************
# SPEC2006 SUITE from IMAT TRACES
#***************************************************************
$SUITES{'spec2006'}      = 
'input/hmc.cfg input/SPEC2006/mcf input/SPEC2006/mcf input/SPEC2006/mcf input/SPEC2006/mcf
input/hmc.cfg input/SPEC2006/lbm input/SPEC2006/lbm input/SPEC2006/lbm input/SPEC2006/lbm
input/hmc.cfg input/SPEC2006/soplex input/SPEC2006/soplex input/SPEC2006/soplex input/SPEC2006/soplex
input/hmc.cfg input/SPEC2006/milc input/SPEC2006/milc input/SPEC2006/milc input/SPEC2006/milc
input/hmc.cfg input/SPEC2006/libquantum input/SPEC2006/libquantum input/SPEC2006/libquantum input/SPEC2006/libquantum
input/hmc.cfg input/SPEC2006/omnetpp input/SPEC2006/omnetpp input/SPEC2006/omnetpp input/SPEC2006/omnetpp
input/hmc.cfg input/SPEC2006/bwaves input/SPEC2006/bwaves input/SPEC2006/bwaves input/SPEC2006/bwaves
input/hmc.cfg input/SPEC2006/gcc input/SPEC2006/gcc input/SPEC2006/gcc input/SPEC2006/gcc
input/hmc.cfg input/SPEC2006/sphinx input/SPEC2006/sphinx input/SPEC2006/sphinx input/SPEC2006/sphinx
input/hmc.cfg input/SPEC2006/GemsFDTD input/SPEC2006/GemsFDTD input/SPEC2006/GemsFDTD input/SPEC2006/GemsFDTD
input/hmc.cfg input/SPEC2006/leslie3d input/SPEC2006/leslie3d input/SPEC2006/leslie3d input/SPEC2006/leslie3d
input/hmc.cfg input/SPEC2006/wrf input/SPEC2006/wrf input/SPEC2006/wrf input/SPEC2006/wrf
input/hmc.cfg input/SPEC2006/cactusADM input/SPEC2006/cactusADM input/SPEC2006/cactusADM input/SPEC2006/cactusADM
input/hmc.cfg input/SPEC2006/zeusmp input/SPEC2006/zeusmp input/SPEC2006/zeusmp input/SPEC2006/zeusmp
input/hmc.cfg input/SPEC2006/bzip2 input/SPEC2006/bzip2 input/SPEC2006/bzip2 input/SPEC2006/bzip2
input/hmc.cfg input/SPEC2006/dealII input/SPEC2006/dealII input/SPEC2006/dealII input/SPEC2006/dealII
input/hmc.cfg input/SPEC2006/xalancbmk input/SPEC2006/xalancbmk input/SPEC2006/xalancbmk input/SPEC2006/xalancbmk
input/hmc.cfg input/SPEC2006/hmmer input/SPEC2006/hmmer input/SPEC2006/hmmer input/SPEC2006/hmmer
input/hmc.cfg input/SPEC2006/perlbench input/SPEC2006/perlbench input/SPEC2006/perlbench input/SPEC2006/perlbench
input/hmc.cfg input/SPEC2006/h264 input/SPEC2006/h264 input/SPEC2006/h264 input/SPEC2006/h264
input/hmc.cfg input/SPEC2006/astar input/SPEC2006/astar input/SPEC2006/astar input/SPEC2006/astar
input/hmc.cfg input/SPEC2006/gromacs input/SPEC2006/gromacs input/SPEC2006/gromacs input/SPEC2006/gromacs
input/hmc.cfg input/SPEC2006/gobmk input/SPEC2006/gobmk input/SPEC2006/gobmk input/SPEC2006/gobmk
input/hmc.cfg input/SPEC2006/sjeng input/SPEC2006/sjeng input/SPEC2006/sjeng input/SPEC2006/sjeng
input/hmc.cfg input/SPEC2006/namd input/SPEC2006/namd input/SPEC2006/namd input/SPEC2006/namd
input/hmc.cfg input/SPEC2006/tonto input/SPEC2006/tonto input/SPEC2006/tonto input/SPEC2006/tonto
input/hmc.cfg input/SPEC2006/calculix input/SPEC2006/calculix input/SPEC2006/calculix input/SPEC2006/calculix
input/hmc.cfg input/SPEC2006/gamess input/SPEC2006/gamess input/SPEC2006/gamess input/SPEC2006/gamess
input/hmc.cfg input/SPEC2006/povray input/SPEC2006/povray input/SPEC2006/povray input/SPEC2006/povray';

$SUITES{'spec2006_name'}      = 
'mcf
lbm
soplex
milc
libquantum
omnetpp
bwaves
gcc
sphinx
GemsFDTD
leslie3d
wrf
cactusADM
zeusmp
bzip2
dealII
xalancbmk
hmmer
perlbench
h264
astar
gromacs
gobmk
sjeng
namd
tonto
calculix
gamess
povray';


#**************************************************************
# SPEC INT
#**************************************************************
$SUITES{'spec_int'}      = 
'input/1channel.cfg input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out 
input/1channel.cfg input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out
input/1channel.cfg input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/1channel.cfg input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/1channel.cfg input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out
input/4channel.cfg input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out 
input/4channel.cfg input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out
input/4channel.cfg input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/4channel.cfg input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/4channel.cfg input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out';

$SUITES{'spec_int_name'}      = 
'gcc-1ch
mcf-1ch
libq-1ch
lbm-1ch
omnetpp-1ch
gcc-4ch
mcf-4ch
libq-4ch
lbm-4ch
omnetpp-4ch';

$SUITES{'spec_int_name1'}      = 
'gcc-1ch
mcf-1ch
libq-1ch
lbm-1ch
omnetpp-1ch';

$SUITES{'spec_int_name4'}      = 
'gcc-4ch
mcf-4ch
libq-4ch
lbm-4ch
omnetpp-4ch';

#**************************************************************
# SPEC FP
#**************************************************************
$SUITES{'spec_fp'}      = 
'input/1channel.cfg input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out
input/1channel.cfg input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out
input/1channel.cfg input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out
input/1channel.cfg input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out
input/1channel.cfg input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out
input/4channel.cfg input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out
input/4channel.cfg input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out
input/4channel.cfg input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out
input/4channel.cfg input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out
input/4channel.cfg input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out';

$SUITES{'spec_fp_name'}      = 
'milc-1ch
leslie3d-1ch
soplex-1ch
GemsFDTD-1ch
wrf-1ch
milc-4ch
leslie3d-4ch
soplex-4ch
GemsFDTD-4ch
wrf-4ch';

$SUITES{'spec_fp_name1'}      = 
'milc-1ch
leslie3d-1ch
soplex-1ch
GemsFDTD-1ch
wrf-1ch';

$SUITES{'spec_fp_name4'}      = 
'milc-4ch
leslie3d-4ch
soplex-4ch
GemsFDTD-4ch
wrf-4ch';

#**************************************************************
# PARSEC
#**************************************************************
$SUITES{'parsec'}      = 
'input/1channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/1channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/1channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/1channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/1channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/1channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/1channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/1channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/1channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid 
input/4channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/4channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/4channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/4channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/4channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/4channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/4channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/4channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/4channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid';

$SUITES{'parsec_name1'}      = 
'black-1ch
face-1ch
ferret-1ch
fluid-1ch
freq-1ch
stream-1ch
swapt-1ch
MT-canneal-1ch
MT-fluid-1ch
black-4ch
face-4ch
ferret-4ch
fluid-4ch
freq-4ch
stream-4ch
swapt-4ch
MT-canneal-4ch
MT-fluid-4ch';

$SUITES{'parsec_name1'}      = 
'black-1ch
face-1ch
ferret-1ch
fluid-1ch
freq-1ch
stream-1ch
swapt-1ch
MT-canneal-1ch
MT-fluid-1ch';

$SUITES{'parsec_name4'}      = 
'black-4ch
face-4ch
ferret-4ch
fluid-4ch
freq-4ch
stream-4ch
swapt-4ch
MT-canneal-4ch
MT-fluid-4ch';

$SUITES{'parsec_test'}      = 
'black-1ch';

#**************************************************************
# BIOBENCH
#**************************************************************
$SUITES{'biobench'}      = 
'input/1channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/1channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr
input/4channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/4channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr';

$SUITES{'biobench_name'}      =
'mummer-1ch
tigr-1ch
mummer-4ch
tigr-4ch';

$SUITES{'biobench_name1'}      =
'mummer-1ch
tigr-1ch';

$SUITES{'biobench_name4'}      =
'mummer-4ch
tigr-4ch';


#**************************************************************
# COMMERCIAL INTEL BENCHMARKS
#**************************************************************
$SUITES{'commintel'}      = 
'input/1channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/1channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/1channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/1channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/1channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5
input/4channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/4channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/4channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/4channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/4channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5';

$SUITES{'commintel_name'}      = 
'comm1-1ch
comm2-1ch
comm3-1ch
comm4-1ch
comm5-1ch
comm1-4ch
comm2-4ch
comm3-4ch
comm4-4ch
comm5-4ch';

$SUITES{'commintel_name1'}      = 
'comm1-1ch
comm2-1ch
comm3-1ch
comm4-1ch
comm5-1ch';

$SUITES{'commintel_name4'}      = 
'comm1-4ch
comm2-4ch
comm3-4ch
comm4-4ch
comm5-4ch';

#**************************************************************
# MIX
#**************************************************************

$SUITES{'mix'}      = 
'input/1channel.cfg input/COMMINTEL/comm1 input/PARSEC/face input/SPECFP/433.milc.su3imp.trace.out input/SPECINT/403.gcc.g23.trace.out
input/1channel.cfg input/COMMINTEL/comm2 input/PARSEC/ferret input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECINT/429.mcf.ref.trace.out
input/1channel.cfg input/COMMINTEL/comm3 input/PARSEC/fluid input/SPECFP/450.soplex.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/1channel.cfg input/COMMINTEL/comm4 input/PARSEC/stream input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/1channel.cfg input/COMMINTEL/comm5 input/PARSEC/swapt input/SPECFP/481.wrf.rsl.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out
input/4channel.cfg input/COMMINTEL/comm1 input/PARSEC/face input/SPECFP/433.milc.su3imp.trace.out input/SPECINT/403.gcc.g23.trace.out
input/4channel.cfg input/COMMINTEL/comm2 input/PARSEC/ferret input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECINT/429.mcf.ref.trace.out
input/4channel.cfg input/COMMINTEL/comm3 input/PARSEC/fluid input/SPECFP/450.soplex.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/4channel.cfg input/COMMINTEL/comm4 input/PARSEC/stream input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/4channel.cfg input/COMMINTEL/comm5 input/PARSEC/swapt input/SPECFP/481.wrf.rsl.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out';

$SUITES{'mix_name'}      = 
'mix1-1ch
mix2-1ch
mix3-1ch
mix4-1ch
mix5-1ch
mix1-4ch
mix2-4ch
mix3-4ch
mix4-4ch
mix5-4ch';

$SUITES{'mix_name1'}      = 
'mix1-1ch
mix2-1ch
mix3-1ch
mix4-1ch
mix5-1ch';

$SUITES{'mix_name4'}      = 
'mix1-4ch
mix2-4ch
mix3-4ch
mix4-4ch
mix5-4ch';

#**************************************************************
# JWAC
#**************************************************************
$SUITES{'jwac'}      = 
'input/1channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/1channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/1channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/1channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/1channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/1channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/1channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/1channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/1channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid 
input/4channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/4channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/4channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/4channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/4channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/4channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/4channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/4channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/4channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid
input/1channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/1channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr
input/4channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/4channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr
input/1channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/1channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/1channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/1channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/1channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5
input/4channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/4channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/4channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/4channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/4channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5
input/1channel.cfg input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie 
input/1channel.cfg input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq
input/4channel.cfg input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie 
input/4channel.cfg input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq';

$SUITES{'jwac_name'}      =
'black-1ch
face-1ch
ferret-1ch
fluid-1ch
freq-1ch
stream-1ch
swapt-1ch
MT-canneal-1ch
MT-fluid-1ch
black-4ch
face-4ch
ferret-4ch
fluid-4ch
freq-4ch
stream-4ch
swapt-4ch
MT-canneal-4ch
MT-fluid-4ch
mummer-1ch
tigr-1ch
mummer-4ch
tigr-4ch
comm1-1ch
comm2-1ch
comm3-1ch
comm4-1ch
comm5-1ch
comm1-4ch
comm2-4ch
comm3-4ch
comm4-4ch
comm5-4ch
leslie-1ch
libq-1ch
leslie-4ch
libq-4ch';

#**************************************************************
# JWAC 4 CHANNEL
#**************************************************************
$SUITES{'jwac_4ch'}      = 
'input/4channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/4channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/4channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/4channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/4channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/4channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/4channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/4channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/4channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid
input/4channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/4channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr
input/4channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/4channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/4channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/4channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/4channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5
input/4channel.cfg input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie 
input/4channel.cfg input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq';

$SUITES{'jwac_4ch_name'}      =
'black-4ch
face-4ch
ferret-4ch
fluid-4ch
freq-4ch
stream-4ch
swapt-4ch
MT-canneal-4ch
MT-fluid-4ch
mummer-4ch
tigr-4ch
comm1-4ch
comm2-4ch
comm3-4ch
comm4-4ch
comm5-4ch
leslie-4ch
libq-4ch';

$SUITES{'jwac_1ch_name'}      =
'black-1ch
face-1ch
ferret-1ch
fluid-1ch
freq-1ch
stream-1ch
swapt-1ch
MT-canneal-1ch
MT-fluid-1ch
mummer-1ch
tigr-1ch
comm1-1ch
comm2-1ch
comm3-1ch
comm4-1ch
comm5-1ch
leslie-1ch
libq-1ch';

#**************************************************************
# misc
#**************************************************************
$SUITES{'misc'}      = 
'input/4channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/4channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid
input/4channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/4channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr
input/4channel.cfg input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie 
input/4channel.cfg input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq
input/1channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/1channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid
input/1channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/1channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr
input/1channel.cfg input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie input/OTHERS/leslie 
input/1channel.cfg input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq input/OTHERS/libq';

$SUITES{'misc_name'}      =
'MT-canneal-4ch
MT-fluid-4ch
mummer-4ch
tigr-4ch
leslie-4ch
libq-4ch
MT-canneal-1ch
MT-fluid-1ch
mummer-1ch
tigr-1ch
leslie-1ch
libq-1ch';

#**************************************************************
# ALL
#**************************************************************
$SUITES{'all'}      = 
'input/1channel.cfg input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out 
input/1channel.cfg input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out
input/1channel.cfg input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/1channel.cfg input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/1channel.cfg input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out
input/4channel.cfg input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out 
input/4channel.cfg input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out
input/4channel.cfg input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/4channel.cfg input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/4channel.cfg input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out
input/1channel.cfg input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out
input/1channel.cfg input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out
input/1channel.cfg input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out
input/1channel.cfg input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out
input/1channel.cfg input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out
input/4channel.cfg input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out
input/4channel.cfg input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out
input/4channel.cfg input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out
input/4channel.cfg input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out
input/4channel.cfg input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out
input/1channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/1channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/1channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/1channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/1channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/1channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/1channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/1channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/1channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid 
input/4channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/4channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/4channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/4channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/4channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/4channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/4channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/4channel.cfg input/PARSEC/MT0-canneal input/PARSEC/MT1-canneal input/PARSEC/MT2-canneal input/PARSEC/MT3-canneal
input/4channel.cfg input/PARSEC/MT0-fluid input/PARSEC/MT1-fluid input/PARSEC/MT2-fluid input/PARSEC/MT3-fluid
input/1channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/1channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr
input/4channel.cfg input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer input/BIOBENCH/mummer
input/4channel.cfg input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr input/BIOBENCH/tigr
input/1channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/1channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/1channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/1channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/1channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5
input/4channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/4channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/4channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/4channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/4channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5
input/1channel.cfg input/COMMINTEL/comm1 input/PARSEC/face input/SPECFP/433.milc.su3imp.trace.out input/SPECINT/403.gcc.g23.trace.out
input/1channel.cfg input/COMMINTEL/comm2 input/PARSEC/ferret input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECINT/429.mcf.ref.trace.out
input/1channel.cfg input/COMMINTEL/comm3 input/PARSEC/fluid input/SPECFP/450.soplex.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/1channel.cfg input/COMMINTEL/comm4 input/PARSEC/stream input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/1channel.cfg input/COMMINTEL/comm5 input/PARSEC/swapt input/SPECFP/481.wrf.rsl.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out
input/4channel.cfg input/COMMINTEL/comm1 input/PARSEC/face input/SPECFP/433.milc.su3imp.trace.out input/SPECINT/403.gcc.g23.trace.out
input/4channel.cfg input/COMMINTEL/comm2 input/PARSEC/ferret input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECINT/429.mcf.ref.trace.out
input/4channel.cfg input/COMMINTEL/comm3 input/PARSEC/fluid input/SPECFP/450.soplex.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/4channel.cfg input/COMMINTEL/comm4 input/PARSEC/stream input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/4channel.cfg input/COMMINTEL/comm5 input/PARSEC/swapt input/SPECFP/481.wrf.rsl.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out';

$SUITES{'all_name'}      =
'gcc-1ch
mcf-1ch
libq-1ch
lbm-1ch
omnetpp-1ch
gcc-4ch
mcf-4ch
libq-4ch
lbm-4ch
omnetpp-4ch
milc-1ch
leslie3d-1ch
soplex-1ch
GemsFDTD-1ch
wrf-1ch
milc-4ch
leslie3d-4ch
soplex-4ch
GemsFDTD-4ch
wrf-4ch
black-1ch
face-1ch
ferret-1ch
fluid-1ch
freq-1ch
stream-1ch
swapt-1ch
MT-canneal-1ch
MT-fluid-1ch
black-4ch
face-4ch
ferret-4ch
fluid-4ch
freq-4ch
stream-4ch
swapt-4ch
MT-canneal-4ch
MT-fluid-4ch
mummer-1ch
tigr-1ch
mummer-4ch
tigr-4ch
comm1-1ch
comm2-1ch
comm3-1ch
comm4-1ch
comm5-1ch
comm1-4ch
comm2-4ch
comm3-4ch
comm4-4ch
comm5-4ch
mix1-1ch
mix2-1ch
mix3-1ch
mix4-1ch
mix5-1ch
mix1-4ch
mix2-4ch
mix3-4ch
mix4-4ch
mix5-4ch';

#**************************************************************
# ALL 4-CHANNEL
#**************************************************************
$SUITES{'all4ch'}      = 
'input/4channel.cfg input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out 
input/4channel.cfg input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out
input/4channel.cfg input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/4channel.cfg input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/4channel.cfg input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out
input/4channel.cfg input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out
input/4channel.cfg input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out
input/4channel.cfg input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out
input/4channel.cfg input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out
input/4channel.cfg input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out
input/4channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/4channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/4channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/4channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/4channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/4channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/4channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/4channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/4channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/4channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/4channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/4channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5
input/4channel.cfg input/COMMINTEL/comm1 input/PARSEC/face input/SPECFP/433.milc.su3imp.trace.out input/SPECINT/403.gcc.g23.trace.out
input/4channel.cfg input/COMMINTEL/comm2 input/PARSEC/ferret input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECINT/429.mcf.ref.trace.out
input/4channel.cfg input/COMMINTEL/comm3 input/PARSEC/fluid input/SPECFP/450.soplex.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/4channel.cfg input/COMMINTEL/comm4 input/PARSEC/stream input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/4channel.cfg input/COMMINTEL/comm5 input/PARSEC/swapt input/SPECFP/481.wrf.rsl.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out';

$SUITES{'all4ch_name'}      =
'gcc-4ch
mcf-4ch
libq-4ch
lbm-4ch
omnetpp-4ch
milc-4ch
leslie3d-4ch
soplex-4ch
GemsFDTD-4ch
wrf-4ch
black-4ch
face-4ch
ferret-4ch
fluid-4ch
freq-4ch
stream-4ch
swapt-4ch
comm1-4ch
comm2-4ch
comm3-4ch
comm4-4ch
comm5-4ch
mix1-4ch
mix2-4ch
mix3-4ch
mix4-4ch
mix5-4ch';

#**************************************************************
# ALL 1-CHANNEL
#**************************************************************
$SUITES{'all1ch'}      = 
'input/1channel.cfg input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out input/SPECINT/403.gcc.g23.trace.out 
input/1channel.cfg input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out input/SPECINT/429.mcf.ref.trace.out
input/1channel.cfg input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/1channel.cfg input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/1channel.cfg input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out
input/1channel.cfg input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out input/SPECFP/433.milc.su3imp.trace.out
input/1channel.cfg input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECFP/437.leslie3d.leslie3d.trace.out
input/1channel.cfg input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out input/SPECFP/450.soplex.ref.trace.out
input/1channel.cfg input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECFP/459.GemsFDTD.ref.trace.out
input/1channel.cfg input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out input/SPECFP/481.wrf.rsl.trace.out
input/1channel.cfg input/PARSEC/black input/PARSEC/black input/PARSEC/black input/PARSEC/black
input/1channel.cfg input/PARSEC/face input/PARSEC/face input/PARSEC/face input/PARSEC/face
input/1channel.cfg input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret input/PARSEC/ferret
input/1channel.cfg input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid input/PARSEC/fluid
input/1channel.cfg input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq input/PARSEC/freq
input/1channel.cfg input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream input/PARSEC/stream
input/1channel.cfg input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt input/PARSEC/swapt
input/1channel.cfg input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1 input/COMMINTEL/comm1
input/1channel.cfg input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2 input/COMMINTEL/comm2
input/1channel.cfg input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3 input/COMMINTEL/comm3
input/1channel.cfg input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4 input/COMMINTEL/comm4
input/1channel.cfg input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5 input/COMMINTEL/comm5
input/1channel.cfg input/COMMINTEL/comm1 input/PARSEC/face input/SPECFP/433.milc.su3imp.trace.out input/SPECINT/403.gcc.g23.trace.out
input/1channel.cfg input/COMMINTEL/comm2 input/PARSEC/ferret input/SPECFP/437.leslie3d.leslie3d.trace.out input/SPECINT/429.mcf.ref.trace.out
input/1channel.cfg input/COMMINTEL/comm3 input/PARSEC/fluid input/SPECFP/450.soplex.ref.trace.out input/SPECINT/462.libquantum.ref.trace.out
input/1channel.cfg input/COMMINTEL/comm4 input/PARSEC/stream input/SPECFP/459.GemsFDTD.ref.trace.out input/SPECINT/470.lbm.lbm.trace.out
input/1channel.cfg input/COMMINTEL/comm5 input/PARSEC/swapt input/SPECFP/481.wrf.rsl.trace.out input/SPECINT/471.omnetpp.omnetpp.trace.out';

$SUITES{'all1ch_name'}      =
'gcc-1ch
mcf-1ch
libq-1ch
lbm-1ch
omnetpp-1ch
milc-1ch
leslie3d-1ch
soplex-1ch
GemsFDTD-1ch
wrf-1ch
black-1ch
face-1ch
ferret-1ch
fluid-1ch
freq-1ch
stream-1ch
swapt-1ch
comm1-1ch
comm2-1ch
comm3-1ch
comm4-1ch
comm5-1ch
mix1-1ch
mix2-1ch
mix3-1ch
mix4-1ch
mix5-1ch';

$SUITES{'all_name1'}      =
'gcc-1ch
mcf-1ch
libq-1ch
lbm-1ch
omnetpp-1ch
milc-1ch
leslie3d-1ch
soplex-1ch
GemsFDTD-1ch
wrf-1ch
black-1ch
face-1ch
ferret-1ch
fluid-1ch
freq-1ch
stream-1ch
swapt-1ch
MT-canneal-1ch
MT-fluid-1ch
mummer-1ch
tigr-1ch
comm1-1ch
comm2-1ch
comm3-1ch
comm4-1ch
comm5-1ch
mix1-1ch
mix2-1ch
mix3-1ch
mix4-1ch
mix5-1ch';

$SUITES{'all_name4'}      =
'gcc-4ch
mcf-4ch
libq-4ch
lbm-4ch
omnetpp-4ch
milc-4ch
leslie3d-4ch
soplex-4ch
GemsFDTD-4ch
wrf-4ch
black-4ch
face-4ch
ferret-4ch
fluid-4ch
freq-4ch
stream-4ch
swapt-4ch
MT-canneal-4ch
MT-fluid-4ch
mummer-4ch
tigr-4ch
comm1-4ch
comm2-4ch
comm3-4ch
comm4-4ch
comm5-4ch
mix1-4ch
mix2-4ch
mix3-4ch
mix4-4ch
mix5-4ch';

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$SUITES{'rb'}      =
'input/1channel.cfg input/black
input/1channel.cfg input/comm1';

$SUITES{'rb_name'}      = 
'black-1ch
comm1-1ch';

$SUITES{'testA'}      = 
'input/1channel.cfg input/black input/black input/black input/black
input/1channel.cfg input/comm1 input/comm1 input/comm1 input/comm1';

$SUITES{'testA_name'}      = 
'black-1ch
comm1-1ch';

$SUITES{'refresh18'}   =
'input/1channel.cfg input/black input/black input/black input/black
input/1channel.cfg input/comm1 input/comm1 input/comm1 input/comm1
input/1channel.cfg input/comm2 input/comm2 input/comm2 input/comm2
input/1channel.cfg input/face input/face input/face input/face 
input/1channel.cfg input/ferret input/ferret input/ferret input/ferret
input/1channel.cfg input/fluid input/fluid input/fluid input/fluid
input/1channel.cfg input/freq input/freq input/freq input/freq
input/1channel.cfg input/stream input/stream input/stream input/stream
input/1channel.cfg input/swapt input/swapt input/swapt input/swapt
input/4channel.cfg input/black input/black input/black input/black
input/4channel.cfg input/comm1 input/comm1 input/comm1 input/comm1
input/4channel.cfg input/comm2 input/comm2 input/comm2 input/comm2
input/4channel.cfg input/face input/face input/face input/face 
input/4channel.cfg input/ferret input/ferret input/ferret input/ferret
input/4channel.cfg input/fluid input/fluid input/fluid input/fluid
input/4channel.cfg input/freq input/freq input/freq input/freq
input/4channel.cfg input/stream input/stream input/stream input/stream
input/4channel.cfg input/swapt input/swapt input/swapt input/swapt';


$SUITES{'refresh18_name'}  =
'black-1ch
comm1-1ch
comm2-1ch
face-1ch
fluid-1ch
ferret-1ch
freq-1ch
stream-1ch
swapt-1ch
black-4ch
comm1-4ch
comm2-4ch
face-4ch
ferret-4ch
fluid-4ch
freq-4ch
stream-4ch
swapt-4ch';

$SUITES{'refresh18_name1'} =
'black-1ch
comm1-1ch
comm2-1ch
face-1ch
fluid-1ch
ferret-1ch
freq-1ch
stream-1ch
swapt-1ch';

$SUITES{'refresh18_name4'} =
'black-4ch
comm1-4ch
comm2-4ch
face-4ch
fluid-4ch
ferret-4ch
freq-4ch
stream-4ch
swapt-4ch';

$SUITES{'e'}   =
'input/4channel.cfg input/demo input/demo input/demo input/demo';

$SUITES{'e_name4'} =
'demo4';

