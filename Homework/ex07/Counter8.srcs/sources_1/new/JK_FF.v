`timescale 1ns / 1ps

module JK_FF(
    input CLK,
    input J,
    input K,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    
    initial begin
        Q1=0;
        Q2=1;
    end
    always @ (posedge CLK or negedge RST_n) begin
        if(!RST_n) begin
            Q1=0;
            Q2=1;
        end
        else begin
            Q1 <= (J&&Q2)||(~K&&Q1);
            Q2 <= ~((J && Q2) || (~K && Q1));
        end
    end
endmodule
