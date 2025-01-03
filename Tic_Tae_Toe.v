
module Tic_Tae_Toe(
	clock, reset, 
	keypadCol, keypadRow, 
	dot_row, dot_col, 
	seven1, seven0, 
	VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS
);
	
	input clock;				// MAX10_CLK1_50
	input reset;				// KEY0
	
	input [3:0] keypadCol;	// keypad col
	output [3:0] keypadRow;	// keypad row
	
	output [7:0] dot_row;	// DotMatrix row
	output [7:0] dot_col;	// DotMatrix col
	
	output [7:0] seven1;		// HEX17 ~ HEX10
	output [6:0] seven0;		// HEX06 ~ HEX00
	
	output [3:0] VGA_R;		// VGA red
	output [3:0] VGA_G;		// VGA green
	output [3:0] VGA_B;		// VGA blue
	output VGA_HS;				// VGA HSync
	output VGA_VS;				// VGA VSync
	
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
	
	
	// clock generate
	wire pixel_clock;
	FrequencyDivider #(.TimeExpire(32'd1)) PixelClockFD (clock, pixel_clock);
	
	
	// display
	VGADisplay ScreenDisplay(
		pixel_clock, reset, 
		a1, a2, a3, a4, a5, a6, a7, a8, a9, 
		VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS
	);

endmodule
