module alu (select, A, B, F,zero);
parameter dataWidth = 4;
parameter selector =3 ;
input [selector-1:0] select;
input [dataWidth-1:0] A, B;
output reg [dataWidth-1:0] F;
output zero;

always @(select, A, B)
case (select)
0: F = A & B;
1: F = A ^ B;
2: F = A + B;
6: F = A - B;
endcase
endmodule
