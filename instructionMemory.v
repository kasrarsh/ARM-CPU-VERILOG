module InstructionMemory
(pc,instruction);
input [63:0] pc;
output [63:0] instruction;
reg [7:0] memory [63:0];

assign instruction[7:0] = memory[pc+0];
assign instruction[15:8] = memory[pc+1];
assign instruction[23:16] = memory[pc+2];
assign instruction[31:24] = memory[pc+3];

endmodule

