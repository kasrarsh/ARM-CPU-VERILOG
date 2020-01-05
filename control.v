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
                    #delay Branch = 0;
                    #delay MemRead = 0;
                    #delay MemtoReg = 0;
                    #delay ALUOp = 2'b10;
                    #delay MemWrite = 0;
                    #delay ALUSrc = 0;
                    #delay RegWrite = 1;
                end
                //ld
                7'b0000011: begin
                    #delay Branch = 0;
                    #delay MemRead = 1;
                    #delay MemtoReg = 1;
                    #delay ALUOp = 2'b00;
                    #delay MemWrite = 0;
                    #delay ALUSrc = 1;
                    #delay RegWrite = 1;
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
                    #delay Branch = 1;
                    #delay MemRead = 0;
                    #delay MemtoReg = 0;
                    #delay ALUOp = 2'b01;
                    #delay MemWrite = 0;
                    #delay ALUSrc = 0;
                    #delay RegWrite = 0;
                end
            endcase
        end

endmodule


