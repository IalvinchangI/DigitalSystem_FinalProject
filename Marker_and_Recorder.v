
// record the moves for this run and the history (previous 4 at most)
module Marker_and_Recorder( 
    input clk,
    input rst,
    input game_state, 
    input whosTurn,                      // 1:X,  0:O
    input [1:0] mark,                    // mark for 10:X, 01:O, 00:default
    input [3:0] position,                // choice of position for this run on grid (0-8)
                                         // 01:O     10:X    00:empty
    input [1:0] x0, x1, x2, x3, x4, x5, x6, x7, x8,
    output [1:0] y0, y1, y2, y3, y4, y5, y6, y7, y8              
);  

    reg [1:0] game_grid [0:8];

    // q outputs
    wire [3:0] circle_dequeue_out, cross_dequeue_out;
    wire circle_full, circle_empty, circle_count;
    wire cross_full, cross_empty, cross_count;

    // q for circle and cross history
    Queue #(.SIZE(4), .WIDTH(4)) circle_queue (
        .clk(clk),
        .rst(rst),
        .enqueue(mark == 2'b01),         // enqueue when player O makes a move
        .dequeue(!circle_empty && (mark == 2'b10) && (circle_count >= 3)), // dequeue when X makes a move and O >= 3
        .data_in(position),
        .data_out(circle_dequeue_out),
        .full(circle_full),
        .empty(circle_empty)
    );

    Queue #(.SIZE(4), .WIDTH(4)) cross_queue (
        .clk(clk),
        .rst(rst),
        .enqueue(mark == 2'b10),         // enqueue when player X makes a move
        .dequeue(!cross_empty && (mark == 2'b01) && (cross_count >= 3)), // dequeue when O makes a move and X >= 3
        .data_in(position),
        .data_out(cross_dequeue_out),
        .full(cross_full),
        .empty(cross_empty)
    );

    assign {y0, y1, y2, y3, y4, y5, y6, y7, y8} = game_grid_reg;

    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            game_grid_reg[0] <= 2'b00;
            game_grid_reg[1] <= 2'b00;
            game_grid_reg[2] <= 2'b00;
            game_grid_reg[3] <= 2'b00;
            game_grid_reg[4] <= 2'b00;
            game_grid_reg[5] <= 2'b00;
            game_grid_reg[6] <= 2'b00;
            game_grid_reg[7] <= 2'b00;
            game_grid_reg[8] <= 2'b00;
        end 
        else begin
            game_grid[0] <= x0;
            game_grid[1] <= x1;
            game_grid[2] <= x2;
            game_grid[3] <= x3;
            game_grid[4] <= x4;
            game_grid[5] <= x5;
            game_grid[6] <= x6;
            game_grid[7] <= x7;
            game_grid[8] <= x8;

            if (mark == 2'b01) begin
                game_grid_reg[position] <= 2'b01;               // update grid for O
                if (!cross_empty) begin
                    game_grid_reg[cross_dequeue_out] <= 2'b00;  // remove oldest X
                end
            end else if (mark == 2'b10) begin
                game_grid_reg[position] <= 2'b10;              // update grid for X
                if (!circle_empty) begin
                    game_grid_reg[circle_dequeue_out] <= 2'b00; // remove oldest O
                end
            end
        end   
    end
endmodule


module Queue #(parameter SIZE = 4, WIDTH = 4) (
    input clk,
    input rst,
    input enqueue,                       // signal to enqueue 
    input dequeue,                       // signal to dequeue 
    input [WIDTH-1:0] data_in,           // data to enqueue
    output reg [WIDTH-1:0] data_out,     // data to dequeue
    output reg full,                     // full flag
    output reg empty,                    // empty flag
    output reg count
);
    reg [WIDTH-1:0] queue_mem [0:SIZE-1];
    reg [$clog2(SIZE):0] front, rear, count;  // pointers and count

    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            front <= 0;
            rear <= 0;
            count <= 0;
            full <= 0;
            empty <= 1;

        end else begin

            if (enqueue && !full) begin
                queue_mem[rear] <= data_in;
                rear <= (rear + 1) % SIZE;
                count <= count + 1;
            end

            if (dequeue && !empty) begin
                data_out <= queue_mem[front];
                front <= (front + 1) % SIZE;
                count <= count - 1;
            end

            // update status flags
            full <= (count == SIZE);
            empty <= (count == 0);
        end
    end
endmodule
