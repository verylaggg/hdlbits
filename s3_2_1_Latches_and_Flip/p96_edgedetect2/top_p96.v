module top_module_p96 (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]in_last;
    always @(posedge clk)begin
        in_last <= in;
        anyedge <= (~in_last & in) | (in_last & ~in);
    end
endmodule

