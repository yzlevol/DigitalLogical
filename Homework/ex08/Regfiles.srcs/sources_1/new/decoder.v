module decoder(
    input [4:0] iData,
    input iEna,
    output reg [31:0] oData
    );
    
    always @(*) begin
        if(iEna) begin
            oData  = 32'b0;
            oData[iData] = 1'b1;
        end
        else begin
            oData=32'bz;
        end
    end
    
endmodule