
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
	
	output [6:0] seven1;		// HEX16 ~ HEX10
	output [6:0] seven0;		// HEX06 ~ HEX00
	
	output [3:0] VGA_R;		// VGA red
	output [3:0] VGA_G;		// VGA green
	output [3:0] VGA_B;		// VGA blue
	output VGA_HS;				// VGA HSync
	output VGA_VS;				// VGA VSync

endmodule
