module top_module_p61( 
    input a, b, sel,
    output out ); 
    assign out = sel ? b : a;

endmodule
