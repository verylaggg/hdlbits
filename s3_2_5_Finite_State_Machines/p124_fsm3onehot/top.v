module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); 
    
///method1///
    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = (state[A] & (~in)) | (state[C] & (~in));
    assign next_state[B] = (state[A] & ( in)) | (state[B] & ( in)) | (state[D] & ( in));
    assign next_state[C] = (state[B] & (~in)) | (state[D] & (~in));
    assign next_state[D] = (state[C] & ( in));
    
    assign out = state[D];
    /*
///method2///
    parameter A = 1;//0001
    parameter B = 2;//0010
    parameter C = 4;//0100
    parameter D = 8;//1000
    
    always @(*) begin
        case(state)
            A: next_state = in ? B : A;
            B: next_state = in ? B : C;
            C: next_state = in ? D : A;
            D: next_state = in ? B : C;
        endcase
    end
    // Output logic: 
    assign out = state == D;
*/

endmodule
