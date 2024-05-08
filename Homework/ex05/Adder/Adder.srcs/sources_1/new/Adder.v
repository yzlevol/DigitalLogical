`timescale 1ns / 1ps
module Adder(
    input [7:0] iData_a,    
    input [7:0] iData_b,
    input iC,
    output [7:0] oData,
    output oData_C
);
    wire oC1;
    wire oC2;
    wire oC3;
    wire oC4;
    wire oC5;
    wire oC7;
    wire oC6;
    FA A1(.iA(iData_a[0]),.iB(iData_b[0]),.iC(iC),.oS(oData[0]),.oC(oC1));
    FA A2(.iA(iData_a[1]),.iB(iData_b[1]),.iC(oC1),.oS(oData[1]),.oC(oC2));
    FA A3(.iA(iData_a[2]),.iB(iData_b[2]),.iC(oC2),.oS(oData[2]),.oC(oC3)); 
    FA A4(.iA(iData_a[3]),.iB(iData_b[3]),.iC(oC3),.oS(oData[3]),.oC(oC4));
    FA A5(.iA(iData_a[4]),.iB(iData_b[4]),.iC(oC4),.oS(oData[4]),.oC(oC5));
    FA A6(.iA(iData_a[5]),.iB(iData_b[5]),.iC(oC5),.oS(oData[5]),.oC(oC6));
    FA A7(.iA(iData_a[6]),.iB(iData_b[6]),.iC(oC6),.oS(oData[6]),.oC(oC7));
    FA A8(.iA(iData_a[7]),.iB(iData_b[7]),.iC(oC7),.oS(oData[7]),.oC(oData_C));
endmodule