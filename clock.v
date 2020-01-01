module Clock(clk);

    parameter delay = 10;
    output reg clk;
    always
        begin
            clk=0;
            #delay;
            clk=1;
            #delay;
        end
endmodule