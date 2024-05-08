module barrelshifter32(
    input [31:0] a, // 32λԭʼ��������
    input [4:0] b, // 5λ�����źţ�������λ��λ��
    input [1:0] aluc, // 2λ�����źţ�������λ�ķ�ʽ
    output reg [31:0] c // 32λ��λ����������
);

always @(*)
begin
    case ({aluc[1], aluc[0]})
        2'b00:  // �������� (sra)
            begin
                c = $signed(a) >>> b[4:0]; 
            end
        2'b10:  // �߼����� (srl)
            begin
                c = a >> b[4:0]; 
            end
        2'b01:  // �������� (sll)
            begin
                c = a << b[4:0]; 
            end
        2'b11:  // �߼����� (sll)
            begin
                c = a << b[4:0]; 
            end
    endcase
end


endmodule
