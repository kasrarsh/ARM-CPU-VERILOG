`include "add.v"
`include "instructionMemory.v"
`include "register.v"
`include "alu.v"
`include "mux.v"
`include "dataMemory.v"
module cpu;

parameter dataWidth = 64;
parameter instructionWidth = 64;
//pc
wire [63:0] currentPc;
wire [63:0] nextPc;

//instruction
wire [instructionWidth-1:0] instruction;

//control
wire Branch;
wire MemtoReg;
wire ALUSrc;

//registers
wire RegWrite;
wire [dataWidth-1:0]read_data1;
wire [dataWidth-1:0]read_data2;
wire [dataWidth-1:0]result_mux_after_dataMemory;

//aluControl
wire [1:0] ALUOp;


//alu
wire [2:0] result_alu_control;
wire [dataWidth-1:0] result_mux_after_registers;
wire zero;
wire [dataWidth-1:0] result_alu;

//dataMemory
wire [dataWidth-1 : 0]  result_dataMemory;
wire MemRead;
wire MemWrite;

Add adder1(
	currentPc,
	64'b100,
	nextPc
);
InstructionMemory insMem(
	currentPc,
	instruction
);
Register registers(
	clk,
	RegWrite,
	instruction[19:15],
	instruction[24:20],
	instruction[11:7],
	read_data1,
	read_data2,
	result_mux_after_registers
);
Mux mux_after_register(
	read_data2,
	instruction[63:0],
	result_mux_after_registers,
	ALUSrc

);


Alu alu(
	result_alu_control,
	read_data1,
	result_mux_after_registers,
	result_alu,
	zero
);
DataMemory dataMemory(
	result_alu,
	read_data2,
	result_dataMemory,
	MemWrite,
	MemRead,
	clk
);
Mux mux_after_dataMemory(
 	result_alu,
	result_dataMemory,
	result_mux_after_dataMemory,
	MemtoReg
);


endmodule
