module shift(inPut,outPut);

parameter dataWidth = 4 ;
input [dataWidth-1:0] inPut;
output [dataWidth-1:0] outPut;

assign outPut = inPut << 1;
endmodule

