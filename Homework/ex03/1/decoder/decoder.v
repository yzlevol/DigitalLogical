`timescale 1ns / 1ps

module decoder(
    input [2:0] iData, //三位输入 D2,D1,D0
    input [1:0] iEna, //使能信号 G1,G2
    output [7:0] oData //八位译码输出?7
);

reg [7:0] oData_reg;

always @(iData, iEna) begin
    if (~iEna[0] & iEna[1]) begin
        case (iData)
            3'b000: oData_reg = 8'b11111110;
            3'b001: oData_reg = 8'b11111101;
            3'b010: oData_reg = 8'b11111011;
            3'b011: oData_reg = 8'b11110111;
            3'b100: oData_reg = 8'b11101111;
            3'b101: oData_reg = 8'b11011111;
            3'b110: oData_reg = 8'b10111111;
            3'b111: oData_reg = 8'b01111111;
            default: oData_reg = 8'b11111111;
        endcase
    end else begin
        oData_reg = 8'b11111111;
    end
end

assign oData = oData_reg;

endmodule
