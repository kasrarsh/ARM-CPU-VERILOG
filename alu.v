<<<<<<< HEAD
module Alu (select, A, B, F,zero);
parameter dataWidth =64;
parameter selector =3 ;
=======
module alu (select, A, B, F,zero);
parameter dataWidth = 4;
parameter selector =4 ;
>>>>>>> b3d27521b7a4fa68050bb12e836083f611088f80
input [selector-1:0] select;
input [dataWidth-1:0] A, B;
output reg [dataWidth-1:0] F;
output zero;

always @(select, A, B)
case (select)
4'b0000: F = A & B;
4'b0001: F = A ^ B;
4'b0010: F = A + B;
4'b0110: F = A - B;
endcase
endmodule
