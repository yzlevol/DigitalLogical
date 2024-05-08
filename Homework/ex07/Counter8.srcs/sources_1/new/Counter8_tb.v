module Counter8_tb();
  reg CLK;
  reg rst_n;
  wire [2:0] oQ;
  wire [6:0] oDisplay;

  Counter8 uut(
    .CLK(CLK),
    .rst_n(rst_n),
    .oQ(oQ),
    .oDisplay(oDisplay)
  );

  initial begin
    CLK = 1'b0;
    forever #10 CLK =~CLK;
  end

  initial begin
    rst_n = 1'b0;
    #20 rst_n = 1'b1;
  end

  always @(posedge CLK) begin
    $display("Time=%0t, oQ=%b, oDisplay=%b", $time, oQ, oDisplay);
  end

endmodule
