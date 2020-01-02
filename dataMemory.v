module DataMemory
    ( mem_write, mem_read, clock,address, write_data, read_data);
    parameter delay =10;
    parameter dataWidth=64;
    parameter addressWidth=64;
    parameter memWidth=64;
    input [addressWidth-1:0] address;
    input [dataWidth-1:0] write_data;
    input mem_write, mem_read, clock;
    output [dataWidth-1:0] read_data;

    reg [dataWidth-1:0] memory [memWidth-1:0];
    always @(posedge clock)
        begin
            if (mem_write) begin
                #delay memory[address] <= write_data;
            end
        end
    assign #delay read_data = (mem_read) ? memory[address]:4'bz;
endmodule


