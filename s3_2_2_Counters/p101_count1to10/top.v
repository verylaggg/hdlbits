module top_module_p101 (
    input clk,
    input reset,
    output [3:0] q);
    always @(posedge clk) begin
        if(reset | q >= 10) q <= 1;
        else q <= q + 1;
    end

endmodule
