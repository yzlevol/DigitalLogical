`timescale 1ns / 1ps
module encoder83_tb;
    reg [7:0] iData;
    wire [2:0] oData;
    
    encoder83 uut (
        .iData(iData),
        .oData(oData)
    );
    
    initial begin
        iData = 8'b00000001; 
        #10 iData = 8'b00000010; 
        #10 iData = 8'b00000100;
        #10 iData = 8'b00001000; 
        #10 iData = 8'b00010000; 
        #10 iData = 8'b00100000; 
        #10 iData = 8'b01000000; 
        #10 iData = 8'b10000000;  
        #10  
        $finish; 
    end
    always @(oData) begin
        $display("iData = %b, oData = %b", iData, oData);
    end
endmodule
