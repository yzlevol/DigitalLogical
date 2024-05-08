`timescale 1ns / 1ps

module ram2_tb ();
    reg clk, ena, wena;
    reg [4:0] addr;
    reg [31:0] data_in;
    wire [31:0] data_out;
    wire [31:0] data;
    reg [31:0] ram_data[31:0];
    integer i = 0;
    ram2 uut(
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data(data)
    );

    assign data = wena ? data_in : 32'bz;
    assign data_out = ~wena ? data : 32'bz;

    initial $readmemb("data.txt", ram_data);

    initial begin
        clk = 0;
    end

    always #10 clk = ~clk;

    initial begin
        ena = 0;
        wena = 1;
        #25 ena = 1;

        for (i = 0; i < 32; i = i + 1) begin
            addr = i;
            data_in = ram_data[i];
            #10;
        end

        wena = 0;
        #10 addr = 5'b10100;
        #10 addr = 5'b10101;
        #10 addr = 5'b10110;
        #10 addr = 5'b11111;
        #10 addr = 5'b10001;
        #10 addr = 5'b00001;
        #10 addr = 5'b11001;
        #10 addr = 5'b10100;
        
        #50 ena = 0;

        #100 $finish;
    end
endmodule
