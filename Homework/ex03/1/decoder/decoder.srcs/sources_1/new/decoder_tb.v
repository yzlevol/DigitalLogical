`timescale 1ns / 1ps

module decoder_tb;
    reg [2:0] iData;
    reg [1:0] iEna;
    wire [7:0] oData;

    decoder dut(
        .iData(iData),
        .iEna(iEna),
        .oData(oData)
    );

    initial begin
        iEna = 2'b11;
        iData = 3'b101;
        #10 
        iEna = 2'b00;
        iData = 3'b111;
        #10 
        iEna = 2'b10;
        iData = 3'b000;
        #10
        iEna = 2'b10;
        iData = 3'b001;
        #10 
        iEna = 2'b10;
        iData = 3'b010;
        #10
        iEna = 2'b10;
        iData = 3'b011;
        #10 
        iEna = 2'b10;
        iData = 3'b100;
        #10 
        iEna = 2'b10;
        iData = 3'b101;
        #10 
        iEna = 2'b10;
        iData = 3'b110;
        #10 
        iEna = 2'b10;
        iData = 3'b111;
        #10 

        $finish; 
    end
endmodule

