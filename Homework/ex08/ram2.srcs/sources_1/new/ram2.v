module ram2 (
            input clk,
             input ena,
             input wena,
             input [4:0] addr,
             inout [31:0] data
             );
    reg [31:0] ram_data [31:0];
    reg [31:0] tmp;
    integer i;
    initial begin
        for (i = 0;i <= 31;i = i+1)
            ram_data[i] <= 0;
    end
    
    always @(posedge clk) begin
        if (ena) begin
            if (wena) begin
                ram_data[addr] = data;
            end
        end
    end
    always @(*) begin
        if (~ena) begin
            tmp <= 32'bz;
        end
        else begin
            if (~wena)
                tmp = ram_data[addr];
        end
    end
    
    assign data = ~wena? tmp : 32'bz;
endmodule