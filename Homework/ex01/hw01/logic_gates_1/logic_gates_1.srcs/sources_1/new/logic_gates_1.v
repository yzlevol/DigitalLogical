module logic_gates_1(iA,iB,oAnd,oOr,oNot);
    input iA, iB;
    output oAnd,oOr,oNot;
    and and_inst(oAnd, iA,iB);
    or or_inst(oOr, iA,iB);
    not not_inst(oNot, iA);
endmodule