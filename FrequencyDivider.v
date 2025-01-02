
module FrequencyDivider #(parameter TimeExpire=32'd2500) (clock, clock_div);

	input clock;
	output reg clock_div;
	
	reg [31:0] count;
	
	
	always @(posedge clock)
	begin
	
		if (count < TimeExpire - 1)  // count does not reach TimeExpire
		begin
			count <= count + 32'd1;
		end
		
		else  // count reach TimeExpire
		begin
			clock_div <= ~clock_div;  // flip output
			count <= 32'd0;  // reset to 0
		end
		
	end

endmodule
