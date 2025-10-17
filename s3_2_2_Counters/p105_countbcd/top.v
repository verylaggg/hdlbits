module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[3:1] = {q[11:8] == 9 && q[7:4] == 9 && q[3:0] == 9, q[7:4] == 9 && q[3:0] == 9, q[3:0] == 9};
    always @(posedge clk)begin
        if(reset | q[3:0] == 9) q[3:0] <= 0;
        else q[3:0] <= q[3:0] + 1;
    end
    always @(posedge clk)begin
        if(reset | (q[7:4] == 9 && ena[1])) q[7:4] <= 0;
        else if(ena[1]) q[7:4] <= q[7:4] + 1;
        else q[7:4] <= q[7:4];
    end
    always @(posedge clk)begin
        if(reset | (q[11:8] == 9 && ena[2])) q[11:8] <= 0;
        else if(ena[2]) q[11:8] <= q[11:8] + 1;
        else q[11:8] <= q[11:8];
    end
    always @(posedge clk)begin
        if(reset | (q[15:12] == 9 && ena[3])) q[15:12] <= 0;
        else if(ena[3]) q[15:12] <= q[15:12] + 1;
        else q[15:12] <= q[15:12];
    end

endmodule