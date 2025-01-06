
// record the moves for this run and the history (previous 4 at most)
module Marker_and_Recorder( 
    input clk,
    input rst,
    input game_state, 
    input [1:0] mark,                    // mark for 01:O, 10:X, 00:invalid
    input [3:0] position,                // choice of position for this run on grid (0-8)
                                         // 01:O     10:X    00:empty
    input [1:0] x0, x1, x2, x3, x4, x5, x6, x7, x8,
    output [1:0] y0, y1, y2, y3, y4, y5, y6, y7, y8              
);  

    reg [1:0] game_grid_reg [0:8];

    // q outputs
    wire [3:0] dequeue_out;
    wire q_full, q_empty, q_size;


    // q for circle and cross history
    Queue #(.SIZE(6), .WIDTH(4)) circle_queue (
        .clk(clk),
        .rst(rst),
        .enqueue(mark != 2'b00),         // enqueue when the input is valid
        .dequeue(q_full),                // dequeue when q is full or size???? concurrentce happend
        .data_in(position),
        .data_out(dequeue_out),
        .full(q_full),
        .empty(q_empty),
        .size(q_size)
    );


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
            game_grid_reg[0] <= 2'b00; game_grid_reg[1] <= 2'b00; game_grid_reg[2] <= 2'b00; 
            game_grid_reg[3] <= 2'b00; game_grid_reg[4] <= 2'b00; game_grid_reg[5] <= 2'b00; 
            game_grid_reg[6] <= 2'b00; game_grid_reg[7] <= 2'b00; game_grid_reg[8] <= 2'b00;
        end 
        else begin
            game_grid_reg[0] <= x0; game_grid_reg[1] <= x1; game_grid_reg[2] <= x2; 
            game_grid_reg[3] <= x3; game_grid_reg[4] <= x4; game_grid_reg[5] <= x5; 
            game_grid_reg[6] <= x6; game_grid_reg[7] <= x7; game_grid_reg[8] <= x8;

            // input is valid
            if (mark != 2'b00) begin
                game_grid_reg[position] <= mark;

                if (q_size == 5) begin
                    game_grid_reg[dequeue_out] <= 2'b00;  // clear oldest position
                end
            end
        end   
    end
endmodule


module Queue #(parameter SIZE = 6, WIDTH = 4) (
    input clk,
    input rst,
    input enqueue,                       // signal to enqueue 
    input dequeue,                       // signal to dequeue 
    input [WIDTH-1:0] data_in,           // data to enqueue
    output reg [WIDTH-1:0] data_out,     // data to dequeue
    output reg full,                     // full flag
    output reg empty,                    // empty flag
    output reg size
);
    reg [WIDTH-1:0] queue_mem [0:SIZE-1];
    reg [$clog2(SIZE):0] front, rear;  // pointers and count

    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            front <= 0;
            rear <= 0;
            size <= 0;
            full <= 0;
            empty <= 1;

        end else begin

            if (enqueue && !full) begin
                queue_mem[rear] <= data_in;
                rear <= (rear + 1) % SIZE;
                size <= size + 1;
            end

            if (dequeue && !empty) begin
                data_out <= queue_mem[front];
                front <= (front + 1) % SIZE;
                size <= size - 1;
            end

            // update status flags
            full <= (size == SIZE);
            empty <= (size == 0);
        end
    end
endmodule
