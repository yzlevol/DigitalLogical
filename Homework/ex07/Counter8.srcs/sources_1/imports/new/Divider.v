module Divider(
    input I_CLK,
    input rst,
    output reg O_CLK
    );
    
    parameter threshold = 20;
    integer i = 0;
    initial O_CLK <= 0;
    
    always @ (posedge I_CLK) begin
        if (rst) begin
            O_CLK <= 0;
            i = 0;
        end
        else if (i < (threshold/2) - 1)
            i = i + 1;
        else begin
            i = 0;
            O_CLK <= ~O_CLK;
        end
    end
endmodule