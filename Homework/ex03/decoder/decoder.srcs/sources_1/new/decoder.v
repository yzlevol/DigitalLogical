`timescale 1ns / 1ps

module decoder(
    input [2:0] iData, // 三位输入 D2,D1,D0
    input [1:0] iEna, // 使能信号 G1,G2
    output [7:0] oData // 八位译码输出?7
);

    wire iEnaCondition;
    assign iEnaCondition = ~iEna[0] & iEna[1];

    always @(*) begin
        assign oData[0] = iEnaCondition & ~iData[0] & ~iData[1] & ~iData[2];
        assign oData[1] = iEnaCondition & iData[0] & ~iData[1] & ~iData[2];
        assign oData[2] = iEnaCondition & ~iData[0] & iData[1] & ~iData[2];
        assign oData[3] = iEnaCondition & iData[0] & iData[1] & ~iData[2];
        assign oData[4] = iEnaCondition & ~iData[0] & ~iData[1] & iData[2];
        assign oData[5] = iEnaCondition & iData[0] & ~iData[1] & iData[2];
        assign oData[6] = iEnaCondition & ~iData[0] & iData[1] & iData[2];
        assign oData[7] = iEnaCondition & iData[0] & iData[1] & iData[2];
    end
endmodule
