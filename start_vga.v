module RGB_get(x, y, r, g, b);
	input [9:0] x;
	input [8:0] y;

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
      if ((x - 90) <= 100 && (y - 190) <= 100)
			begin
        result = check_O(x-90, y-190);
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
      else if ((x - 330) <= 100 && (y - 190) <= 100)
			begin
        result = check_O(x-330, y-190);
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
      else if ((x - 210) <= 100 && (y - 190) <= 100)
			begin
        result = check_X(x-210, y-190);
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
      else if ((x - 450) <= 100 && (y - 190) <= 100)
			begin
        result = check_X(x-450, y-190);
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
  		else
  		begin
  			r = 4'd0;
  			g = 4'd0;
  			b = 4'd0;
  		end
	end
	
endmodule 
