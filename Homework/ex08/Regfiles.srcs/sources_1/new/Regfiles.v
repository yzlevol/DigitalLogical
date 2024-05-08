`timescale 1ns / 1ps

module Regfiles(
    input clk,
    input rst,
    input we,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    output [31:0] rdata1,
    output [31:0] rdata2
    );
    wire[31:0] decAddr;
    wire[31:0] OutData[31:0];
    
    decoder dec(waddr,we,decAddr);
    
    pcreg reg0(clk, rst, decAddr[0], wdata, OutData[0]);
    pcreg reg1(clk, rst, decAddr[1], wdata, OutData[1]);
    pcreg reg2(clk, rst, decAddr[2], wdata, OutData[2]);
    pcreg reg3(clk, rst, decAddr[3], wdata, OutData[3]);
    pcreg reg4(clk, rst, decAddr[4], wdata, OutData[4]);
    pcreg reg5(clk, rst, decAddr[5], wdata, OutData[5]);
    pcreg reg6(clk, rst, decAddr[6], wdata, OutData[6]);
    pcreg reg7(clk, rst, decAddr[7], wdata, OutData[7]);
    pcreg reg8(clk, rst, decAddr[8], wdata, OutData[8]);
    pcreg reg9(clk, rst, decAddr[9], wdata, OutData[9]);
    pcreg reg10(clk, rst, decAddr[10], wdata,OutData[10]);
    pcreg reg11(clk, rst, decAddr[11], wdata, OutData[11]);
    pcreg reg12(clk, rst, decAddr[12], wdata, OutData[12]);
    pcreg reg13(clk, rst, decAddr[13], wdata, OutData[13]);
    pcreg reg14(clk, rst, decAddr[14], wdata, OutData[14]);
    pcreg reg15(clk, rst, decAddr[15], wdata, OutData[15]);
    pcreg reg16(clk, rst, decAddr[16], wdata, OutData[16]);
    pcreg reg17(clk, rst, decAddr[17], wdata, OutData[17]);
    pcreg reg18(clk, rst, decAddr[18], wdata, OutData[18]);
    pcreg reg19(clk, rst, decAddr[19], wdata, OutData[19]);
    pcreg reg20(clk, rst, decAddr[20], wdata, OutData[20]);
    pcreg reg21(clk, rst, decAddr[21], wdata, OutData[21]);
    pcreg reg22(clk, rst, decAddr[22], wdata, OutData[22]);
    pcreg reg23(clk, rst, decAddr[23], wdata, OutData[23]);
    pcreg reg24(clk, rst, decAddr[24], wdata, OutData[24]);
    pcreg reg25(clk, rst, decAddr[25], wdata, OutData[25]);
    pcreg reg26(clk, rst, decAddr[26], wdata, OutData[26]);
    pcreg reg27(clk, rst, decAddr[27], wdata, OutData[27]);
    pcreg reg28(clk, rst, decAddr[28], wdata, OutData[28]);
    pcreg reg29(clk, rst, decAddr[29], wdata, OutData[29]);
    pcreg reg30(clk, rst, decAddr[30], wdata, OutData[30]);
    pcreg reg31(clk, rst, decAddr[31], wdata, OutData[31]);

     wire re;
    assign re=~we;
    selector321 sel1(
    OutData[0], OutData[1], OutData[2], OutData[3],
    OutData[4], OutData[5], OutData[6], OutData[7],
    OutData[8], OutData[9], OutData[10], OutData[11],
    OutData[12], OutData[13], OutData[14], OutData[15],
    OutData[16], OutData[17], OutData[18], OutData[19],
    OutData[20], OutData[21], OutData[22], OutData[23],
    OutData[24], OutData[25], OutData[26], OutData[27],
    OutData[28], OutData[29], OutData[30], OutData[31],
    raddr1, re, rdata1
  );

    selector321 sel2(
    OutData[0], OutData[1], OutData[2], OutData[3],
    OutData[4], OutData[5], OutData[6], OutData[7],
    OutData[8], OutData[9], OutData[10], OutData[11],
    OutData[12], OutData[13], OutData[14], OutData[15],
    OutData[16], OutData[17], OutData[18], OutData[19],
    OutData[20], OutData[21], OutData[22], OutData[23],
    OutData[24], OutData[25], OutData[26], OutData[27],
    OutData[28], OutData[29], OutData[30], OutData[31],
    raddr2, re, rdata2
  );
endmodule
