module Alu(select, A, B, F, zero);
    parameter delay =10;
    parameter dataWidth=64;
    parameter selector=4;

    input [selector-1:0] select;
    input [dataWidth-1:0] A, B;
    output reg [dataWidth-1:0] F;
    output reg zero;

    always @(select, A, B)
    begin
        case (select)
            4'b0000:  F = A & B;
            4'b0001:  F = A ^ B;
            4'b0010:  F = A+B;
            4'b0110:  F = A-B;
        endcase
        if (F == 0)
            zero=1;
        else
            zero=0;
    end

endmodule
