`timescale 1ns / 1ps
module de_selector14_tb;

  // �ź�����
  reg iC;
  reg iS1;
  reg iS0;
  wire oZ0;
  wire oZ1;
  wire oZ2;
  wire oZ3;

  // ʵ���������Ե�1��-4�����ݷ�����
  de_selector14 dut (
    .iC(iC),
    .iS1(iS1),
    .iS0(iS0),
    .oZ0(oZ0),
    .oZ1(oZ1),
    .oZ2(oZ2),
    .oZ3(oZ3)
  );

  // ��ʼ�������ź�
  initial begin
    iC = 1'b0;  // �������������ź� c ��ʼֵ
    iS1 = 1'b0; // ����ѡ���ź� s1 ��ʼֵ
    iS0 = 1'b0; // ����ѡ���ź� s0 ��ʼֵ

    // ��������1��s1=0, s0=0
    iS1 = 1'b0;
    iS0 = 1'b0;
    #40; 

    // ��������2��s1=0, s0=1
    iS1 = 1'b0;
    iS0 = 1'b1;
    #40;

    // ��������3��s1=1, s0=0
    iS1 = 1'b1;
    iS0 = 1'b0;
    #40;
    
     // ��������2��s1=1, s0=1
    iS1 = 1'b1;
    iS0 = 1'b1;
    #40;

  end
endmodule
