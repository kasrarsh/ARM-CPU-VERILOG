module InstructionMemory
    (pc, instruction);
    parameter delay =10;
    parameter dataWidth=64;
    parameter memWidth=64;

    input [dataWidth-1:0] pc;
    output [dataWidth-1:0] instruction;
    reg [dataWidth-1:0] memory [memWidth-1:0];

    integer i;
    initial
    begin
        for ( i=0 ;i<memWidth-1;i = i + 1)
            memory[i] = i;
    end

    assign #delay instruction[7:0] = memory[pc+0];
    assign #delay instruction[15:8] = memory[pc+1];
    assign #delay instruction[23:16] = memory[pc+2];
    assign #delay instruction[31:24] = memory[pc+3];

endmodule


