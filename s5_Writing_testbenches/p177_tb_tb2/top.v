module top_module();
    reg	clk; initial clk = 0;
    reg in;
    reg [2:0] s;
    wire out;
    q7 q7_x(.clk(clk), .in(in), .s(s), .out(out));
    initial begin
        in = 0; s = 3'h2;
        @(negedge clk); in = 0; s = 3'h6;
        @(negedge clk); in = 1; s = 3'h2;
        @(negedge clk); in = 0; s = 3'h7;
        @(negedge clk); in = 1; s = 3'h0;
        repeat(3) @(negedge clk); in = 0;
               
    end
    always #5 clk = ~clk;

endmodule
