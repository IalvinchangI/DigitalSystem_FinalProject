
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

	// gameend
	module GameIsOver(b0,b1,b2,b3,b4,b5,b6,b7,b8,gameend)
		input [1:0] b0,b1,b2,b3,b4,b5,b6,b7,b8;
		output gameend;
	reg gameend;
	always@(*)
	begin
   		gameend = 1'b0;
    		if (
        	(b0 == 2'b01 && b3 == 2'b01 && b6 == 2'b01) ||
       		(b1 == 2'b01 && b4 == 2'b01 && b7 == 2'b01) ||
        	(b2 == 2'b01 && b5 == 2'b01 && b8 == 2'b01) ||
        	(b0 == 2'b01 && b1 == 2'b01 && b2 == 2'b01) ||
        	(b3 == 2'b01 && b4 == 2'b01 && b5 == 2'b01) ||
        	(b6 == 2'b01 && b7 == 2'b01 && b8 == 2'b01) ||
        	(b0 == 2'b01 && b4 == 2'b01 && b8 == 2'b01) ||
        	(b2 == 2'b01 && b4 == 2'b01 && b6 == 2'b01)
    		)
     		begin
        		gameend = 1'b1;
    		end 
    		else if (
        	(b0 == 2'b10 && b3 == 2'b10 && b6 == 2'b10) || 
        	(b1 == 2'b10 && b4 == 2'b10 && b7 == 2'b10) ||
        	(b2 == 2'b10 && b5 == 2'b10 && b8 == 2'b10) ||
        	(b0 == 2'b10 && b1 == 2'b10 && b2 == 2'b10) ||
        	(b3 == 2'b10 && b4 == 2'b10 && b5 == 2'b10) ||
        	(b6 == 2'b10 && b7 == 2'b10 && b8 == 2'b10) ||
       		(b0 == 2'b10 && b4 == 2'b10 && b8 == 2'b10) ||
        	(b2 == 2'b10 && b4 == 2'b10 && b6 == 2'b10)
    		) 
    		begin
        		gameend = 1'b1;
    		end
	end
	endmodule
	
endmodule
