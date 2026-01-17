module top_module_p134(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    localparam IDLE = 0, BUSY = 1, DONE = 2;
    reg [3:0] state, state_n, cnt, cnt_n;
    reg [23:0] out_bytes_n;
    
    always @ (*) begin
        cnt_n = 0;
        case (state)
            IDLE: begin
                state_n = in[3] ? BUSY : IDLE;
                out_bytes_n = in[3] ? {out_bytes[15:0], in} : out_bytes;
            end
        	BUSY: begin
                state_n = cnt>=1 ? DONE : BUSY;
            	cnt_n <= cnt + 1'b1;
                out_bytes_n = {out_bytes[15:0], in};
            end
            DONE: begin
                state_n = in[3] ? BUSY : IDLE;
                out_bytes_n = in[3] ? {out_bytes[15:0], in} : out_bytes;
            end
        endcase
    end
    
    always @ (posedge clk) begin
        if (reset) begin
            state <= IDLE;
            cnt <= 'h0;
        	out_bytes <= 0;
        end else begin
            state <= state_n;
            cnt <= cnt_n;
        	out_bytes <= out_bytes_n;
        end
    end
    
    assign done = state == DONE;
endmodule
