module Pc(clk, reset, result_mux_after_add, currentPc);
    parameter delay =10;
    parameter dataWidth=64;
    input [dataWidth-1:0] result_mux_after_add;
    input clk, reset;
    output reg [dataWidth-1:0] currentPc;
    always @(posedge clk)
        begin
            if (reset)
                currentPc =0 ;
            else
                currentPc = result_mux_after_add;
        end

endmodule
