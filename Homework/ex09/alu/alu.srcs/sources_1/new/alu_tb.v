`timescale 1ns / 1ps
module alu_tb();
reg [31:0] a;
reg [31:0] b;
reg [3:0] aluc;
wire [31:0] r;
wire zero;
wire carry;
wire negative;
wire overflow;

alu uut(
.a(a),
.b(b),
.aluc(aluc),
.r(r),
.zero(zero),
.carry(carry),
.negative(negative),
.overflow(overflow)
);

initial  begin
   a <= 32'hffffffff;
   b <= 32'hffffffff;
   aluc=4'b0000;
    repeat(16) begin
           #10 aluc=aluc+1;
    end
    
    #10 a=32'h0000_0001;
    b=32'hffff_ffff;
    aluc=4'b0000;
    repeat(16) begin
            #10 aluc=aluc+1;
    end
    
    #10 a=32'hffff_ffff;
    b=32'h0000_ffff;
    aluc=4'b0000;
    repeat(16) begin
            #10 aluc=aluc+1;
    end
    
     #10 a=32'hffff_ffff;
    b=32'h0000_ffff;
    aluc=4'b0000;
    repeat(16) begin
            #10 aluc=aluc+1;
    end
    
     #10 a=32'hffff_ffff;
    b=32'h8000_0000;
    aluc=4'b0000;
    repeat(16) begin
            #10 aluc=aluc+1;
    end
    
     #10 a=32'h0000_0000;
    b=32'h0000_0000;
    aluc=4'b0000;
    repeat(16) begin
            #10 aluc=aluc+1;
    end
    
    #10 a=32'h0000_0008;
    b=32'hffff_ffff;
    aluc=4'b0000;
    repeat(16) begin
            #10 aluc=aluc+1;
    end
    
    #10 a=32'h0000_ffff;
    b=32'h0000_0000;
    aluc=4'b0000;
    repeat(16) begin
                #10 aluc=aluc+1;
    end
end
    
endmodule