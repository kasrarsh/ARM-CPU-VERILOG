module Control(instruction,Branch,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite);
parameter aluOpWidth = 2;
parameter instructionWidth = 7;

input [instructionWidth-1:0] instruction ;
output Branch;
output MemRead;
output MemtoReg;
output [aluOpWidth-1:0] ALUOp;
output MemWrite;
output ALUSrc;
output RegWrite;

always @(instruction)
	begin
		case(instruction)
		7'b0110011:begin Branch = 0; MemRead = 0; MemtoReg = 0; ALUOp=2'b10; MemWrite=0; ALUSrc=0; RegWrite=1; end
		7'b0000011:Branch = 0; MemRead = 1; MemtoReg = 1; ALUOp=2'b00; MemWrite=0; ALUSrc=1; RegWrite=1;
		7'b0100011:Branch = 0; MemRead = 0; MemtoReg = 0; ALUOp=2'b00; MemWrite=1; ALUSrc=1; RegWrite=0;
		7'b1100011:Branch = 1; MemRead = 0; MemtoReg = 0; ALUOp=2'b01; MemWrite=0; ALUSrc=0; RegWrite=0;
	end
endmodule
