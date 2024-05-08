# 时钟信号约束
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk }];
# VGA信号约束
set_property -dict { PACKAGE_PIN A6 IOSTANDARD LVCMOS33 } [get_ports { vgaGreen[3] }];
set_property -dict { PACKAGE_PIN B6 IOSTANDARD LVCMOS33 } [get_ports { vgaGreen[2] }];
set_property -dict { PACKAGE_PIN A5 IOSTANDARD LVCMOS33 } [get_ports { vgaGreen[1] }];
set_property -dict { PACKAGE_PIN C6 IOSTANDARD LVCMOS33 } [get_ports { vgaGreen[0] }];

set_property -dict { PACKAGE_PIN A4 IOSTANDARD LVCMOS33 } [get_ports { vgaRed[3] }];
set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS33 } [get_ports { vgaRed[2] }];
set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS33 } [get_ports { vgaRed[1] }];
set_property -dict { PACKAGE_PIN A3 IOSTANDARD LVCMOS33 } [get_ports { vgaRed[0] }];

set_property -dict { PACKAGE_PIN D8 IOSTANDARD LVCMOS33 } [get_ports { vgaBlue[3] }];
set_property -dict { PACKAGE_PIN D7 IOSTANDARD LVCMOS33 } [get_ports { vgaBlue[2] }];
set_property -dict { PACKAGE_PIN C7 IOSTANDARD LVCMOS33 } [get_ports { vgaBlue[1] }];
set_property -dict { PACKAGE_PIN B7 IOSTANDARD LVCMOS33 } [get_ports { vgaBlue[0] }];

# VGA同步信号约束
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports { Hsync }];
set_property -dict { PACKAGE_PIN B12 IOSTANDARD LVCMOS33 } [get_ports { Vsync }];

# 复位信号约束
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { rst }];

# 按键信号约束
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { key[3] }];
set_property -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS33 } [get_ports { key[2] }];
set_property -dict { PACKAGE_PIN P17 IOSTANDARD LVCMOS33 } [get_ports { key[1] }];
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { key[0] }];

# MP3信号约束
set_property IOSTANDARD LVCMOS33 [get_ports XCS]
set_property IOSTANDARD LVCMOS33 [get_ports XDCS]
set_property IOSTANDARD LVCMOS33 [get_ports XRESET]
set_property IOSTANDARD LVCMOS33 [get_ports SCK]
set_property IOSTANDARD LVCMOS33 [get_ports SI]
set_property IOSTANDARD LVCMOS33 [get_ports DREQ]
set_property IOSTANDARD LVCMOS33 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports over]

set_property PACKAGE_PIN J2 [get_ports DREQ]
set_property PACKAGE_PIN F6 [get_ports XRESET]
set_property PACKAGE_PIN K1 [get_ports XDCS]
set_property PACKAGE_PIN E7 [get_ports XCS]
set_property PACKAGE_PIN J4 [get_ports SI]
set_property PACKAGE_PIN J3 [get_ports SCK]
set_property PACKAGE_PIN H17 [get_ports start]
set_property PACKAGE_PIN V11 [get_ports over]

# 数码管信号约束

##7 segment display

set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { seg[0] }]; #IO_L24N_T3_A00_D16_14 Sch=ca
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { seg[1] }]; #IO_25_14 Sch=cb
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { seg[2] }]; #IO_25_15 Sch=cc
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { seg[3] }]; #IO_L17P_T2_A26_15 Sch=cd
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { seg[4] }]; #IO_L13P_T2_MRCC_14 Sch=ce
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { seg[5] }]; #IO_L19P_T3_A10_D26_14 Sch=cf
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { seg[6] }]; #IO_L4P_T0_D04_14 Sch=cg

set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { seg[7] }]; #IO_L19N_T3_A21_VREF_15 Sch=dp

set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { an[0] }]; #IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { an[1] }]; #IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { an[2] }]; #IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { an[3] }]; #IO_L19P_T3_A22_15 Sch=an[3]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { an[4] }]; #IO_L8N_T1_D12_14 Sch=an[4]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { an[5] }]; #IO_L14P_T2_SRCC_14 Sch=an[5]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { an[6] }]; #IO_L23P_T3_35 Sch=an[6]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { an[7] }]; #IO_L23N_T3_A02_D18_14 Sch=an[7]