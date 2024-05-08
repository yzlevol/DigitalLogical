`timescale 1ns / 1ps

module Adder_tb();
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    reg iC;
    
    wire [7:0] oData;
    wire oData_C;
    
    Adder uul(.iData_a(iData_a), .iData_b(iData_b), .iC(iC), .oData(oData), .oData_C(oData_C));
    
    initial
    begin
        iData_a = 8'b0000_1101;
        iData_b = 8'b0000_0010;
        iC = 0;
        
        # 40
        iData_a = 8'b0000_1101;
        iData_b = 8'b0000_1111;
        iC = 0;
        
        # 40
        iData_a = 8'b0000_1011;
        iData_b = 8'b0000_1011;
        iC = 1;

        # 40
        iData_a = 8'b0101_0101;
        iData_b = 8'b1010_0110;
        iC = 1;        
        
        # 40
        iData_a = 8'b1010_1101;
        iData_b = 8'b1011_0010;
        iC = 0;           
        
        # 40
        iData_a = 8'b0100_0101;
        iData_b = 8'b1110_0010;
        iC = 1;   
        
        # 40
        iData_a = 8'b1101_0101;
        iData_b = 8'b1010_0010;
        iC = 0;   
    end
endmodule