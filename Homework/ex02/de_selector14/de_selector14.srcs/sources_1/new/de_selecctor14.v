`timescale 1ns / 1ps
module de_selector14(
    input iC,   // ���������ź� c
    input iS1,  // ѡ���ź� s1
    input iS0,  // ѡ���ź� s0
    output oZ0, // ��������ź� z0
    output oZ1, // ��������ź� z1
    output oZ2, // ��������ź� z2
    output oZ3  // ��������ź� z3
);

    assign oZ0 = (~iS1 & ~iS0) ? iC : 1'b1;
    assign oZ1 = (~iS1 & iS0) ? iC : 1'b1;
    assign oZ2 = (iS1 & ~iS0) ? iC : 1'b1;
    assign oZ3 = (iS1 & iS0)  ? iC : 1'b1;

endmodule
