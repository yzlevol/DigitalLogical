######################################################################
#
# File name : testbench_compile.do
# Created on: Sat Oct 07 15:06:25 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -64 -incr -work xil_defaultlib  \
"../../../../selector41.srcs/sources_1/new/selector41.v" \
"../../../../selector41.srcs/sources_1/new/selector41_tb.v" \


# compile glbl module
vlog -work xil_defaultlib "glbl.v"

quit -force

