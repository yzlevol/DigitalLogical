######################################################################
#
# File name : tb_encoder83_Pri_simulate.do
# Created on: Sat Oct 21 21:09:15 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.tb_encoder83_Pri xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {tb_encoder83_Pri_wave.do}

view wave
view structure
view signals

do {tb_encoder83_Pri.udo}

run 1000ns