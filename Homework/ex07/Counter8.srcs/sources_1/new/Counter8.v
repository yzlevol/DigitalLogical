`timescale 1ns / 1ps

module Counter8(
    input CLK,
    input rst_n,
    output [2:0] oQ,
    output [6:0] oDisplay
    );
    wire [2:0]TQ;
    JK_FF jk0(.CLK(CLK), .J(1'b1), .K(1'b1),  .RST_n(rst_n), .Q1(oQ[0]), .Q2(TQ[0]));
    JK_FF jk1(.CLK(CLK), .J(oQ[0]),  .K(oQ[0]), .RST_n(rst_n), .Q1(oQ[1]), .Q2(TQ[1]));
    JK_FF jk2(.CLK(CLK), .J(oQ[1]&oQ[0]), .K(oQ[1]&oQ[0]),.RST_n(rst_n), .Q1(oQ[2]), .Q2(TQ[2]));
    display7 d7(.iData({1'b0,oQ}), .oData(oDisplay) );    
endmodule