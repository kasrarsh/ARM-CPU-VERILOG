`include "clock.v"
`include "pc.v"
`include "add.v"
`include "instructionMemory.v"
`include "register.v"
`include "immGen.v"
`include "alu.v"
`include "mux.v"
`include "dataMemory.v"
`include "shift.v"
`include "control.v"
`include "aluControl.v"
module cpu;
    initial
        begin
            pcReset = 1;
            #(delay+500) pcReset = 0;
        end

    parameter delay=10;
    parameter dataWidth=64;
    parameter instructionWidth=64;
    wire clk;
    reg pcReset;
//output of pc
    wire [63:0] currentPc;

//output of instruction
    wire [instructionWidth-1:0] instruction;

//output of control
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;

//output of registers
    wire [dataWidth-1:0] read_data1;
    wire [dataWidth-1:0] read_data2;

///output of immGen
    wire [dataWidth-1:0] extendedInstruction;


//output of aluControl
    wire [dataWidth-1:0] result_alu;


//output of alu
    wire [3:0] result_alu_control;
    wire zero;


//output of shift
    wire [dataWidth-1:0] result_shift_left;

//output of dataMemory
    wire [dataWidth-1:0] result_dataMemory;


//output of adders
    wire [dataWidth-1:0] result_add_after_shift_left;
    wire [63:0] result_add_upper_pc;

//output of mux
    wire [dataWidth-1:0] result_mux_after_dataMemory;
    wire [dataWidth-1:0] result_mux_after_registers;
    wire [dataWidth-1:0] result_mux_after_add;


    Clock clock(clk);
    Pc pc(
        clk,
        pcReset,
        result_mux_after_add,
        currentPc
    );

    Add add_upper_pc(
        currentPc,
        64'b100,
        result_add_upper_pc
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
        result_mux_after_dataMemory,
        read_data1,
        read_data2

    );
    ImmGen immGen(
        instruction,
        extendedInstruction
    );
    Mux mux_after_registers(
        ALUSrc,
        read_data2,
        instruction[63:0],
        result_mux_after_registers
    );
    Shift shift(
        instruction,
        result_shift_left
    );
    Add add_after_shift_left(
        currentPc,
        result_shift_left,
        result_add_after_shift_left
    );
    ALUControl aluControl(
        ALUOp,
        {instruction[31:25], instruction[14:12]},
        result_alu_control

    );
    Alu alu(
        result_alu_control,
        read_data1,
        result_mux_after_registers,
        result_alu,
        zero
    );
    Mux mux_after_add(
        (Branch ^ zero),
        result_add_upper_pc,
        result_add_after_shift_left,
        result_mux_after_add

    );
    DataMemory dataMemory(
        MemWrite,
        MemRead,
        clk,
        result_alu,
        read_data2,
        result_dataMemory
    );
    Mux mux_after_dataMemory(
        MemtoReg,
        result_alu,
        result_dataMemory,
        result_mux_after_dataMemory
    );
    initial
        begin
            $dumpfile("cpu.vcd");
            $dumpvars(0, cpu);
            #200;
            $finish;
        end
endmodule
