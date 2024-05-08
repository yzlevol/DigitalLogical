`timescale 1ns / 1ps

module DataCompare8_tb();
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    wire [2:0] oData;
    
    DataCompare8 uul(.iData_a(iData_a), .iData_b(iData_b), .oData(oData));
    
    initial 
    begin
		iData_a = 8'b0000_0000;
        iData_b = 8'b0000_0000;
        # 10 iData_a = 8'b0000_1000;
        iData_b = 8'b0000_1010;
        
        # 10 iData_a = 8'b1010_1001;
        iData_b = 8'b0101_0110;
        
        # 10 iData_a = 8'b0000_0000;
        iData_b = 8'b0000_0010;
        
        # 10 iData_a = 8'b1010_0101;
        iData_b = 8'b1010_0101;
        
        # 10 iData_a = 8'b0111_1111;
        iData_b = 8'b1000_1111;
        
        # 10 iData_a = 8'b1111_1111;
        iData_b = 8'b1111_0111;
        
        # 10 iData_a = 8'b0101_0110;
        iData_b = 8'b1110_1001;
    end
endmodule