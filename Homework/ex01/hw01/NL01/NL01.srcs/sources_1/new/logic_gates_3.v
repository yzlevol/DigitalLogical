`timescale 1ns / 1ps

module logic_gates_3(iA,iB,oAnd,oOr,oNot);
    input iA, iB;
    output oAnd,oOr,oNot;
    reg oAnd, oOr, oNot;
    always @ (*)
    begin
        oAnd = iA & iB;
        oOr = iA | iB;
        oNot = ~ iA;
    end
endmodule
