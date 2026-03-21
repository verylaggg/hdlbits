module top_module_p58( 
    input [2:0] in,
    output reg [1:0] out );
    /* //method 1
    wire o0 = (in[0] & ~in[1] & ~in[2]) | (~in[0] & in[1] & ~in[2]) | (~in[0] & ~in[1] & in[2]) | (in[0] & in[1] & in[2]);
    wire o1 = (in[0] & in[1] & ~in[2]) | (in[0] & ~in[1] & in[2]) | (~in[0] & in[1] & in[2]) | (in[0] & in[1] & in[2]);
    assign out = {o1, o0};
*/
//    method 2
//    assign out = in[0] + in[1] + in[2];
    
//method3
    always @(*) begin
        case(in)
            0: out = 2'd0;
            1: out = 2'd1;
            2: out = 2'd1;
            3: out = 2'd2;
            4: out = 2'd1;
            5: out = 2'd2;
            6: out = 2'd2;
            7: out = 2'd3;
        endcase
    end
    
endmodule
