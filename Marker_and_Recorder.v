
// record the moves for this run and the history (previous 4 at most)
module Marker_and_Recorder( 
    input clk,
    input rst,
    input [1:0] game_state, 
    input whosTurn,                      // 1:X,  0:O
    input [1:0] mark,                    // mark for 10:X, 01:O, 00:default
    input [3:0] position,                // choice of position for this run on grid (0-8)
                                         // 01:O     10:X    00:empty
    input [1:0] x0, x1, x2, x3, x4, x5, x6, x7, x8,
    output [1:0] y0, y1, y2, y3, y4, y5, y6, y7, y8              
);  

    reg [1:0] game_grid_reg [0:8];

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

    assign y0 = game_grid_reg[0];
    assign y1 = game_grid_reg[1];
    assign y2 = game_grid_reg[2];
    assign y3 = game_grid_reg[3];
    assign y4 = game_grid_reg[4];
    assign y5 = game_grid_reg[5];
    assign y6 = game_grid_reg[6];
    assign y7 = game_grid_reg[7];
    assign y8 = game_grid_reg[8];


    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            circle_count <= 2'b00;
            cross_count <= 2'b00;
            circle_front <= 2'b00;
            cross_front <= 2'b00;
            circle_rear <= 2'b00;
            cross_rear <= 2'b00;

            // initialize grid
            for (i = 0; i < 9; i = i + 1) begin
                game_grid_reg[i] <= 2'b00;
            end

            // initialize history queue
            for (i = 0; i < 4; i = i + 1) begin
                circle_history[i] <= 4'b0;
                cross_history[i] <= 4'b0;
            end
        end 
        
        else begin
            // player's input is valid
            game_grid_reg[0] <= x0;
            game_grid_reg[1] <= x1;
            game_grid_reg[2] <= x2;
            game_grid_reg[3] <= x3;
            game_grid_reg[4] <= x4;
            game_grid_reg[5] <= x5;
            game_grid_reg[6] <= x6;
            game_grid_reg[7] <= x7;
            game_grid_reg[8] <= x8;

                if (mark == 2'b01) begin
                    // player A places a circle
                    game_grid_reg[position] <= 2'b01;
                    
                    circle_history[circle_rear] <= position;   // upadte history queue
                    circle_rear <= circle_rear + 1;
                    circle_count <= circle_count + 1;

                    // disappearing crosses
                    if (cross_count >= 3) begin
                        game_grid_reg[cross_history[cross_front]] <= 2'b00;
                        cross_front <= cross_front + 1;
                        cross_count <= cross_count - 1;
                    end
                end

                // player B places a cross
                else if (mark == 2'b10) begin
                    game_grid_reg[position] <= 2'b10;
                   
                    cross_history[cross_rear] <= position;  
                    cross_rear <= cross_rear + 1;
                    cross_count <= cross_count + 1;

                    // disappearing circle
                    if (circle_count >= 3) begin
                        game_grid_reg[circle_history[circle_front]] <= 2'b00;
                        circle_front <= circle_front + 1;
                        circle_count <= circle_count - 1;
                    end
                end 
        end        
    end

endmodule
