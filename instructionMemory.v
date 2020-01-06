module InstructionMemory
    (currentPc, instruction);
    parameter delay =10;
    parameter dataWidth=64;
    parameter memWidth=64;

    input [dataWidth-1:0] currentPc;
    output reg [dataWidth-1:0] instruction;
    reg [7:0] memory [memWidth-1:0];

    integer i;
    initial
    begin
        for ( i=0 ;i<memWidth-1;i = i + 1)
            memory[i] = 0;
        //r-format -51-
        memory[0] = 8'b00110011;
        //ld  -3-
        memory[4] =  8'b00000011;
        //sd -35-
        memory[8] = 8'b00100011;
        //beq -99-
        memory[12] = 8'b01100011;
    end

//    assign  instruction[7:0] = memory[currentPc];
//    assign  instruction[15:8] = memory[currentPc+1];
//    assign  instruction[23:16] = memory[currentPc+2];
//    assign  instruction[31:24] = memory[currentPc+3];
//    assign instruction [63:32] = {memory[currentPc+4],memory[currentPc+5],memory[currentPc+6],memory[currentPc+7]};
	
    //assign  instruction[7:0] = 8'b00100011;
	//assign instruction[63:8] = 0;
always
begin
	//sd -35-
	instruction[7:0] = 8'b00100011;
	instruction[63:8] = 0;
		
	#delay 
		begin//ld -3-
		instruction[7:0] =8'b00000011;
		instruction[63:8] = 0;
		end
	#delay
		begin //r-format -51- -sum-
		instruction [63:0] = 0;
		instruction[7:0] =8'b00110011;
		instruction[14:12] = 3'b000;
		instruction[31:25] = 7'b0000000;
		end
	#delay
		begin//r-format -51- -mines-
		instruction [63:0] = 0;
		instruction[7:0] =8'b00110011;
		instruction[14:12] = 3'b000;
		instruction[31:25] = 7'b0100000;
		end
	#delay
		begin//beq -99-
		instruction[7:0] =8'b01100011;
		instruction[63:8] = 0;
		end
	#delay
		begin
		end
end
    

endmodule


