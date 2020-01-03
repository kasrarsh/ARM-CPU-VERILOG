module InstructionMemory
    (currentPc, instruction);
    parameter delay =10;
    parameter dataWidth=64;
    parameter memWidth=64;

    input [dataWidth-1:0] currentPc;
    output [dataWidth-1:0] instruction;
    reg [dataWidth-1:0] memory [memWidth-1:0];

    integer i;
    initial
    begin
        for ( i=0 ;i<memWidth-1;i = i + 1)
            memory[i] = 1;
    end

//    assign #delay instruction[7:0] = memory[currentPc+0];
//    assign #delay instruction[15:8] = memory[currentPc+1];
//    assign #delay instruction[23:16] = memory[currentPc+2];
//    assign #delay instruction[31:24] = memory[currentPc+3];
    assign  instruction[7:0] = 8'b00100011;
    assign  instruction[15:8] = 8'b00000001;
    assign  instruction[23:16] = 8'b00000010;
    assign  instruction[31:24] = 8'b00000011;
    assign  instruction[63:32] =0 ;

endmodule


