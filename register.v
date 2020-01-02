module Register
    (clock, reg_write, read_register1, read_register2, write_register, write_data, read_data1, read_data2);
    parameter delay =10;
    parameter dataWidth=64;
    parameter addressWidth=5;
    parameter memWidth=64;

    input clock;
    input reg_write;
    input [addressWidth-1:0] read_register1, read_register2, write_register;
    input [dataWidth-1:0] write_data;
    output [dataWidth-1:0] read_data1, read_data2;

    reg [dataWidth-1:0] registers [memWidth-1:0];



    always @(posedge clock)
        begin
            if (reg_write == 1) begin
                #delay registers[write_register] <= write_data;
            end
        end
    assign #delay read_data1 = registers[read_register1];
    assign #delay read_data2 = registers[read_register2];
endmodule

		
