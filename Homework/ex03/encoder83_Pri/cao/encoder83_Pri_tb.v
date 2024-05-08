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

    iData = 8'bxxxxxxxx;
    iEI = 1'b1;
    #10;

    iData = 8'b00000000;
    iEI = 1'b0;
    #10;

    iData = 8'b1xxxxxxx;
    iEI = 1'b0;
    #10;

    iData = 8'b01xxxxxx;
    iEI = 1'b0;
    #10;

    iData = 8'b001xxxxx;
    iEI = 1'b0;
    #10;

    iData = 8'b0001xxxx;
    iEI = 1'b0;
    #10;

    iData = 8'b00001xxx;
    iEI = 1'b0;
    #10;
    
    iData = 8'b000001xx;
    iEI = 1'b0;
    #10;
    
    iData = 8'b000001x;
    iEI = 1'b0;
    #10;
    
    iData = 8'b00000001;
    iEI = 1'b0;
    #10;

    $finish;
  end

endmodule
