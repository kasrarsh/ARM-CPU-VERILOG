`include "pc.v"
`include "add.v"
`include "instructionMemory.v"
`include "register.v"
`include "alu.v"
`include "mux.v"
`include "dataMemory.v"
`include "shift.v"
`include "control.v"
`include "aluControl.v"
module cpu;
parameter delay =10;
parameter dataWidth = 64;
parameter instructionWidth = 64;
//pc
wire [63:0] currentPc;
wire  [63:0] nextPc;
wire clk;
reg pcReset;
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
wire [3:0] result_alu_control;
wire [dataWidth-1:0] result_mux_after_registers;
wire zero;
wire [dataWidth-1:0] result_alu;

//shift
wire [dataWidth-1:0] result_shift_left;

//dataMemory
wire [dataWidth-1 : 0]  result_dataMemory;
wire MemRead;
wire MemWrite;


//adder after shift
wire [dataWidth-1:0] result_add_after_shift_left;

wire [dataWidth-1:0] result_mux_after_add;
initial
begin
	pcReset =1;
	#delay pcReset=0;
 end
Pc pc(
		clk,
		pcReset,
        result_mux_after_add,
        currentPc
);
Add add(
	currentPc,
	64'b100,
	nextPc
);
InstructionMemory instructionMemory(
	currentPc,
	instruction
);
Control control(
	instruction[6:0],
	Branch,
	MemRead,
	MemtoReg,
	ALUOp,
	MemWrite,
	ALUSrc,
	RegWrite
);
Register registers(
	clk,
	RegWrite,
	instruction[19:15],
	instruction[24:20],
	instruction[11:7],
	read_data1,
	read_data2,
	result_mux_after_dataMemory
);
Mux mux_after_registers(
	read_data2,
	instruction[63:0],
	result_mux_after_registers,
	ALUSrc

);
Add add_after_shift_left(
	currentPc,
	result_shift_left,
	result_add_after_shift_left
);
Shift shift(
        instruction,
        result_shift_left
);
Alu alu(
	result_alu_control,
	read_data1,
	result_mux_after_registers,
	result_alu,
	zero
);
Mux mux_after_add(
	nextPc,
	result_add_after_shift_left,
	result_mux_after_add,
	(Branch ^ zero)
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
