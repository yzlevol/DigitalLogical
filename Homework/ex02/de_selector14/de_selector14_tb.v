`timescale 1ns / 1ps
module de_selector14_tb;

  // 信号声明
  reg iC;
  reg iS1;
  reg iS0;
  wire oZ0;
  wire oZ1;
  wire oZ2;
  wire oZ3;

  // 实例化被测试的1线-4线数据分配器
  de_selector14 dut (
    .iC(iC),
    .iS1(iS1),
    .iS0(iS0),
    .oZ0(oZ0),
    .oZ1(oZ1),
    .oZ2(oZ2),
    .oZ3(oZ3)
  );

  // 初始化输入信号
  initial begin
    iC = 1'b0;  // 设置数据输入信号 c 初始值
    iS1 = 1'b0; // 设置选择信号 s1 初始值
    iS0 = 1'b0; // 设置选择信号 s0 初始值

    // 测试用例1：s1=0, s0=0
    iS1 = 1'b0;
    iS0 = 1'b0;
    #40; 

    // 测试用例2：s1=0, s0=1
    iS1 = 1'b0;
    iS0 = 1'b1;
    #40;

    // 测试用例3：s1=1, s0=0
    iS1 = 1'b1;
    iS0 = 1'b0;
    #40;
    
     // 测试用例2：s1=1, s0=1
    iS1 = 1'b1;
    iS0 = 1'b1;
    #40;

  end
endmodule
