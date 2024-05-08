`timescale 1ns / 1ps
module transmission8(
    input [7:0] iData,     //输入信号 D7~D0
    input A, B, C,         //选择信号 S2~S0
    output [7:0] oData     //输出信号 f7~f0
);
    assign oData[0] = (~A & ~B & ~C) ? iData[0] : 8'b1; // D0 -> f0    000
    assign oData[1] = (~A & ~B & C) ? iData[1] : 8'b1;  // D1 -> f1    001
    assign oData[2] = (~A & B & ~C) ? iData[2] : 8'b1;  // D2 -> f2    010
    assign oData[3] = (~A & B & C) ? iData[3] : 8'b1;   // D3 -> f3    011
    assign oData[4] = (A & ~B & ~C) ? iData[4] : 8'b1;  // D4 -> f4    100
    assign oData[5] = (A &~ B & C) ? iData[5] : 8'b1;   // D5 -> f5    101
    assign oData[6] = (A & B & ~C) ? iData[6] : 8'b1;   // D6 -> f6    110
    assign oData[7] = (A & B & C) ? iData[7] : 8'b1;    // D7 -> f7    111

endmodule


