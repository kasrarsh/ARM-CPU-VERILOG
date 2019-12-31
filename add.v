module add(input_1,input_2,outPut);
parameter dataWidth = 4;
input [dataWidth-1:0] input_1,input_2;
output [dataWidth-1:0] outPut;

assign outPut = input_1 + input_2 ;
endmodule
