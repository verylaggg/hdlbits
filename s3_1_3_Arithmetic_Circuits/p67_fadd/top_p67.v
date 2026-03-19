module top_module_p67( 
    input a, b, cin,
    output cout, sum );
    assign sum = (a ^ b) & ~cin | ~(a ^ b)  & cin;
    assign cout = (a & b) | ((a ^ b) & cin) ;

endmodule
