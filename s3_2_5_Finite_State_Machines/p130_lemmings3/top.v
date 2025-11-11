module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT = 0, RIGHT = 1, LEFT_F = 2, RIGHT_F = 3, LEFT_DIG = 4, RIGHT_DIG = 5;
    reg [2:0]state, next;
    
    always @(*) begin
        case(state)
            LEFT: next = ground ? (dig ? LEFT_DIG : (bump_left ? RIGHT : LEFT)) : LEFT_F;
            RIGHT: next = ground ? (dig ? RIGHT_DIG : (bump_right ? LEFT : RIGHT)) : RIGHT_F;
            LEFT_F: next = ground ? LEFT : LEFT_F;
            RIGHT_F: next = ground ? RIGHT : RIGHT_F;
            LEFT_DIG: next = ground ? LEFT_DIG : LEFT_F;
            RIGHT_DIG: next = ground ? RIGHT_DIG : RIGHT_F;
        endcase
    end
    always @(posedge clk or posedge areset)begin
        if(areset) state <= LEFT;
        else state <= next;
    end
    
    assign {walk_left, walk_right, aaah, digging} = 
    {
     state==LEFT, 
     state==RIGHT, 
     state==LEFT_F | state==RIGHT_F, 
     state==LEFT_DIG | state==RIGHT_DIG
    };

endmodule
