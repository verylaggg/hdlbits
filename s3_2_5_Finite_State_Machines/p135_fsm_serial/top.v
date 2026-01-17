module top_module_p135(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter IDLE=0, START=1, DATA=2, STOP=3, ERROR=4;
    reg [2:0]state, state_n;
    reg [2:0]cnt;
    
    always @(*) begin
        case(state)
            IDLE: state_n = !in ? START : IDLE;
            START: state_n = DATA;
            DATA: state_n = (cnt <= 6) ? DATA : (in ? STOP: ERROR);
            STOP: state_n = in? IDLE : START;
            ERROR: state_n = in ? IDLE : ERROR;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset) begin
            state <= IDLE;
            cnt <= 0;
        end else begin
            state <= state_n;
            cnt <= (state == DATA) ? cnt + 1 : 0;
        end
    end
    
    assign done = state==STOP;

endmodule
