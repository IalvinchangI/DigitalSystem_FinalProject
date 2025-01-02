
module VGADisplay(pixel_clock, reset, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS);
	input pixel_clock;
	input reset;
	// TODO input matrix
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
				
				if (x >= 80 && x < 240 && y >= 100 && y < 116) begin
					VGA_R <= 4'he;
					VGA_G <= 4'hc;
					VGA_B <= 4'h5;
				end
				else if (x >= 400 && x < 560 && y >= 100 && y < 116) begin
					VGA_R <= 4'he;
					VGA_G <= 4'hc;
					VGA_B <= 4'h5;
				end
				else if (x >= 240 && x < 400 && y >= 220 && y < 236) begin
					VGA_R <= 4'he;
					VGA_G <= 4'hc;
					VGA_B <= 4'h5;
				end
				else if (x >= 0 && x < 1) begin
					VGA_R <= 4'he;
					VGA_G <= 4'hc;
					VGA_B <= 4'h5;
				end
				else if (x >= 638 && x < 640) begin
					VGA_R <= 4'he;
					VGA_G <= 4'hc;
					VGA_B <= 4'h5;
				end
				else if (y >= 0 && y < 1) begin
					VGA_R <= 4'he;
					VGA_G <= 4'hc;
					VGA_B <= 4'h5;
				end
				else if (y >= 478 && y < 480) begin
					VGA_R <= 4'he;
					VGA_G <= 4'hc;
					VGA_B <= 4'h5;
				end
				else begin
					VGA_R <= 4'hf;
					VGA_G <= 4'hf;
					VGA_B <= 4'hf;
				end
				
			end  // (x_active == 0) || (y_active == 0)
			
		end  // ~reset
		
	end  // always
	
endmodule
