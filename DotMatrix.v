module DotMatrix(
    input wire clk_10000Hz,        // 10000Hz 
    input wire clk_2Hz, //2Hz
    
    input reset,              
    input whosTurn,           // 0: O / 1: X
    input [1:0] gameend,      // 00: not end / 01: O win / 10: X win
    
    output reg [7:0] dot_row, // 共用的row訊號輸出
    output reg [7:0] dot_col_left, // 左邊8x8的column訊號輸出
    output reg [7:0] dot_col_right // 右邊8x8的column訊號輸出
);

    reg [2:0] current_row;    // 目前顯示的row索引（3位元，範圍0~7）
    reg toggle;               // 用於切換顯示模式的暫存器
	 
	 
	 // 切換顯示模式的邏輯
    always @(posedge clk_2Hz or negedge reset) begin
        if (~reset) begin
            toggle <= 1'b0;
        end 
		  else begin
            toggle <= ~toggle; // 每個clk_2Hz週期切換一次
        end
    end
	 
    // 點矩陣顯示邏輯
    always @(posedge clk_10000Hz or negedge reset) begin
        if (~reset) begin
            current_row <= 3'd0;
        end else begin
            current_row <= current_row + 3'd1;

            // 共用的 row 訊號
            case (current_row)
                3'd0: dot_row <= 8'b01111111;
                3'd1: dot_row <= 8'b10111111;
                3'd2: dot_row <= 8'b11011111;
                3'd3: dot_row <= 8'b11101111;
                3'd4: dot_row <= 8'b11110111;
                3'd5: dot_row <= 8'b11111011;
                3'd6: dot_row <= 8'b11111101;
                3'd7: dot_row <= 8'b11111110;
            endcase

            // 根據狀態選擇左右顯示的圖案
            case (gameend)
                2'b00: 
					 begin // 比賽未結束
                    if (whosTurn == 0) begin // O 的回合
                        case (current_row)
                            3'd0: begin dot_col_left <= 8'b00111100; dot_col_right <= 8'b00111110; end
                            3'd1: begin dot_col_left <= 8'b01000010; dot_col_right <= 8'b00100010; end
                            3'd2: begin dot_col_left <= 8'b10000001; dot_col_right <= 8'b00100010; end
                            3'd3: begin dot_col_left <= 8'b10000001; dot_col_right <= 8'b00100100; end
                            3'd4: begin dot_col_left <= 8'b10000001; dot_col_right <= 8'b00001000; end
                            3'd5: begin dot_col_left <= 8'b10000000; dot_col_right <= 8'b00000000; end
                            3'd6: begin dot_col_left <= 8'b01000010; dot_col_right <= 8'b00011100; end
                            3'd7: begin dot_col_left <= 8'b00111100; dot_col_right <= 8'b00011100; end
                        endcase
                    end 
						  else begin // X 的回合
                        case (current_row)
                            3'd0: begin dot_col_left <= 8'b00111110; dot_col_right <= 8'b10000001; end
                            3'd1: begin dot_col_left <= 8'b00100010; dot_col_right <= 8'b01000010; end
                            3'd2: begin dot_col_left <= 8'b00100010; dot_col_right <= 8'b00100100; end
                            3'd3: begin dot_col_left <= 8'b00100100; dot_col_right <= 8'b00011000; end
                            3'd4: begin dot_col_left <= 8'b00001000; dot_col_right <= 8'b00111100; end
                            3'd5: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b00100100; end
                            3'd6: begin dot_col_left <= 8'b00011100; dot_col_right <= 8'b01000010; end
                            3'd7: begin dot_col_left <= 8'b00011100; dot_col_right <= 8'b10000001; end
                        endcase
                    end
                end
                
					 
		2'b01: 
		begin // O 贏
                    if (toggle) begin // 顯示 O_
                        case (current_row)
                            3'd0: begin dot_col_left <= 8'b00111100; dot_col_right <= 8'b00000000; end
                            3'd1: begin dot_col_left <= 8'b01000010; dot_col_right <= 8'b00000000; end
                            3'd2: begin dot_col_left <= 8'b10000001; dot_col_right <= 8'b00000000; end
                            3'd3: begin dot_col_left <= 8'b10000001; dot_col_right <= 8'b00000000; end
                            3'd4: begin dot_col_left <= 8'b10000001; dot_col_right <= 8'b00000000; end
                            3'd5: begin dot_col_left <= 8'b10000001; dot_col_right <= 8'b00000000; end
                            3'd6: begin dot_col_left <= 8'b01000010; dot_col_right <= 8'b00000000; end
                            3'd7: begin dot_col_left <= 8'b00111100; dot_col_right <= 8'b00000000; end
                        endcase
                    end 
		    else begin // 顯示 WIN
                        case (current_row)
                            3'd0: begin dot_col_left <= 8'b10001011; dot_col_right <= 8'b11010001; end
                            3'd1: begin dot_col_left <= 8'b10001011; dot_col_right <= 8'b11011001; end
                            3'd2: begin dot_col_left <= 8'b10101001; dot_col_right <= 8'b10010001; end
                            3'd3: begin dot_col_left <= 8'b10101001; dot_col_right <= 8'b10010101; end
                            3'd4: begin dot_col_left <= 8'b10101001; dot_col_right <= 8'b10010001; end
                            3'd5: begin dot_col_left <= 8'b10101001; dot_col_right <= 8'b10010011; end
                            3'd6: begin dot_col_left <= 8'b10101011; dot_col_right <= 8'b11010001; end
                            3'd7: begin dot_col_left <= 8'b01010011; dot_col_right <= 8'b11010001; end
                        endcase
                    end
                end
					 
					 
					 
                2'b10: 
		begin // X 贏
                    if (toggle) begin // 顯示 _X
                        case (current_row)
                            3'd0: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b10000001; end
                            3'd1: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b01000010; end
                            3'd2: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b00100100; end
                            3'd3: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b00011000; end
                            3'd4: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b00011000; end
                            3'd5: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b00100100; end
                            3'd6: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b01000010; end
                            3'd7: begin dot_col_left <= 8'b00000000; dot_col_right <= 8'b10000001; end
                        endcase
                    end 
		    else begin // 顯示 WIN
                        case (current_row)
                            3'd0: begin dot_col_left <= 8'b10001011; dot_col_right <= 8'b11010001; end
                            3'd1: begin dot_col_left <= 8'b10001011; dot_col_right <= 8'b11011001; end
                            3'd2: begin dot_col_left <= 8'b10101001; dot_col_right <= 8'b10010001; end
                            3'd3: begin dot_col_left <= 8'b10101001; dot_col_right <= 8'b10010101; end
                            3'd4: begin dot_col_left <= 8'b10101001; dot_col_right <= 8'b10010001; end
                            3'd5: begin dot_col_left <= 8'b10101001; dot_col_right <= 8'b10010011; end
                            3'd6: begin dot_col_left <= 8'b10101011; dot_col_right <= 8'b11010001; end
                            3'd7: begin dot_col_left <= 8'b01010011; dot_col_right <= 8'b11010001; end
                        endcase
                    end
                end
					 
					 
                default: begin
                    dot_col_left <= 8'b00000000;
                    dot_col_right <= 8'b00000000;
                end
					 
					 
            endcase
        end
    end
endmodule
