`timescale 1ns / 1ps

module three_state_gates(iA,iEna,oTri);
    input iA;
    input iEna;
    output oTri;
    assign oTri = (iEna==1)? iA:'bz;
endmodule
