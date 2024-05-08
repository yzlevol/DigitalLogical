`timescale 1ns / 1ps
module logic_gates_2(iA,iB,oAnd,oOr,oNot);
    input iA, iB;
    output oAnd,oOr,oNot;
    assign oAnd = iA & iB;
    assign oOr = iA | iB;
    assign oNot = ~iA;
endmodule
