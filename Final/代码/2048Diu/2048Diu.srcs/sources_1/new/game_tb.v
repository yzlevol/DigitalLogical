`timescale 1ns / 1ps

module game_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in nanoseconds

  // Inputs
  reg rst;
  reg clk;
  reg [3:0] key;
  reg DREQ;
  reg XCS;
  reg XDCS;
  reg SCK;
  reg SI;
  reg XRESET;
  reg [31:0] sumScore;
  reg [1:0] status;

  // Outputs
  wire Hsync;
  wire Vsync;
  wire [3:0] vgaRed;
  wire [3:0] vgaGreen;
  wire [3:0] vgaBlue;
  wire [7:0] an;
  wire [7:0] seg;

  // Instantiate the game module
  game uut (
    .rst(rst),
    .clk(clk),
    .key(key),
    .Hsync(Hsync),
    .Vsync(Vsync),
    .vgaRed(vgaRed),
    .vgaGreen(vgaGreen),
    .vgaBlue(vgaBlue),
    .DREQ(DREQ),
    .XCS(XCS),
    .XDCS(XDCS),
    .SCK(SCK),
    .SI(SI),
    .XRESET(XRESET),
    .an(an),
    .seg(seg)
  );

// Instantiate the score module with instance name "score_inst"
score score_inst (
  .rst(rst),
  .clock(clk),
  .an(an),
  .status(status),
  .seg(seg),
  .sumScore(sumScore)
);

  // Clock Generation
  always begin
    #(CLK_PERIOD/2) clk = ~clk;
  end

  // Initial block
  initial begin
    // Initialize inputs
    rst = 1;
    key = 4'b0000;
    DREQ = 0;
    XCS = 0;
    XDCS = 0;
    SCK = 0;
    SI = 0;
    XRESET = 1;

    // Apply reset
    #20 rst = 0;

    // Run simulation for some time
    #1000;

    // End simulation
    $stop;
  end

endmodule
