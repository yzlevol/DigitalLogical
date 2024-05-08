////////////////////////////////////////////////////////////////////////////////
// Description: 按钮防抖模块
// Author: Hyoung Yan
// Create Date: 2024-1-07
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module shake(rst,clk,din,dout);
	input rst,clk,din;
	output reg dout;
	reg [31:0] fifo; //使用FIFO防抖
	
	always @(posedge rst or posedge clk) begin
		if(rst) fifo <= 0;
		else fifo[31:0] <= {fifo[30:0],din};
	end
	
	always @(fifo) begin
		if(fifo == 32'h00000000) dout <= 0;
		else if(fifo == 32'hffffffff) dout <= 1;
		else dout <= dout;
	end
endmodule