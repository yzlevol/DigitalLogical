`timescale 1ns / 1ps

module DataCompare8(
    input [7:0] iData_a,
    input [7:0] iData_b,
    output [2:0] oData
);
    wire [2:0] tmp;
    DataCompare4 low(.iData_a(iData_a[3:0]), .iData_b(iData_b[3:0]), .iData(3'b001), .oData(tmp));
    DataCompare4 high(.iData_a(iData_a[7:4]), .iData_b(iData_b[7:4]), .iData(tmp), .oData(oData));
endmodule
