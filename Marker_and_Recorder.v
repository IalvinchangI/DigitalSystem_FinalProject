
// record the moves for this run and the history (previous 4 at most)
module Marker_and_Recorder( 
    input wire clk,
    input wire reset,
    input wire game_state, 
    input wire player_a_move, 
    input wire player_b_move, 
    input wire [3:0] pos,                // choice of position for this run on grid (0-8)
    output reg [17:0] game_grid          //  circle and cross positions, 0-7 for A:circle O , 8-17 for B:cross X
                                         //  O:     X:     empty: 
);

    reg [1:0] circle_count;              // 0,1,2,3,0,1,2,3...
    reg [1:0] cross_count;  

    integer i;                           // for looping

    reg [2:0] circle_history [3:0]; 
    reg [2:0] cross_history [3:0]; 

    always @(posedge clk or negedge reset) begin

        if (~reset) begin
            game_grid <= 18'b0;
            circle_count <= 2'b0;
            cross_count <= 2'b0;

            for (i = 0; i < 4; i = i + 1) begin
                circle_history[i] <= 3'b0;
                cross_history[i] <= 3'b0;
            end
        end 
        
        else begin
            // player A places a circle
            if (player_a_move && !game_grid[pos] && !game_grid[pos + 9]) begin
                game_grid[pos] <= 1'b1;

                circle_history[3] <= pos;      // Right Shift history 
                for (i = 2; i >= 0; i = i - 1) begin
                    circle_history[i] <= circle_history[i + 1];  
                end
                circle_count <= circle_count + 1;
                
                // disappearing crosses
                if (circle_count >= 3 && cross_count >= 3) begin
                    game_grid[cross_history[circle_count - 3] + 9] <= 1'b0;
                end
            end

            // player B places a cross
            if (player_b_move && !game_grid[pos] && !game_grid[pos + 9]) begin
                game_grid[pos + 9] <= 1'b1;

                cross_history[3] <= pos;   
                for (i = 2; i >= 0; i = i - 1) begin
                    cross_history[i] <= cross_history[i + 1];  
                end 
                cross_count <= cross_count + 1;

                // disappearing circle
                if (cross_count >= 3 && circle_count >= 3) begin
                    game_grid[circle_history[cross_count - 3]] <= 1'b0;
                end
            end
        end
    end

endmodule
