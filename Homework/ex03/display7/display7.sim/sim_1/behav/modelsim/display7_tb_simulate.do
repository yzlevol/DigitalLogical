######################################################################
#
# File name : display7_tb_simulate.do
# Created on: Thu Oct 19 22:49:25 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.display7_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {display7_tb_wave.do}

view wave
view structure
view signals

do {display7_tb.udo}

run 1000ns
