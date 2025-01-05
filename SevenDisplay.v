module SevenDisplay(
    input [3:0] timeLeftTen,    // 十位數
    input [3:0] timeLeftOne,    // 個位數
    
	 output [7:0] HEX1,          // 七段顯示器1輸出 (十位)
    output [7:0] HEX0           // 七段顯示器0輸出 (個位)
);
    // 七段顯示邏輯
    reg [6:0] segTen; // 十位數七段顯示
    reg [6:0] segOne; // 個位數七段顯示
    reg dpTen;        // 十位數小數點
    reg dpOne;        // 個位數小數點

    always @(timeLeftTen or timeLeftOne) begin
        // 十位數
        case (timeLeftTen)
            4'd0: segTen = 7'b1000000;
            4'd1: segTen = 7'b1111001;
            4'd2: segTen = 7'b0100100;
            4'd3: segTen = 7'b0110000;
            4'd4: segTen = 7'b0011001;
            4'd5: segTen = 7'b0010010;
            4'd6: segTen = 7'b0000010;
            4'd7: segTen = 7'b1111000;
            4'd8: segTen = 7'b0000000;
            4'd9: segTen = 7'b0010000;
            default: segTen = 7'b1111111; // 全滅
        endcase
        dpTen = 1'b1; // 十位數不顯示小數點

        // 個位數
        case (timeLeftOne)
            4'd0: segOne = 7'b1000000;
            4'd1: segOne = 7'b1111001;
            4'd2: segOne = 7'b0100100;
            4'd3: segOne = 7'b0110000;
            4'd4: segOne = 7'b0011001;
            4'd5: segOne = 7'b0010010;
            4'd6: segOne = 7'b0000010;
            4'd7: segOne = 7'b1111000;
            4'd8: segOne = 7'b0000000;
            4'd9: segOne = 7'b0010000;
            default: segOne = 7'b1111111; // 全滅
        endcase
        dpOne = 1'b0; // 個位數顯示小數點
    end

    // 將數字與小數點組合到輸出
    assign HEX1 = {~dpTen, segTen}; // 十位數輸出 (小數點 + 七段顯示)
    assign HEX0 = {~dpOne, segOne}; // 個位數輸出 (小數點 + 七段顯示)

endmodule

