module CurrentInput(
    clk, rst, keyPadBuf,
    a0, a1, a2, a3, a4, a5, a6, a7, a8,
    location, whosTurn, mark, timeLeft1, timeLeft2, gameend, start
);
    input rst, clk; // 100Hz clock
    input [3:0] keyPadBuf;
    input [1:0] a0, a1, a2, a3, a4, a5, a6, a7, a8; // The matrix after elimination
    input [1:0] gameend;
    input start;

    output reg [3:0] location;//0~8
    output reg [1:0] mark;//10:X, 01:O, 00:default
    output reg whosTurn; // 1: X, 0: O
    output reg [3:0] timeLeft1, timeLeft2; //1 for ten digits, 2 for single digit

    reg [10:0] timeCounter;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            timeCounter <= 10'd800;
            whosTurn <= 0;
            mark <= 2'b00;
            location <= 4'd9;
        end else begin
            if(gameend!=0 || start==0);
            else if (timeCounter == 0) begin
                whosTurn <= ~whosTurn;
                timeCounter <= 10'd0;
            end else begin
                timeCounter <= timeCounter - 1;
            end

            timeLeft1 <= timeCounter/100;
            timeLeft2 <= (timeCounter/10)%10;
            if(gameend == 0) begin
            if(timeCounter != 0) begin
            case (keyPadBuf)
                4'd0: begin
                    if (a0 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd0;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
                4'd1: begin
                    if (a1 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd1;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
                4'd2: begin
                    if (a2 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd2;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
                4'd3: begin
                    if (a3 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd3;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
                4'd4: begin
                    if (a4 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd4;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
                4'd5: begin
                    if (a5 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd5;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
                4'd6: begin
                    if (a6 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd6;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
                4'd7: begin
                    if (a7 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd7;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
                4'd8: begin
                    if (a8 == 2'b00) begin
                        mark <= (whosTurn) ? 2'b01 : 2'b10;
                        whosTurn <= ~whosTurn;
                        location <= 4'd8;
                        timeCounter <= 10'd800;
                    end else mark <= 2'b00;
                end
            endcase
            end
            end
        end
    end
endmodule
