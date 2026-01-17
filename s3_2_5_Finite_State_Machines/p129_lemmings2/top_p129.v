module top_module_p129(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT = 0, RIGHT = 1, LEFT_F = 2, RIGHT_F = 3;
    reg [1:0]state, next;
    
    always @(*) begin
        case(state)
            LEFT: next = ground ? (bump_left ? RIGHT : LEFT) : LEFT_F;
            RIGHT: next = ground ? (bump_right ? LEFT : RIGHT) : RIGHT_F;
            LEFT_F: next = ground ? LEFT : LEFT_F;
            RIGHT_F: next = ground ? RIGHT : RIGHT_F;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset) state <= LEFT;
        else state <= next;
    end
    
    assign {walk_left, walk_right, aaah} = {state==LEFT, state==RIGHT, state==LEFT_F | state==RIGHT_F};

endmodule
