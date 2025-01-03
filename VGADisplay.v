
module VGADisplay(pixel_clock, reset, a1, a2, a3, a4, a5, a6, a7, a8, a9, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS);
	input pixel_clock;
	input reset;
	input [1:0] a1;	// game grid
	input [1:0] a2;	// game grid
	input [1:0] a3;	// game grid
	input [1:0] a4;	// game grid
	input [1:0] a5;	// game grid
	input [1:0] a6;	// game grid
	input [1:0] a7;	// game grid
	input [1:0] a8;	// game grid
	input [1:0] a9;	// game grid
	output reg [3:0] VGA_R;	// VGA red
	output reg [3:0] VGA_G;	// VGA green
	output reg [3:0] VGA_B;	// VGA blue
	output VGA_HS;				// VGA HSync
	output VGA_VS;				// VGA VSync
	
	
	
	// sync
	wire [9:0] x;
	wire [8:0] y;
	VGADisplay_SyncGenerator HSyncGenerator(pixel_clock, reset, VGA_HS, x);
	VGADisplay_SyncGenerator #(2, 33, 480, 10, 8, 9) VSyncGenerator(~VGA_HS, reset, VGA_VS, y);
	
	
	
	// display
	wire [3:0] R;
   wire [3:0] G;
   wire [3:0] B;
   RGB_get PixelGenerator(x, y, a1, a2, a3, a4, a5, a6, a7, a8, a9, R, G, B);
	always @(posedge pixel_clock or negedge reset) begin
		
		if (~reset) begin
			VGA_R <= 0;
			VGA_G <= 0;
			VGA_B <= 0;
		end
		else begin
			
			if ((x == ~10'b0) || (y == ~9'b0)) begin
				VGA_R <= 0;
				VGA_G <= 0;
				VGA_B <= 0;
			end
			else begin  // video display
				VGA_R <= R;
				VGA_G <= G;
				VGA_B <= B;
			end  // (x_active == 0) || (y_active == 0)
			
		end  // ~reset
		
	end  // always
	
endmodule
