module Asynchronous_D_FF(
    input CLK,
    input D,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    
    always @ (posedge CLK, negedge RST_n)
    begin
        if(!RST_n) begin
			Q1 = 1'b0;
			Q2 = 1'b1;
		end
		else begin
			Q1 <= D;
			Q2 <= ~D;
		end
	end
endmodule