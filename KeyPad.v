module KeyPad (
    input wire clk_100Hz,         // 100Hz
    input wire start,
    input wire reset,             // 重置訊號
    input wire [3:0] keypadCol,   // Keypad 的列輸入訊號
    output reg [3:0] keypadRow,   // Keypad 的行輸出訊號
    output reg [3:0] keyValue     // 鍵值輸出
);
    reg [1:0] rowSelect;

    // 掃描行邏輯
	always @(posedge clk_100Hz or negedge reset) begin
	    if (~reset) begin
            rowSelect <= 2'b00;
            keypadRow <= 4'b1110; // 初始狀態：選擇第一行
				end 
		  else 
		  begin
            // 行掃描，輪流選擇每一行
            rowSelect <= rowSelect + 1;
            case (rowSelect)
                2'b00: keypadRow <= 4'b1110; // 第一行
                2'b01: keypadRow <= 4'b1101; // 第二行
                2'b10: keypadRow <= 4'b1011; // 第三行
                2'b11: keypadRow <= 4'b0111; // 第四行
            endcase
        end
    end

    // 按鍵值解碼邏輯
	always @(posedge clk_100Hz or negedge reset) begin
	if (~reset)
            keyValue <= 4'd9; // initial KeyValue
	else if (start==0) 
            keyValue <= 4'd9
	else
	begin
            case ({keypadRow, keypadCol})
               // 第一行
                8'b0111_0111: keyValue <= 4'd0; // 按鍵 0(F)
                8'b0111_1011: keyValue <= 4'd1; // 按鍵 1(E)
                8'b0111_1101: keyValue <= 4'd2; // 按鍵 2(D)
                
                // 第二行
                8'b1011_0111: keyValue <= 4'd3; // 按鍵 3(B)
                8'b1011_1011: keyValue <= 4'd4; // 按鍵 4(3)
                8'b1011_1101: keyValue <= 4'd5; // 按鍵 5(6)
                
                // 第三行
                8'b1101_0111: keyValue <= 4'd6; // 按鍵 6(A)
                8'b1101_1011: keyValue <= 4'd7; // 按鍵 7(2)
                8'b1101_1101: keyValue <= 4'd8; // 按鍵 8(5)

                default: keyValue <= 4'd9; // 預設
            endcase
        end
    end
endmodule
