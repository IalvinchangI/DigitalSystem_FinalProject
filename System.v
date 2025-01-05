module System (rst,keyPadBuf,clock,b0,b1,b2,b3,b4,b5,b6,b7,b8,gameend,timeLeftten,timeLeftone,whosTurn); // top module
input [3:0] keyPadBuf;
input clock; //10HZ
input rst;
output  [1:0] b0,b1,b2,b3,b4,b5,b6,b7,b8;
output  [1:0] gameend; //00 not end, 01 Owin, 10 Xwin
output  [3:0] timeLeftten;
output  [3:0] timeLeftone;
output   whosTurn; //0:O,1:X
wire [3:0] location;
wire [1:0] mark;

CurrentInput CI(.clk(clock),.rst(rst),.keyPadBuf(keyPadBuf),.a0(b0),.a1(b1),.a2(b2),.a3(b3),.a4(b4),.a5(b5),.a6(b6),.a7(b7),.a8(b8),.location(location),.whosTurn(whosTurn),.mark(mark),.timeLeft1(timeLeftten),.timeLeft2(timeLeftone));
Marker_and_Recorder MR(.clk(clock),.rst(rst),.game_state(gameend),.whosTurn(whosTurn),.mark(mark),.position(location),.x0(b0),.x1(b1),.x2(b2),.x3(b3),.x4(b4),.x5(b5),.x6(b6),.x7(b7),.x8(b8),.y0(b0),.y1(b1),.y2(b2),.y3(b3),.y4(b4),.y5(b5),.y6(b6),.y7(b7),.y8(b8));
GameIsOver GIO(.b0(b0),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),.b6(b6),.b7(b7),.b8(b8),.gameend(gameend));


endmodule

