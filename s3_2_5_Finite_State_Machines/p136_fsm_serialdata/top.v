module top_module_p136(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    parameter IDLE=0, START=1, DATA=2, STOP=3, ERROR=4;
    reg [2:0]state, state_n;
    reg [2:0]cnt;
    reg [7:0]data, data_n;
    
    always @(*) begin
        data_n = data;
        state_n = state;
        case(state)
            IDLE: state_n = !in ? START : IDLE;
            START: begin
                state_n = DATA;
                data_n = {in, data[7:1]};
            end
            DATA: begin
                if (cnt <= 6) begin
                    state_n = DATA;
                    data_n = {in, data[7:1]};
                end else
                    state_n = in ? STOP: ERROR;
            end
            STOP: state_n = in ? IDLE : START;
            ERROR: state_n = in ? IDLE : ERROR;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state <= IDLE;
            cnt <= 0;
            data <= 0;
        end else begin
            state <= state_n;
            cnt <= (state == DATA) ? cnt + 1 : 0;
            data <= data_n;
        end
    end
    
    assign done = state == STOP;
    assign out_byte = data;
endmodule