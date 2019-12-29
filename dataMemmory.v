module dataMemory
(address,write_data,read_data,mem_write,mem_read,clock);
input [4:0] address;
input [3:0] write_data;
input mem_write , mem_read , clock;
output [3:0] read_data;

reg [3:0] memory [63:0];
always@(posedge clock) 
	begin
		if(mem_write)
			memory[address] <= write_data;
	end
	assign read_data = memory[address];
endmodule


