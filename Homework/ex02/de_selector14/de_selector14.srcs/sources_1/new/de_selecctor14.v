`timescale 1ns / 1ps
module de_selector14(
    input iC,   // 数据输入信号 c
    input iS1,  // 选择信号 s1
    input iS0,  // 选择信号 s0
    output oZ0, // 数据输出信号 z0
    output oZ1, // 数据输出信号 z1
    output oZ2, // 数据输出信号 z2
    output oZ3  // 数据输出信号 z3
);

    assign oZ0 = (~iS1 & ~iS0) ? iC : 1'b1;
    assign oZ1 = (~iS1 & iS0) ? iC : 1'b1;
    assign oZ2 = (iS1 & ~iS0) ? iC : 1'b1;
    assign oZ3 = (iS1 & iS0)  ? iC : 1'b1;

endmodule
