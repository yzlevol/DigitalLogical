`timescale 1ns / 1ps

module encoder83(
    input [7:0] iData, // ��λ���� D7~D0���ߵ�ƽ��Ч
    output reg [2:0] oData // ��λ������� Y2~Y0
);

always @(*) begin
    case(iData)
        8'b00000001: oData = 3'b000; // Input D0
        8'b00000010: oData = 3'b001; // Input D1
        8'b00000100: oData = 3'b010; // Input D2
        8'b00001000: oData = 3'b011; // Input D3
        8'b00010000: oData = 3'b100; // Input D4
        8'b00100000: oData = 3'b101; // Input D5
        8'b01000000: oData = 3'b110; // Input D6
        8'b10000000: oData = 3'b111; // Input D7
        default: oData = 3'b000; // Default case
    endcase
end
endmodule


