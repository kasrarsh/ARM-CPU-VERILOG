module ImmGen(instruction, extendedInstruction);
    parameter dataWidth=64;
    parameter extendedWidth=64;
    input [dataWidth-1:0] instruction;
    output reg [extendedWidth-1:0] extendedInstruction;
    always @(instruction)
        begin
            case (instruction[6:0])
                //store
                7'b0100011: extendedInstruction [11:0]= instruction[31:20];
                //load
                7'b0000011: extendedInstruction [11:0]= {instruction[31:25], instruction[11:7]};
                //beq
                7'b1100011: extendedInstruction [11:0]= {instruction[31], instruction[30:25], instruction[11:8], instruction[7]};
            endcase
            extendedInstruction[extendedWidth-1:12] = 0 ;
        end


endmodule