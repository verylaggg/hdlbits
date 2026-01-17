`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire lv1_a, lv1_b;
    wire lv2_a;
    assign lv1_a = a & b;
    assign lv1_b = c & d;
    assign lv2_a = lv1_a | lv1_b;
    assign out = lv2_a;
    assign out_n = ~lv2_a;

endmodule
