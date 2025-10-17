module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    //秒 ss
    reg [3:0]s0, s1;
    assign ss = {s1, s0};
    
    always @(posedge clk)begin
        if(reset | (s0 == 9 && ena)) s0 <= 0;
        else if(ena) s0 <= s0 + 1;
        else s0 <= s0;
    end
    always @(posedge clk)begin
        if(reset | (s1 == 5 && s0 == 9 && ena)) s1 <= 0;
        else if(s0 == 9 && ena) s1 <= s1 + 1;
        else s1 <= s1;        
    end
    //分 mm
    reg [3:0]m0, m1;
    assign mm = {m1, m0};
    
    always @(posedge clk)begin
        if(reset | (m0 == 9 && s1 == 5 && s0 == 9 && ena)) m0 <= 0;
        else if(s1 == 5 && s0 == 9 && ena) m0 <= m0 + 1;
        else m0 <= m0;
    end
    always @(posedge clk)begin
        if(reset | (m1 == 5 && m0 == 9 && s1 == 5 && s0 == 9 && ena)) m1 <= 0;
        else if(m0 == 9 && s1 == 5 && s0 == 9 && ena) m1 <= m1 + 1;
        else m1 <= m1;        
    end
    //時 hh
    reg [3:0]h;
    always @(posedge clk)begin
        if(reset | (h == 11 && mm == 8'h59 && ss == 8'h59 && ena)) h <= 0;
        else if(mm == 8'h59 && ss == 8'h59 && ena) h <= h + 1;
        else h <= h;
    end
    always @(*) begin
        case(h)
            0: hh = {4'h1, 4'h2};
            1: hh = {4'h0, 4'h1};
            2: hh = {4'h0, 4'h2};
            3: hh = {4'h0, 4'h3};
            4: hh = {4'h0, 4'h4};
            5: hh = {4'h0, 4'h5};
            6: hh = {4'h0, 4'h6};
            7: hh = {4'h0, 4'h7};
            8: hh = {4'h0, 4'h8};
            9: hh = {4'h0, 4'h9};
            10: hh = {4'h1, 4'h0};
            11: hh = {4'h1, 4'h1};
            default: hh = hh;
        endcase
    end
    //pm
    always @(posedge clk)begin
        if(reset) pm <= 0;
        else if(hh == 8'h11 && mm == 8'h59 && ss == 8'h59) pm <= ~pm;
        else pm <= pm;
    end

endmodule
