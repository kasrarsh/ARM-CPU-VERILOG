module ALUControl(ALUOp, instruction, Operation);
    parameter delay =10;
    parameter aluOpWidth=2;
    parameter instructionWidth=10;
    parameter operationWidth=4;

    input [aluOpWidth-1:0] ALUOp;
    input [instructionWidth-1:0] instruction;
    output reg [operationWidth-1:0] Operation;

    always @(ALUOp, instruction)
        begin
            case (ALUOp)
                2'b00: Operation = 4'b0010;
                2'bx1: Operation = 4'b0110;
                2'b1x:
                    case (instruction)
                        10'b0000000000:  Operation = 4'b0010;
                        10'b0100000000:  Operation = 4'b0110;
                        10'b0000000111:  Operation = 4'b0000;
                        10'b0000000110:  Operation = 4'b0001;
                    endcase
            endcase
        end
endmodule
