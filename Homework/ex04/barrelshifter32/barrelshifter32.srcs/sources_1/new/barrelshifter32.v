module barrelshifter32(
    input [31:0] a, // 32位原始输入数据
    input [4:0] b, // 5位输入信号，控制移位的位数
    input [1:0] aluc, // 2位输入信号，控制移位的方式
    output reg [31:0] c // 32位移位后的输出数据
);

always @(*)
begin
    case ({aluc[1], aluc[0]})
        2'b00:  // 算术右移 (sra)
            begin
                c = $signed(a) >>> b[4:0]; 
            end
        2'b10:  // 逻辑右移 (srl)
            begin
                c = a >> b[4:0]; 
            end
        2'b01:  // 算术左移 (sll)
            begin
                c = a << b[4:0]; 
            end
        2'b11:  // 逻辑左移 (sll)
            begin
                c = a << b[4:0]; 
            end
    endcase
end


endmodule
