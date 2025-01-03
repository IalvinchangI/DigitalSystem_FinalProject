module RGB_get(x, y, a1, a2, a3, a4, a5, a6, a7, a8, a9, r, g, b);
	input [9:0] x;
	input [8:0] y;
	input [1:0] a1;
	input [1:0] a2;
	input [1:0] a3;
	input [1:0] a4;
	input [1:0] a5;
	input [1:0] a6;
	input [1:0] a7;
	input [1:0] a8;
	input [1:0] a9;

	output reg [3:0] r;
	output reg [3:0] g;
	output reg [3:0] b;
	
	reg result;
	function reg check_O;
		input signed [20:0] x;
		input signed [20:0] y;
		reg signed [20:0] dx;
		reg signed [20:0] dy;
		
		begin 
			dx = 2500 + x * x - 100 * x;
			dy = 2500 + y * y - 100 * y;
			if ((dx + dy >= 1225) && (dx + dy <= 2025))
			begin
				check_O = 1'b1;
			end
			else
			begin
				check_O = 1'b0;
			end
		end
	endfunction

	function reg check_X;
		input signed [20:0] x;
		input signed [20:0] y;
		
		begin 
			if ((x + y > 93) && (x + y < 107) && (x - y < 80) && (x - y > -80))
			begin 
				check_X = 1'b1;
			end
			else if ((x - y > -7) && (x - y < 7) && (x + y > 20) && (x + y < 180))
			begin 
				check_X = 1'b1;
			end
			else 
			begin
				check_X = 1'b0;
			end
		end
	endfunction
	
	always @(*)
	begin
		if ((x > 160) && (y > 80) && (x < 480) && (y < 400))
		begin
			if ((x - 160) <= 100 && (y - 80) <= 100)
			begin
				if (a1 == 2'd2)
				begin
					result = check_X(x-160, y-80);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a1 == 2'd1)
				begin
					result = check_O(x-160, y-80);
					if (result == 1)
					begin
						r = 4'd12;
						g = 4'd2;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else if ((x - 270) <= 100 && (y - 80) <= 100)
			begin
				if (a2 == 2'd2)
				begin
					result = check_X(x-270, y-80);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a2 == 2'd1)
				begin
					result = check_O(x-270, y-80);
					if (result == 1)
					begin
						r = 4'd13;
						g = 4'd5;
						b = 4'd13;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else if ((x - 380) <= 100 && (y - 80) <= 100)
			begin
				if (a3 == 2'd2)
				begin
					result = check_X(x-380, y-80);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a3 == 2'd1)
				begin
					result = check_O(x-380, y-80);
					if (result == 1)
					begin
						r = 4'd13;
						g = 4'd5;
						b = 4'd13;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else if ((x - 160) <= 100 && (y - 190) <= 100)
			begin
				if (a4 == 2'd2)
				begin
					result = check_X(x-160, y-190);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a4 == 2'd1)
				begin
					result = check_O(x-160, y-190);
					if (result == 1)
					begin
						r = 4'd13;
						g = 4'd5;
						b = 4'd13;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else if ((x - 270) <= 100 && (y - 190) <= 100)
			begin
				if (a5 == 2'd2)
				begin
					result = check_X(x-270, y-190);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a5 == 2'd1)
				begin
					result = check_O(x-270, y-190);
					if (result == 1)
					begin
						r = 4'd13;
						g = 4'd5;
						b = 4'd13;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else if ((x - 380) <= 100 && (y - 190) <= 100)
			begin
				if (a6 == 2'd2)
				begin
					result = check_X(x-380, y-190);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a6 == 2'd1)
				begin
					result = check_O(x-380, y-190);
					if (result == 1)
					begin
						r = 4'd13;
						g = 4'd5;
						b = 4'd13;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else if ((x - 160) <= 100 && (y - 300) <= 100)
			begin
				if (a7 == 2'd2)
				begin
					result = check_X(x-160, y-300);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a7 == 2'd1)
				begin
					result = check_O(x-160, y-300);
					if (result == 1)
					begin
						r = 4'd13;
						g = 4'd5;
						b = 4'd13;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else if ((x - 270) <= 100 && (y - 300) <= 100)
			begin
				if (a8 == 2'd2)
				begin
					result = check_X(x-270, y-300);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a8 == 2'd1)
				begin
					result = check_O(x-270, y-300);
					if (result == 1)
					begin
						r = 4'd13;
						g = 4'd5;
						b = 4'd13;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else if ((x - 380) <= 100 && (y - 300) <= 100)
			begin
				if (a9 == 2'd2)
				begin
					result = check_X(x-380, y-300);
					if (result == 1)
					begin
						r = 4'd0;
						g = 4'd12;
						b = 4'd12;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else if (a9 == 2'd1)
				begin
					result = check_O(x-380, y-300);
					if (result == 1)
					begin
						r = 4'd13;
						g = 4'd5;
						b = 4'd13;
					end
					else
					begin
						r = 4'd0;
						g = 4'd0;
						b = 4'd0;
					end
				end
				else
				begin
					r = 4'd0;
					g = 4'd0;
					b = 4'd0;
				end
			end
			else
			begin
				r = 4'd12;
				g = 4'd12;
				b = 4'd12;
			end
		end
		else
		begin
			r = 4'd0;
			g = 4'd0;
			b = 4'd0;
		end
	end
	
endmodule 
