
module Tic_Tae_Toe(
	clock, reset, start_game, 
	keypadCol, keypadRow, 
	dot_row, dot_col_right, dot_col_left, 
	seven1, seven0, 
	VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS
);
	
	input clock;						// MAX10_CLK1_50
	input reset;						// KEY0
	input start_game;						// KEY1
	
	input  [3:0] keypadCol;			// keypad col 
	output [3:0] keypadRow;			// keypad row
	
	output [7:0] dot_row;			// DotMatrix row
	output [7:0] dot_col_right;	// DotMatrix col 0
	output [7:0] dot_col_left;		// DotMatrix col 1
	
	output [7:0] seven1;				// HEX17 ~ HEX10
	output [7:0] seven0;				// HEX07 ~ HEX00
	
	output [3:0] VGA_R;				// VGA red
	output [3:0] VGA_G;				// VGA green
	output [3:0] VGA_B;				// VGA blue
	output VGA_HS;						// VGA HSync
	output VGA_VS;						// VGA VSync
	
	// game grid
	wire [1:0] a1;
	wire [1:0] a2;
	wire [1:0] a3;
	wire [1:0] a4;
	wire [1:0] a5;
	wire [1:0] a6;
	wire [1:0] a7;
	wire [1:0] a8;
	wire [1:0] a9;
	
	// game state
	reg start;  // game is start?
	wire [1:0] game_end;
	wire [3:0] time_left_ten;
	wire [3:0] time_left_one;
	wire turn;
	
	// control signal
	wire [3:0] keypad_buffer;
	
	
	
	// clock generate
	wire pixel_clock;
	wire keypad_clock;
	wire dotmatrix_clock;
	wire dm_switch_clock;
	FrequencyDivider #(.TimeExpire(32'd1))				PixelClockFD (clock, pixel_clock);  			// 25MHz
	FrequencyDivider #(.TimeExpire(32'd25_0000))		KeyPadClockFD (clock, keypad_clock);  			// 100Hz
	FrequencyDivider #(.TimeExpire(32'd2500))			DotMatrixClockFD (clock, dotmatrix_clock);  	// 10000Hz
	FrequencyDivider #(.TimeExpire(32'd1250_0000))	DMSwitchClockFD (clock, dm_switch_clock);  	// 2Hz
	
	
	// system
	System system (
		reset, keypad_buffer, keypad_clock, 
		a1, a2, a3, a4, a5, a6, a7, a8, a9, 
		game_end, 
		time_left_ten, time_left_one, 
		turn, 
		start
	);
	
	
	// control
	KeyPad KeyPadControl (
		keypad_clock, start, reset, 
		keypadCol, keypadRow, 
		keypad_buffer
	);
	
	
	// display
	SevenDisplay DigitDisplay (
		time_left_ten, time_left_one, 
		seven1, seven0
	);
	DotMatrix DotMatrixDisplay (
		dotmatrix_clock, dm_switch_clock, start, reset, 
		turn, game_end, 
		dot_row, dot_col_left, dot_col_right
	);
	VGADisplay ScreenDisplay (
		pixel_clock, reset, start, 
		a1, a2, a3, a4, a5, a6, a7, a8, a9, 
		VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS
	);
	
	
	// start game control
	always @(posedge keypad_clock or negedge reset) begin
		if (~reset) begin
			start <= 0;
		end
		else begin
			if (~start_game) begin
				start <= 1;
			end
		end
	end

endmodule
