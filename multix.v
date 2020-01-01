module multix(input_0,input_1,outPut,select);
parameter dataWidth = 4;
parameter selectWidth = 1;

input [dataWidth-1:0] input_0,input_1;
input  select;
output reg [dataWidth:0]  outPut;

always @(input_0,input_1,select)
begin
	case(select)
		1'b0 : outPut = input_0;
		1'b1 : outPut = input_1;
	endcase
end
endmodule
