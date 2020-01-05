module InstructionMemory
    (currentPc, instruction);
    parameter delay =10;
    parameter dataWidth=64;
    parameter memWidth=64;

    input [dataWidth-1:0] currentPc;
    output [dataWidth-1:0] instruction;
    reg [7:0] memory [memWidth-1:0];

    integer i;
    initial
    begin
        for ( i=0 ;i<memWidth-1;i = i + 1)
            memory[i] = i;
        //r-format
        memory[0] = 8'b00100011;
        //ld
        memory[4] =  8'b00000011;
        //sd
        memory[8] = 8'b00100011;
        //beq
        memory[12] = 8'b01100011;
    end

    assign  instruction[7:0] = memory[currentPc];
    assign  instruction[15:8] = memory[currentPc+1];
    assign  instruction[23:16] = memory[currentPc+2];
    assign  instruction[31:24] = memory[currentPc+3];
    assign instruction [63:32] = {memory[currentPc+4],memory[currentPc+5],memory[currentPc+6],memory[currentPc+7]};
//    assign  instruction[7:0] = 8'b00100011;
//    assign  instruction[15:8] = 8'b00000001;
//    assign  instruction[23:16] = 8'b00000010;
//    assign  instruction[31:24] = 8'b00000011;
//    assign  instruction[63:32] = 0;
endmodule


