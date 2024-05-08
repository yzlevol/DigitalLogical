`timescale 1ns/1ns
module Divider_tb();
    reg I_CLK;
    reg rst;
    wire O_CLK;
    Divider inst(
        .I_CLK(I_CLK),
        .rst(rst),
        .O_CLK(O_CLK)
        );
    integer i;
    initial
    begin
        I_CLK=0;
        for(i=0;i<200;i=i+1)
            #5 I_CLK=~I_CLK;
    end
    initial
    begin
        rst=0;
        #100 rst=1;
        #5 rst=0;
        #50 rst=1;
        #50 rst=0;
    end
endmodule