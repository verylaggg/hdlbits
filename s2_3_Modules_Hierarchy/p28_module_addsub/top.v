module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]b0 = b ^ {32{sub}};
    wire cout;
    add16 add16_0( .a(a[15:0]), .b(b0[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cout) );
    add16 add16_1( .a(a[31:16]), .b(b0[31:16]), .cin(cout), .sum(sum[31:16]), .cout() );
endmodule

