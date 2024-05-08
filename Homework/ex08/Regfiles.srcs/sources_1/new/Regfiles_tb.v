`timescale 1ns/1ns
module Regfiles_tb ();
    reg clk,rst,we;
    reg [4:0] raddr1,raddr2,waddr;
    reg [31:0] data;
    wire [31:0] dataO1,dataO2;
    Regfiles uut(clk,rst,we,raddr1,raddr2,waddr,data,dataO1,dataO2);
    initial begin
        rst=1;
        #10
        rst=0;
        we=1;
        #300
        we=0;
    end

    initial begin
        clk=0;
        repeat(100) begin
            #10 clk=~clk;
        end
    end

    initial begin
        data=0;
        repeat(31) begin
            # 10 data=data+1;
        end
        #80
        data=0;
        repeat(31) begin
            # 10 data=data+1;
        end
    end

    initial begin
        waddr=0;
        repeat(31) begin
            # 10 waddr=waddr+1;
        end
        #80
        waddr=0;
        repeat(31) begin
            # 10 waddr=waddr+1;
        end
    end

    initial begin
        raddr1=0;
        raddr2=31;
        repeat(31) begin
            # 10 raddr1=raddr1+1;
            raddr2=raddr2-1;
        end
        #100
        raddr1=0;
        raddr2=31;
        repeat(31) begin
            # 10 raddr1=raddr1+1;
            raddr2=raddr2-1;
        end
    end
endmodule