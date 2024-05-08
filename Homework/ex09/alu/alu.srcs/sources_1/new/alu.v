module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output reg [31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
    );

    parameter Addu = 4'b0000; //r=a+b unsigned
    parameter Add  = 4'b0010; //r=a+b signed
    parameter Subu = 4'b0001; //r=a-b unsigned
    parameter Sub  = 4'b0011; //r=a-b signed
    parameter And  = 4'b0100; //r=a&b
    parameter Or   = 4'b0101; //r=a|b
    parameter Xor  = 4'b0110; //r=a^b
    parameter Nor  = 4'b0111; //r=~(a|b)
    parameter Lui1 = 4'b1000; //r={b[15:0],16'b0}
    parameter Lui2 = 4'b1001; //r={b[15:0],16'b0}
    parameter Slt  = 4'b1011; //r=(a-b<0)?1:0 signed
    parameter Sltu = 4'b1010; //r=(a-b<0)?1:0 unsigned
    parameter Sra  = 4'b1100; //r=b>>>a 
    parameter Sll  = 4'b1110; //r=b<<a
    parameter Slr  = 4'b1111; //r=b<<a
    parameter Srl  = 4'b1101; //r=b>>a
    
    reg [32 : 0] temp;
    reg signed [31:0] temp_b;
    always @(*)
        casex (aluc)
            Addu: begin
                r = a + b;
                temp = {1'b0, a} + {1'b0, b};
                zero = (r == 0) ? 1 : 0;
                carry = temp[32];
                negative = r[31];
                overflow = 0;
            end
            
            Add: begin
                r = a + b;
                zero = (r == 0) ? 1 : 0;
                carry = 0;
                negative = r[31];
                overflow = ((a[31] == b[31]) && (r[31] != a[31])) ? 1 : 0;
            end
            
            Subu: begin
                r = a - b;
                zero = (r == 0) ? 1 : 0;
                carry = (a < b) ? 1 : 0;
                negative = r[31];
                overflow = 0;
            end
            
            Sub:  begin
                r = a - b;
                zero = (r == 0) ? 1 : 0;
                carry = 0;
                negative = r[31];
                overflow = ((a[31] != b[31]) && (r[31] != a[31])) ? 1 : 0;
            end
            
            And: begin
                r = a & b;
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            Or: begin
                r = a | b;
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            Xor: begin
                r = a ^ b;
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            Nor: begin
                r = ~(a | b);
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            Lui1,Lui2: begin
                r = {b[15:0], 16'b0};
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            Slt: begin
                r = a - b;
                zero = (r == 0) ? 1 : 0;
                carry = 0;
                negative = r[31];
                overflow = ((a[31] != b[31]) && (r[31] != a[31])) ? 1 : 0;
                r = (overflow == 1 || (r[31] == 1)) ? 1 : 0;
            end
            
            Sltu: begin
                r = (a < b) ? 1 : 0;
                negative = r[31];
                r = a - b;
                zero = (r == 0) ? 1 : 0;
                carry = (a < b) ? 1 : 0;
                overflow = 0;
                r = carry;
            end
            
            Sra: begin
                temp_b = b;
                r = temp_b >>> a;
                zero = (r == 0) ? 1 : 0;
                carry = (a >= 32) ? b[31] : b[a];
                negative = r[31];
                overflow = 0;
            end
            
             Sll,Slr: begin
                r = b << a;
                zero = (r == 0) ? 1 : 0;
                carry = (a >= 32) ? 0 : b[31-a];
                negative = r[31];
                overflow = 0;
            end
            
            Srl:  begin
                r = b >> a;
                zero = (r == 0) ? 1 : 0;
                carry = (a >= 32) ? 0 : b[a];
                negative = r[31];
                overflow = 0;
            end 
            default: begin
                r = 1'bz; zero = 1'bz; carry = 1'bz; negative = 1'bz; overflow = 1'bz;
            end
        endcase
endmodule