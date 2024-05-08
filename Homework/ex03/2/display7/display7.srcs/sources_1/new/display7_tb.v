`timescale 1ns / 1ps

module display7_tb;
    reg [3:0] iData;
    wire [6:0] oData;
    
    display7 uut (
        .iData(iData),
        .oData(oData)
    );
    
    initial begin
        iData = 4'b0000; 
        
        #10 iData = 4'b0000; 
        #10 iData = 4'b0001; 
        #10 iData = 4'b0010;
        #10 iData = 4'b0011; 
        #10 iData = 4'b0100;
        #10 iData = 4'b0101; 
        #10 iData = 4'b0110; 
        #10 iData = 4'b0111; 
        #10 iData = 4'b1000; 
        #10 iData = 4'b1001;         
        $finish; 
    end
    always @(oData) begin
        $display("iData = %b, oData = %b", iData, oData);
    end
endmodule
