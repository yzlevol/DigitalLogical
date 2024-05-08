`timescale 1ns / 1ps
module selector41_tb;

  // 信号声明
  reg [3:0] iC0, iC1, iC2, iC3;
  reg iS1, iS0;
  wire [3:0] oZ;
  // 实例化被测试的模块
  selector41 uut (
    .iC0(iC0),
    .iC1(iC1),
    .iC2(iC2),
    .iC3(iC3),
    .iS1(iS1),
    .iS0(iS0),
    .oZ(oZ)
  );
  // 初始化测试信号
  initial begin
    // 测试用例1
    iC0 = 4'b0001;
    iC1 = 4'b0011;
    iC2 = 4'b0111;
    iC3 = 4'b1111;
    
    iS1 = 1'b0;
    iS0 = 1'b0;
    #40;

    // 测试用例2
    iS1 = 1'b0;
    iS0 = 1'b1;
    #40;

    // 测试用例3
    iS1 = 1'b1;
    iS0 = 1'b0;
    #40;

    // 测试用例4
    iS1 = 1'b1;
    iS0 = 1'b1;
    #40;
  end
endmodule
