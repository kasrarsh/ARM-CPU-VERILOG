module InstructionMemory
    (pc, instruction);
    parameter delay =10;
    input [63:0] pc;
    output [63:0] instruction;
    reg [7:0] memory [63:0];

    assign #delay instruction[7:0] = memory[pc+0];
    assign #delay instruction[15:8] = memory[pc+1];
    assign #delay instruction[23:16] = memory[pc+2];
    assign #delay instruction[31:24] = memory[pc+3];

endmodule

