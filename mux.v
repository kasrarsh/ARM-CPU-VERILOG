module Mux(input_0, input_1, outPut, select);
    parameter delay =10;
    parameter dataWidth=64;

    input [dataWidth-1:0] input_0, input_1;
    input select;
    output reg [dataWidth-1:0] outPut;

    always @(input_0, input_1, select)
        begin
            case (select)
                0: #delay outPut = input_0;
                1: #delay outPut = input_1;
            endcase
        end
endmodule
