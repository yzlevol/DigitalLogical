`timescale 1ns / 1ps
module transmission8_tb;
    reg [7:0] iData;
    reg A, B, C;
    wire [7:0] oData;
    transmission8 uut (
        .iData(iData),
        .A(A),
        .B(B),
        .C(C),
        .oData(oData)
    );
    initial begin
        iData = 8'b00000000;  
        A = 0;
        B = 0;
        C = 0;
        $monitor("Input A=%b, B=%b, C=%b, iData=%b, Output oData=%b", A, B, C, iData, oData);
        // Test case 1
        A = 0;
        B = 0;
        C = 0;
        #40;
        // Test case 2
        A = 0;
        B = 0;
        C = 1;
        #40;
        // Test case 3
        A = 0;
        B = 1;
        C = 0;
        #40;       
         // Test case 4
        A = 0;
        B = 1;
        C = 1;
        #40;        
        // Test case 5
        A = 1;
        B = 0;
        C = 0;
        #40;        
        // Test case 6
        A = 1;
        B = 0;
        C = 1;
        #40;
        // Test case 7
        A = 1;
        B = 1;
        C = 0;
        #40;
        // Test case 8
        A = 1;
        B = 1;
        C = 1;
        #40;
    end
endmodule
