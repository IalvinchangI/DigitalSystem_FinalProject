
module VGADisplay_SyncGenerator #(  // default: HSync
		parameter SYNC_PULSE = 96, 		// the length of sync pulse
		parameter BACK_PORCH = 60, 		// the length of back porch
		parameter ACTIVE_REGION = 640, 	// the length of active video region
		parameter FRONT_PORCH = 4, 		// the length of front porch
		parameter POS_SIZE = 9, 			// the bit count of pos
		parameter COUNT_SIZE = 9 			// the bit count of count
	)
	(pixel_clock, reset, VGA_S, pos);
	
	parameter LINE_LENGTH = SYNC_PULSE + BACK_PORCH + ACTIVE_REGION + FRONT_PORCH;
	
	input pixel_clock;  // 
	input reset;        // reset all the value
	output reg VGA_S;       // the value of VGA_S
	output reg [POS_SIZE:0] pos;     // the position in active video region if in active video region else ~0
	
	reg [COUNT_SIZE:0] count;
	
	
	
	always @(posedge pixel_clock or negedge reset) begin
		
		if (~reset) begin  // reset when reset == 0
			count <= 0;
			pos <= ~0;  // -1
			VGA_S <= 0;
		end
		else begin  // count
			
			if (count < SYNC_PULSE - 1) begin  // sync pulse
				VGA_S <= 0;
			end
			else if (count < SYNC_PULSE + BACK_PORCH - 1) begin  // back porch
				VGA_S <= 1;
			end
			else if (count < SYNC_PULSE + BACK_PORCH + ACTIVE_REGION - 1) begin  // active video
				pos <= pos + 1;
			end
			else begin  // front porch  // reset active, pos
				pos <= ~0;  // -1
			end
			
			// update count
			if (count == LINE_LENGTH - 1) begin
				count <= 0;
			end
			else begin
				count <= count + 1;
			end
			
		end  // ~reset
		
	end  // always
	
endmodule
