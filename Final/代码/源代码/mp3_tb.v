`timescale 1ns / 1ps

module mp3_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in nanoseconds

  // Inputs
  reg clk;
  reg rst;
  reg start;
  reg [2:0] music_id;
  reg DREQ;

  // Outputs
  wire XRSET;
  wire XCS;
  wire XDCS;
  wire SI;
  wire SCK;

  // Instantiate the MP3 module
  MyMP3 uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .music_id(music_id),
    .XRSET(XRSET),
    .DREQ(DREQ),
    .XCS(XCS),
    .XDCS(XDCS),
    .SI(SI),
    .SCK(SCK)
  );

  // Clock Generation
  always begin
    #((CLK_PERIOD)/2) clk = ~clk;
  end

  // Initial block
  initial begin
    // Initialize inputs
    rst = 1;
    start = 0;
    music_id = 3'b000;
    DREQ = 0;

    // Apply reset
    #20 rst = 0;

    // Apply start signal
    #10 start = 1;

    // Run simulation for some time
    #1000;

    // End simulation
    $stop;
  end

endmodule
