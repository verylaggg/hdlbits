module top_module_p66 ( 
    input a, b,
    output cout, sum );
    assign sum = a ^ b;
    assign cout = a & b;

endmodule
