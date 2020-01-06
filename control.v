module Control(instruction, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    parameter delay =10;
    parameter aluOpWidth=2;
    parameter instructionWidth=7;

    input [6:0] instruction;
    output reg Branch;
    output reg MemRead;
    output reg MemtoReg;
    output reg [aluOpWidth-1:0] ALUOp;
    output reg MemWrite;
    output reg ALUSrc;
    output reg RegWrite;
    always @(instruction)
        begin
            case (instruction)
                //r-format
                7'b0110011: begin
                     Branch = 0;
                     MemRead = 0;
                     MemtoReg = 0;
                     ALUOp = 2'b10;
                     MemWrite = 0;
                     ALUSrc = 0;
                     RegWrite = 1;
                end
                //ld
                7'b0000011: begin
                     Branch = 0;
                     MemRead = 1;
                     MemtoReg = 1;
                     ALUOp = 2'b00;
                     MemWrite = 0;
                     ALUSrc = 1;
                     RegWrite = 1;
                end
                //sd
                7'b0100011: begin
                    Branch = 0;
                    MemRead = 0;
                    MemtoReg = 0;
                    ALUOp = 2'b00;
                    MemWrite = 1;
                    ALUSrc = 1;
                    RegWrite = 0;
                end
                //beq
                7'b1100011: begin
                     Branch = 1;
                     MemRead = 0;
                     MemtoReg = 0;
                     ALUOp = 2'b01;
                     MemWrite = 0;
                     ALUSrc = 0;
                     RegWrite = 0;
                end
            endcase
        end

endmodule


