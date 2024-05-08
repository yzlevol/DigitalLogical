module ram (input clk,
            input ena,
            input wena,
            input [4:0] addr,
            input [31:0] data_in,
            output reg [31:0] data_out
);
    
    reg [31:0] tmp [31:0];
    
    integer i;
    initial begin
        for ( i = 0;i <= 31;i = i+1 )
            tmp[i] <= 32'b0;
    end
    
    always @(posedge clk) begin
        if (ena) begin
            if (wena) begin
                tmp[addr] <= data_in;
            end
        end
        else begin
            data_out <= 32'bz;
        end
        
    end
    always @(*) begin //Òì²½¶ÁÈ¡
        if (ena) begin
            if(~wena)
                data_out <= tmp[addr];
        end
        else 
            data_out <= 32'bz;
    end
endmodule