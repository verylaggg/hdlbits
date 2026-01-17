module top_module_p178 ();
    reg      clk;
    reg      reset;
    reg   	 t;
    wire	 q;
    initial begin
       clk = 0; 
       reset = 1'b1; t = 1'b0;
	   #10; reset = 1'b0; t = 1'b1;
    end
    always #5 clk = ~clk;
    tff tff ( .clk (clk), .reset (reset), .t (t), .q (q));
endmodule
