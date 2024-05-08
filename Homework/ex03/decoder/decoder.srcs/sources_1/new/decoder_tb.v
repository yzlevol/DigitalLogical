`timescale 1ns / 1ps

module decoder_tb;
  // Inputs
  reg [2:0] iData;
  reg [1:0] iEna;
  // Outputs
  wire [7:0] oData;

  decoder my_decoder (
    .iData(iData),
    .iEna(iEna),
    .oData(oData)
  );

  initial begin
    iData = 0;
    iEna = 2'b01;  

    iData = 3'b000;
    #10;  
    iData = 3'b001;
    #10;
    iData = 3'b010;
    #10;
    iData = 3'b011;
    #10;
    iData = 3'b100;
    #10;
    iData = 3'b101;
    #10;
    iData = 3'b110;
    #10;
    iData = 3'b111;
    #10;
    // Finish the simulation
    $finish;
  end

  // Display outputs
  always @(oData) begin
    $display("Output: Y7=%b Y6=%b Y5=%b Y4=%b Y3=%b Y2=%b Y1=%b Y0=%b",
             oData[7], oData[6], oData[5], oData[4], oData[3], oData[2], oData[1], oData[0]);
  end

endmodule
