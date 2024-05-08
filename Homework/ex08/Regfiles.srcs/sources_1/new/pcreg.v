`timescale 1ns / 1ps

module pcreg(
    input clk,
    input rst,
    input ena,
    input [31:0] data_in,
    output reg [31:0] data_out
    );
    
    always @ (negedge clk or posedge rst) begin
        if (rst) 
            data_out = 32'h0000_0000;
        else
            if (ena)
                data_out = data_in;
    end
    
    
endmodule