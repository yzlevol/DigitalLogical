////////////////////////////////////////////////////////////////////////////////
// Description: ����ʱ����ʾģ��
// Author: Hyoung Yan
// Create Date: 2024-1-11
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module score(
	input clock,//ʱ���źţ�ͬϵͳ
	input rst,//���ã��ߵ�ƽ��Ч
	input [1:0] status, //��Ϸ״̬
	input [31:0] sumScore,//�ܵ÷�
	output [7:0] an, //ʹ��
	output [7:0] seg //Ƭѡ
    );
    
    localparam PLAYING=2'b00;
    localparam END=2'b01;
    localparam WIN=2'b10;
    
    wire real_enable;
    wire real_reset;
    
    //reg [31:0]Myscore;

    reg [31:0]total_time;
    reg [31:0]total_time_10ns;

always @(posedge clock)
begin
    if (rst == 1) begin
        //Myscore <= 0;
        total_time <= 0;
        total_time_10ns <= 0;
    end
    else if (status == PLAYING) begin
        total_time_10ns <= total_time_10ns + 1;
        if (total_time_10ns % 100000000 == 0) begin
            total_time <= total_time + 1;
            //Myscore <= Myscore+1'b1;
        end
    end
end
    //�������ʾʱ�����
    BCDseg (
        .rst(rst),
        .clock(clock),
        .an(an),
        .seg(seg),
    	//.score(Myscore),
    	.score(sumScore),
    	.total_time(total_time)
        );
        
endmodule
