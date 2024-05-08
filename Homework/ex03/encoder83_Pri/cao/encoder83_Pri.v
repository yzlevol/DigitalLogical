module encoder83_Pri (
    input [7:0] iData,
    input iEI, 
    output [2:0] oData, 
    output oEO 
);

reg [7:0] invertedData;  // �洢 iData �ķ�
reg [2:0] priorityEncodedData;
reg internal_EO; // ģ���ڲ�ʹ�õ�EO

always @(*) begin
    // Ĭ��ֵ
    priorityEncodedData = 3'b111;
    internal_EO = 1'b1;

    // ���� iData �ķ�
    invertedData = ~iData;

    // ���ȱ����߼�
    if (iEI == 1'b0) begin
        if (invertedData[7]==1'b0) priorityEncodedData = 3'b000;
        else if (invertedData[6]==1'b0) priorityEncodedData = 3'b001;
        else if (invertedData[5]==1'b0) priorityEncodedData = 3'b010;
        else if (invertedData[4]==1'b0) priorityEncodedData = 3'b011;
        else if (invertedData[3]==1'b0) priorityEncodedData = 3'b100;
        else if (invertedData[2]==1'b0) priorityEncodedData = 3'b101;
        else if (invertedData[1]==1'b0) priorityEncodedData = 3'b110;
        else if (invertedData[0]==1'b0) priorityEncodedData = 3'b111;
        else begin
            priorityEncodedData = 3'b111;
            internal_EO = 1'b0;
        end
    end
end

assign oData = ~priorityEncodedData;
assign oEO = internal_EO;

endmodule
