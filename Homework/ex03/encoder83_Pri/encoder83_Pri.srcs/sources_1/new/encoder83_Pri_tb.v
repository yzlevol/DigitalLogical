`timescale 1ns / 1ps

module encoder83_Pri_tb;

  reg [7:0] iData;
  reg iEI;
  wire [2:0] oData;
  wire oEO; 

  // Instantiate the encoder83_Pri module
  encoder83_Pri my_encoder (
    .iData(iData),
    .iEI(iEI),
    .oData(oData),
    .oEO(oEO)
  );

  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  initial begin
    iData = 8'b00000000;
    iEI = 1'b0;

    $display("iData = %h, iEI = %b", iData, iEI);
    $monitor("oData = %b, oEO = %b", oData, oEO);

    iData = 8'b10101010;
    iEI = 1'b1;
    #10;

    iData = 8'b00000000;
    iEI = 1'b0;
    #10;

    iData = 8'b11010101;
    iEI = 1'b0;
    #10;

    iData = 8'b01101010;
    iEI = 1'b0;
    #10;

    iData = 8'b00101010;
    iEI = 1'b0;
    #10;

    iData = 8'b0001110;
    iEI = 1'b0;
    #10;

    iData = 8'b0000111;
    iEI = 1'b0;
    #10;
    
    iData = 8'b00000100;
    iEI = 1'b0;
    #10;
    
    iData = 8'b11101100;
    iEI = 1'b0;
    #10;
    
    iData = 8'b10100010;
    iEI = 1'b0;
    #10;
    
    iData = 8'b00000001;
    iEI = 1'b1;
    #10;
    
    iData = 8'b00000000;
    iEI = 1'b1;
    #10;
    
    iData = 8'b00000000;
    iEI = 1'b0;
    #10;
    $finish;
  end

endmodule