module CurrentInput(
    clk, rst, keyPadBuf,
    a0, a1, a2, a3, a4, a5, a6, a7, a8,
    location, whosTurn, mark, timeLeft1, timeLeft2
);
    input rst, clk; // 10Hz clock
    input [3:0] keyPadBuf;
    input [1:0] a0, a1, a2, a3, a4, a5, a6, a7, a8; // The matrix after elimination

    output reg [3:0] location;//0~8
    output reg [1:0] mark;//10:X, 01:O, 00:default
    output reg whosTurn; // 1: X, 0: O
    output reg [3:0] timeLeft1, timeLeft2; //1 for ten digits, 2 for single digit

    reg [7:0] timeCounter;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            timeCounter <= 8'd80;
            whosTurn <= 0;
            mark <= 2'b00;
            location <= 4'd0;
        end else begin
            if (timeCounter == 0) begin
                whosTurn <= ~whosTurn;
                timeCounter <= 8'd80;
            end else begin
                timeCounter <= timeCounter - 1;
            end

            timeLeft1 <= timeCounter/10;
            timeLeft2 <= timeCounter%10;

            case (keyPadBuf)
                4'd0: begin
                    if (a0 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd0;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
                4'd1: begin
                    if (a1 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd1;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
                4'd2: begin
                    if (a2 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd2;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
                4'd3: begin
                    if (a3 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd3;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
                4'd4: begin
                    if (a4 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd4;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
                4'd5: begin
                    if (a5 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd5;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
                4'd6: begin
                    if (a6 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd6;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
                4'd7: begin
                    if (a7 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd7;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
                4'd8: begin
                    if (a8 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd8;
                        timeCounter <= 8'd80;
                    end else mark <= 2'b00;
                end
            endcase
        end
    end
endmodule

module Marker_and_Recorder( 
    input clk,
    input rst,
    input game_state, 
    input whosTurn,                      // 1:X,  0:O
    input [1:0] mark,                    // mark for 10:X, 01:O, 00:default
    input [3:0] position,                // choice of position for this run on grid (0-8)
                                         // 01:O     10:X    00:empty
    input [1:0] x0, x1, x2, x3, x4, x5, x6, x7, x8,
    output reg [1:0] y0, y1, y2, y3, y4, y5, y6, y7, y8              
);  

    reg [1:0] game_grid [0:8];

    reg [1:0] circle_count;              // 0,1,2,3,2,3,2,3,...
    reg [1:0] cross_count;

    // queue indices
    reg [1:0] circle_front;              // 0,1,2,3,0,1,2,3....
    reg [1:0] cross_front;     
    reg [1:0] circle_rear;               // 0,1,2,3,0,1,2,3....
    reg [1:0] cross_rear;               
    
    integer i;                           // for looping

    reg [3:0] circle_history [0:3]; 
    reg [3:0] cross_history [0:3]; 

    always @(position or negedge rst) begin
        game_grid[0] <= x0;
        game_grid[1] <= x1;
        game_grid[2] <= x2;
        game_grid[3] <= x3;
        game_grid[4] <= x4;
        game_grid[5] <= x5;
        game_grid[6] <= x6;
        game_grid[7] <= x7;
        game_grid[8] <= x8;

        if (~rst) begin
            circle_count <= 2'b00;
            cross_count <= 2'b00;
            circle_front <= 2'b00;
            cross_front <= 2'b00;
            circle_rear <= 2'b00;
            cross_rear <= 2'b00;

            // initialize grid
            for (i = 0; i < 9; i = i + 1) begin
                game_grid[i] <= 2'b00;
            end

            // initialize history queue
            for (i = 0; i < 4; i = i + 1) begin
                circle_history[i] <= 4'b0;
                cross_history[i] <= 4'b0;
            end
        end 
        
        else begin
            // player's input is valid
                if (mark == 2'b01) begin
                    // player A places a circle
                    game_grid[position] <= 2'b01;
                    
                    circle_history[circle_rear] <= position;   // upadte history queue
                    circle_rear <= circle_rear + 1;
                    circle_count <= circle_count + 1;

                    // disappearing crosses
                    if (circle_count >= 3 && cross_count >= 3) begin
                        game_grid[cross_history[cross_front]] <= 2'b00;
                        cross_front <= cross_front + 1;
                        cross_count <= cross_count - 1;
                    end
                end

                // player B places a cross
                else if (mark == 2'b10) begin
                    game_grid[position] <= 2'b10;
                   
                    cross_history[cross_rear] <= position;  
                    cross_rear <= cross_rear + 1;
                    cross_count <= cross_count + 1;

                    // disappearing circle
                    if (cross_count >= 3 && circle_count >= 3) begin
                        game_grid[circle_history[circle_front]] <= 2'b00;
                        circle_front <= circle_front + 1;
                        circle_count <= circle_count - 1;
                    end
                end

                // valid input 
                if (mark != 2'b00) begin
                    y0 <= game_grid[0];
                    y1 <= game_grid[1];
                    y2 <= game_grid[2];
                    y3 <= game_grid[3];
                    y4 <= game_grid[4];
                    y5 <= game_grid[5];
                    y6 <= game_grid[6];
                    y7 <= game_grid[7];
                    y8 <= game_grid[8];
                end
                // invalid input then the grid not change
                else begin 
                    y0 <= x0;
                    y1 <= x1;
                    y2 <= x2;
                    y3 <= x3;
                    y4 <= x4;
                    y5 <= x5;
                    y6 <= x6;
                    y7 <= x7;
                    y8 <= x8;
                end      
        end        
    end

endmodule

module GameIsOver(b0,b1,b2,b3,b4,b5,b6,b7,b8,gameend);
input [1:0] b0,b1,b2,b3,b4,b5,b6,b7,b8;
output gameend;
reg gameend;
always@(*)
begin
    gameend = 1'b0;
    if (
        (b0 == 2'b01 && b3 == 2'b01 && b6 == 2'b01) ||
        (b1 == 2'b01 && b4 == 2'b01 && b7 == 2'b01) ||
        (b2 == 2'b01 && b5 == 2'b01 && b8 == 2'b01) ||
        (b0 == 2'b01 && b1 == 2'b01 && b2 == 2'b01) ||
        (b3 == 2'b01 && b4 == 2'b01 && b5 == 2'b01) ||
        (b6 == 2'b01 && b7 == 2'b01 && b8 == 2'b01) ||
        (b0 == 2'b01 && b4 == 2'b01 && b8 == 2'b01) ||
        (b2 == 2'b01 && b4 == 2'b01 && b6 == 2'b01)
    )
     begin
        gameend = 1'b1;
    end 
    else if (
        (b0 == 2'b10 && b3 == 2'b10 && b6 == 2'b10) || 
        (b1 == 2'b10 && b4 == 2'b10 && b7 == 2'b10) ||
        (b2 == 2'b10 && b5 == 2'b10 && b8 == 2'b10) ||
        (b0 == 2'b10 && b1 == 2'b10 && b2 == 2'b10) ||
        (b3 == 2'b10 && b4 == 2'b10 && b5 == 2'b10) ||
        (b6 == 2'b10 && b7 == 2'b10 && b8 == 2'b10) ||
        (b0 == 2'b10 && b4 == 2'b10 && b8 == 2'b10) ||
        (b2 == 2'b10 && b4 == 2'b10 && b6 == 2'b10)
    ) 
    begin
        gameend = 1'b1;
    end

end
endmodule
