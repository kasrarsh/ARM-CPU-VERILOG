module Add(input_1, input_2, outPut);

    parameter delay=10;
    parameter dataWidth=64;
    input [dataWidth-1:0] input_1, input_2;
    output [dataWidth-1:0] outPut;

     assign #delay outPut = input_1+input_2;
endmodule
