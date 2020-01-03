module Shift(inPut, outPut);
    parameter delay =10;
    parameter dataWidth=64;
    input [dataWidth-1:0] inPut;
    output [dataWidth-1:0] outPut;

    assign outPut = inPut << 1;
endmodule

