module register
(reg_write,clock,read_register1,read_register2,write_register,read_data1,read_data2,write_data);
input clock;
input [4:0] read_register1,read_register2,write_register;
input [3:0] write_data;
output [3:0] read_data1,read_data2;

reg [3:0] registers[63:0];

always @(posedge clock)
	if(reg_write == 1)
		registers[write_register] <= write_data;
	else{
		read_data1 <= registers[read_register1];
		read_data2 <= registers[read_register2];
		}
	end
end
endmodule

		
