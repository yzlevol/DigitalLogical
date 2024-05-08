######################################################################
#
# File name : DataCompare8_tb_simulate.do
# Created on: Thu Nov 02 14:46:38 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.DataCompare8_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {DataCompare8_tb_wave.do}

view wave
view structure
view signals

do {DataCompare8_tb.udo}

run 1000ns