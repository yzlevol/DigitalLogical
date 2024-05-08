######################################################################
#
# File name : logic_gates_tb_simulate.do
# Created on: Thu Sep 28 14:46:27 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.logic_gates_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {logic_gates_tb_wave.do}

view wave
view structure
view signals

do {logic_gates_tb.udo}

run 1000ns
