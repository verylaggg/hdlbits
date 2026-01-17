module top_module_p104 (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    assign c_enable = {Q1 == 4'd9 && Q0 == 4'd9, Q0 == 4'd9, 1'b1};
    assign OneHertz = {Q2 == 4'd9 && Q1 == 4'd9 && Q0 == 4'd9};
    wire [3:0]Q0, Q1, Q2;
    bcdcount counter0(	.clk(clk), .reset(reset),	.enable(c_enable[0]),	.Q(Q0));
    bcdcount counter1(	.clk(clk), .reset(reset),	.enable(c_enable[1]),	.Q(Q1));
    bcdcount counter2(	.clk(clk), .reset(reset),	.enable(c_enable[2]),	.Q(Q2));

endmodule
