////////////////////////////////////////////////////////////////////////////////
// Description: MP3ģ��
// Author: Hyoung Yan
// Create Date: 2024-1-10
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module MyMP3(clk,rst,start,music_id,XRSET,DREQ,XCS,XDCS,SI,SCK);
input clk;                // ϵͳ100Mʱ��
input rst;                // �ߵ�ƽ��Ч
input start;              // �Ƿ񲥷�
input [2:0] music_id;     // ѡ�������

output reg XRSET;          // Ӳ����λ���͵�ƽ��Ч
input DREQ;                     // �������󣬸ߵ�ƽ��Ч
output reg XCS;              // SCI ���ڴ�������
output reg XDCS;           // SDI ������������
output reg SI;                  // ��MP3д�����ݡ�����
output reg SCK;              // MP3ʱ��

reg init = 0;
// 1Mʱ��
wire clk_1M;
Divider #(.num(100)) clk_mp3(clk, clk_1M);

// IP ��ʵ����
reg[11:0] addr;
wire [15: 0] get_data;
reg [15: 0] music_data;
blk_mem_gen_0 music_0 (.clka(clk),.ena(1),.addra({music_id, addr}),.douta(get_data));

reg [3:0] condition = 0;     // ״̬
reg [63: 0] cmd = {32'h02000804, 32'h020B8080};     // Ҫд�������

//// �޸����������ӣ�������Ҫ�������������ֵ
//reg [15:0] new_volume = 16'hFFFF; // �����µ�����ֵ

//// ���ʵ���ʱ�����µ�����ֵд�� cmd
//always @(posedge clk) begin
//    cmd[15:0] <= new_volume; // ���µ�����ֵд�� cmd �ĵ� 16 λ
//end


// ����
integer cnt = 0;             // ������
integer num = 0;           // ��¼����

// ״̬����
parameter DELAY = 1;
parameter PRE_CMD = 2;
parameter WRITE_CMD = 3;
parameter PRE_DATA = 4;
parameter WRITE_DATA = 5;
// ��ʱ����
parameter DELAY_TIME = 500000;

always @(posedge clk_1M)
begin
   if(rst || !init) begin                 // ���г�ʼ��
        init <= 1;
        XRSET <= 0;
        SCK <= 0;
        XCS <= 1;                         //��ֹд������
        XDCS <= 1;                      //��ֹ�����ݴ���MP3
        condition <= DELAY;
        addr <= 0;
        cnt <= 0;
   end
   else begin
    if(start) begin
    case (condition)
        DELAY: begin
            if(cnt == DELAY_TIME) begin  // ��ʱ����
                cnt <= 0;
                condition <= PRE_CMD;
                XRSET <= 1;                     // Ӳ��λ
            end
            else begin                            // �ȴ���ʱ
                cnt <= cnt + 1;
            end
        end
        PRE_CMD: begin
            SCK <= 0;                               // MP3ʱ���½��أ���������
            if(num == 2) begin              // д���������
                condition <= PRE_DATA;
                num <= 0;
            end
            else begin
                if(DREQ) begin
                    cnt <= 0;
                    condition <= WRITE_CMD;
                end
            end
        end
        WRITE_CMD: begin
            if(DREQ) begin
                if(clk) begin
                    if(cnt == 32) begin         // ���üĴ����������
                        cnt <= 0;                      // ���ü�����
                        XCS <= 1;                    //��ֹд������
                        condition <= PRE_CMD;
                        num <= num + 1;
                    end
                    else begin
                        XCS <= 0;                   //����д������
                        SI <= cmd[63];          // д���������
                        cmd <= {cmd[62: 0], cmd[63]};   // ������λ
                        cnt <= cnt + 1;
                    end
                end
                SCK <= ~SCK;                  // ����任���������ݸ��������
            end
        end
        PRE_DATA: begin
            if(DREQ) begin
                SCK <= 0;
				condition <= WRITE_DATA;
				music_data <= get_data;       // �������ݴ��ݣ�������λ
				cnt <= 0;
            end
        end
        WRITE_DATA: begin
            if(SCK) begin
                if(cnt == 16) begin           // ����һ��2�ֽ�����д�룬������һ�����ݵ�׼��������
                    XDCS <= 1;                    //��ֹ�����ݴ���MP3
                    addr <= addr + 1;        // ROM��ַ����
                    cnt <= 0;
                    condition <= PRE_DATA;
                end
                else begin                              //  �����������ݵ�д��
                    XDCS <= 0;                      //  �������ݴ���MP3
                    SI <= music_data[15];   //  д����������
                    music_data <= {music_data[14:0],music_data[15]};
                    cnt <= cnt + 1;
                end
            end
             SCK <= ~SCK;   // ���ݸ��������
        end
        default: ;
    endcase 
    end
   end
end

endmodule