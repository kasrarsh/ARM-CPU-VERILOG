module dataMemory
(address,write_data,read_data,mem_write,mem_read,clock);
parameter dataWidth = 4;
parameter addWidth = 5;
parameter memWidth = 64;
input [addWidth-1:0] address;
input [dataWidth-1:0] write_data;
input mem_write , mem_read , clock;
output [dataWidth-1:0] read_data;

reg [dataWidth-1:0] memory [memWidth-1:0];
always@(posedge clock) 
	begin
		if(mem_write)begin
			memory[address] <= write_data;
		end
	end
	assign read_data =(mem_read) ? memory[address] : 4'bz;
endmodule


