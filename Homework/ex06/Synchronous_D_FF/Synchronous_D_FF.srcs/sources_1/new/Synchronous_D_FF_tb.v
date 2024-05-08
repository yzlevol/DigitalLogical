`timescale 1ns / 1ps

module Synchronous_D_FF_tb;
    reg CLK;
    reg D;
    reg RST_n;

    wire Q1;
    wire Q2;

    Synchronous_D_FF uut (
        .CLK(CLK), 
        .D(D), 
        .RST_n(RST_n), 
        .Q1(Q1), 
        .Q2(Q2)
    );
    initial 
        CLK=0;
    always
        #40 CLK = ~CLK;
        
    initial begin
        D = 0;
        RST_n = 0;
        #40 D=0;
        #1 RST_n =0;
        #40 D=1;
        #1 RST_n =0;
        #40 D=1;
        #1 RST_n =1;
        #40 D=0;
        #1 RST_n =0;
        #40 D=0;
        #1 RST_n =1;
        #40 D=1;
        #40 D=0;
    end
endmodule
