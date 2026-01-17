module top_module_p7( 
    input a, 
    input b, 
    output out );
    assign out = ~(a | b);
endmodule