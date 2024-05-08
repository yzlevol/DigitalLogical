module encoder83_Pri (
    input [7:0] iData,
    input iEI, 
    output [2:0] oData, 
    output oEO 
);

reg [7:0] invertedData;  // 存储 iData 的非
reg [2:0] priorityEncodedData;
reg internal_EO; // 模块内部使用的EO
integer con; // 使用integer类型定义con

always @(*) begin
    // 默认值
    priorityEncodedData = 3'b111;
    internal_EO = 1'b1;
    con = 0; 
    invertedData = ~iData;
    if  (iEI == 1'b1)begin
        priorityEncodedData = 3'b000;
    end
    else if (iEI == 1'b0) begin
        if (invertedData[7]==1'b1 && con == 0) begin
            priorityEncodedData = 3'b111;
            con = 1;
        end else if (invertedData[6]==1'b1 && con == 0) begin
            priorityEncodedData = 3'b110;
            con = 1;
        end else if (invertedData[5]==1'b1 && con == 0) begin
            priorityEncodedData = 3'b101;
            con = 1;
        end else if (invertedData[4]==1'b1 && con == 0) begin
            priorityEncodedData = 3'b100;
            con = 1;
        end else if (invertedData[3]==1'b1 && con == 0) begin
            priorityEncodedData = 3'b011;
            con = 1;
        end else if (invertedData[2]==1'b1 && con == 0) begin
            priorityEncodedData = 3'b010;
            con = 1;
        end else if (invertedData[1]==1'b1 && con == 0) begin
            priorityEncodedData = 3'b001;
            con = 1;
        end else if (invertedData[0]==1'b1 && con == 0) begin
            priorityEncodedData = 3'b000;
            con = 1;
        end else begin
			if (con == 0)begin
				priorityEncodedData = 3'b111;
				internal_EO = 1'b0;
				con = 1;
			end
        end
    end
end

assign oData = ~priorityEncodedData;
assign oEO = internal_EO;

endmodule
