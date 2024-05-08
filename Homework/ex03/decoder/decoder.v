`timescale 1ns / 1ps

module decoder(
  input [2:0] iData, // 三位输入 D2, D1, D0
  input [1:0] iEna,  // 使能信号 G1, G2
  output [7:0] oData  // 八位译码输出 Y7 ~Y0, 低电平有效
);

  assign oData[0] = (iEna[0] && !iEna[1]) ? (~iData[2] & ~iData[1] & ~iData[0]) : 1'b0;
  assign oData[1] = (iEna[0] && !iEna[1]) ? (~iData[2] & ~iData[1] & iData[0])  : 1'b0;
  assign oData[2] = (iEna[0] && !iEna[1]) ? (~iData[2] & iData[1] & ~iData[0])  : 1'b0;
  assign oData[3] = (iEna[0] && !iEna[1]) ? (~iData[2] & iData[1] & iData[0])   : 1'b0;
  assign oData[4] = (iEna[0] && !iEna[1]) ? (iData[2] & ~iData[1] & ~iData[0])  : 1'b0;
  assign oData[5] = (iEna[0] && !iEna[1]) ? (iData[2] & ~iData[1] & iData[0])   : 1'b0;
  assign oData[6] = (iEna[0] && !iEna[1]) ? (iData[2] & iData[1] & ~iData[0])   : 1'b0;
  assign oData[7] = (iEna[0] && !iEna[1]) ? (iData[2] & iData[1] & iData[0])    : 1'b0;

endmodule

