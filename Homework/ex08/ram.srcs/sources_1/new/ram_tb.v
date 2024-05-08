`timescale 1ns / 1ps

module ram_tb;
  reg clk, ena, wena;
  reg [4:0] addr;
  reg [31:0] data_in;
  wire [31:0] data_out;
  reg [31:0] tmp[31:0];
  ram uut (
    .clk(clk),
    .ena(ena),
    .wena(wena),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
  );
  
  integer i = 0;
  initial  begin
    $readmemb("E:\\NL\\projects\\homework\\ex08\\ram.srcs\\sources_1\\new\\data.txt", tmp); 
    clk = 1;
    addr=0;
    data_in=0;
  end

  always #10 clk = ~clk;

  initial begin
    ena <= 0;
    wena <= 1;

    #23 ena <= 1;
    for (i = 0; i < 32; i = i + 1) begin
      addr <= i;
      data_in <= tmp[i];
      #20;
    end

    wena <= 0;
    #11 addr = 5'b10101; 
    #22 addr = 5'b01011; 
    #33 addr = 5'b11111; 
    #44 addr = 5'b00011; 
    #110 ena = 0;
  end
endmodule
