module top_module_p131(
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
    
    parameter LEFT = 0, RIGHT = 1, LEFT_F = 2, RIGHT_F = 3, LEFT_DIG = 4, RIGHT_DIG = 5, SPLATTER = 6;
    reg [2:0]state, next;
    reg [4:0]cnt;
    always @(posedge clk or posedge areset)begin
        if(areset) cnt <= 0;
        else if(aaah) begin
            if(cnt>=20) cnt <= cnt; // avoid overflow
            else cnt <= cnt + 1; 
        end else  cnt <= 0;
    end
    
    always @(*) begin
        next = state;
        case(state)
            LEFT: next = ground ? (dig ? LEFT_DIG : (bump_left ? RIGHT : LEFT)) : LEFT_F;
            RIGHT: next = ground ? (dig ? RIGHT_DIG : (bump_right ? LEFT : RIGHT)) : RIGHT_F;
            LEFT_F: next = ground ? (cnt>='d20 ? SPLATTER : LEFT) : LEFT_F;
            RIGHT_F: next = ground ? (cnt>='d20 ? SPLATTER : RIGHT) : RIGHT_F;
            LEFT_DIG: next = ground ? LEFT_DIG : LEFT_F;
            RIGHT_DIG: next = ground ? RIGHT_DIG : RIGHT_F;
        endcase
    end
    
    always @(posedge clk or posedge areset)begin
        if(areset) state <= LEFT;
        else state <= next;
    end
    
    assign {walk_left, walk_right, aaah, digging} = state==SPLATTER ? {1'b0,1'b0,1'b0,1'b0} :
    {
     state==LEFT, 
     state==RIGHT, 
     state==LEFT_F | state==RIGHT_F, 
     state==LEFT_DIG | state==RIGHT_DIG
    };

endmodule
