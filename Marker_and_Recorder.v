
// record the moves for this run and the history (previous 4 at most)
module Marker_and_Recorder( 
    input wire clk,
    input wire reset,
    input wire game_state, 
    input wire player_a_move, 
    input wire player_b_move, 
    input wire [3:0] pos,                // choice of position for this run on grid (0-8)
    output reg [17:0] game_grid          //  circle and cross positions, 0-7 for A:circle O , 8-17 for B:cross X
);

    reg [3:0] circle_count; 
    reg [3:0] cross_count;  

    reg [3:0] circle_history; 
    reg [3:0] cross_history; 

    always @(posedge clk or negedge reset) begin

        if (~reset) begin
            game_grid <= 18'b0;
            circle_count <= 4'b0;
            cross_count <= 4'b0;
            circle_history <= 4'b0;
            cross_history <= 4'b0;
        end 
        
        else begin
            if (player_a_move && !game_grid[pos] && !game_grid[pos + 9]) begin
                // player A places a circle
                game_grid[pos] <= 1'b1;
                circle_history <= {pos, circle_history[2:1]};         // shift right and add new
                circle_count <= circle_count + 1;

                // disappearing crosses
                if (circle_count >= 3 && cross_count >= 3) begin
                    game_grid[{1'b0, cross_history[(circle_count - 3) % 4]} + 9] <= 1'b0;
                end
            end

            if (player_b_move && !game_grid[pos] && !game_grid[pos + 9]) begin
                // player B places a cross
                game_grid[pos + 9] <= 1'b1;
                cross_history <= {pos, cross_history[2:1]}; 
                cross_count <= cross_count + 1;

                // disappearing circle
                if (cross_count >= 3 && circle_count >= 3) begin
                    game_grid[{1'b0, circle_history[(cross_count - 3) % 4]}] <= 1'b0;
                end
            end
        end
    end

endmodule