module Alu(select, A, B, F, zero);
    parameter delay =10;
    parameter dataWidth=64;
    parameter selector=4;

    input [selector-1:0] select;
    input [dataWidth-1:0] A, B;
    output reg [dataWidth-1:0] F;
    output zero;

    always @(select, A, B)
        case (select)
            4'b0000: #delay F = A & B;
            4'b0001: #delay F = A ^ B;
            4'b0010: #delay F = A+B;
            4'b0110: #delay F = A-B;
        endcase
endmodule
