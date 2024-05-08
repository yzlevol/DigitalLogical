module display7(iData, oData);
    input [3:0] iData;
    output [6:0] oData;

    assign oData = (iData == 4'b0000) ? 7'b1000000 :
                  (iData == 4'b0001) ? 7'b1111001 :
                  (iData == 4'b0010) ? 7'b0100100 :
                  (iData == 4'b0011) ? 7'b0110000 :
                  (iData == 4'b0100) ? 7'b0011001 :
                  (iData == 4'b0101) ? 7'b0010010 :
                  (iData == 4'b0110) ? 7'b0000010 :
                  (iData == 4'b0111) ? 7'b1111000 :
                  (iData == 4'b1000) ? 7'b0000000 :
                  (iData == 4'b1001) ? 7'b0010000 :
                  7'b1111111;

endmodule

