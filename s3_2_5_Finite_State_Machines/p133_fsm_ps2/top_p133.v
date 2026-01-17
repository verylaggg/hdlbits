module top_module_p133(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    
    localparam IDLE = 0, BUSY = 1, DONE = 2;
    reg [3:0] state, state_n, cnt, cnt_n;
    
    always @ (*) begin
        state_n = state;
        cnt_n = 0;
        case (state)
            IDLE: state_n = in[3] ? BUSY : IDLE;
        	BUSY: begin
                state_n = cnt>=1 ? DONE : BUSY;
            	cnt_n <= cnt + 1'b1;
            end
            DONE: state_n = in[3] ? BUSY : IDLE;
        endcase
    end
    
    always @ (posedge clk) begin
        if (reset) begin
            state <= IDLE;
            cnt <= 'h0;
        end else begin
            state <= state_n;
            cnt <= cnt_n;
        end
    end
    
    assign done = state == DONE;

endmodule
