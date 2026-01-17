module top_module_p174 ( );
reg	clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    dut dut_x(.clk(clk));
endmodule
