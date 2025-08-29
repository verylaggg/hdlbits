module top_module ( input [31:0] a, input [31:0] b, output [31:0] sum);
    wire carry;
    add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],carry);
    add16 a2(a[31:16],b[31:16],carry,sum[31:16],);
endmodule

// Full adder module here
module add1 (input a, input b, input cin,   output sum, output cout );
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module add16_ex ( 
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);
    wire [15:0]cout_temp;
    add1 add0 (.a(a[0] ), .b(b[0] ), .cin(1'b0         ), .sum(sum[0] ), .cout(cout_temp[0] ));
    add1 add1 (.a(a[1] ), .b(b[1] ), .cin(cout_temp[0] ), .sum(sum[1] ), .cout(cout_temp[1] ));
    add1 add2 (.a(a[2] ), .b(b[2] ), .cin(cout_temp[1] ), .sum(sum[2] ), .cout(cout_temp[2] ));
    add1 add3 (.a(a[3] ), .b(b[3] ), .cin(cout_temp[2] ), .sum(sum[3] ), .cout(cout_temp[3] ));
    add1 add4 (.a(a[4] ), .b(b[4] ), .cin(cout_temp[3] ), .sum(sum[4] ), .cout(cout_temp[4] ));
    add1 add5 (.a(a[5] ), .b(b[5] ), .cin(cout_temp[4] ), .sum(sum[5] ), .cout(cout_temp[5] ));
    add1 add6 (.a(a[6] ), .b(b[6] ), .cin(cout_temp[5] ), .sum(sum[6] ), .cout(cout_temp[6] ));
    add1 add7 (.a(a[7] ), .b(b[7] ), .cin(cout_temp[6] ), .sum(sum[7] ), .cout(cout_temp[7] ));
    add1 add8 (.a(a[8] ), .b(b[8] ), .cin(cout_temp[7] ), .sum(sum[8] ), .cout(cout_temp[8] ));
    add1 add9 (.a(a[9] ), .b(b[9] ), .cin(cout_temp[8] ), .sum(sum[9] ), .cout(cout_temp[9] ));
    add1 add10(.a(a[10]), .b(b[10]), .cin(cout_temp[9] ), .sum(sum[10]), .cout(cout_temp[10]));
    add1 add11(.a(a[11]), .b(b[11]), .cin(cout_temp[10]), .sum(sum[11]), .cout(cout_temp[11]));
    add1 add12(.a(a[12]), .b(b[12]), .cin(cout_temp[11]), .sum(sum[12]), .cout(cout_temp[12]));
    add1 add13(.a(a[13]), .b(b[13]), .cin(cout_temp[12]), .sum(sum[13]), .cout(cout_temp[13]));
    add1 add14(.a(a[14]), .b(b[14]), .cin(cout_temp[13]), .sum(sum[14]), .cout(cout_temp[14]));
    add1 add15(.a(a[15]), .b(b[15]), .cin(cout_temp[14]), .sum(sum[15]), .cout(cout         ));
endmodule

