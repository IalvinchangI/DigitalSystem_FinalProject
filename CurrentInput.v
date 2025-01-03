module CurrentInput(rst,keyPadBuf,a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,whosTurn);
	
	input rst;
	input [2:0] keyPadBuf;
	input [1:0] a0,a1,a2,a3,a4,a5,a6,a7,a8;// the matrix after elimination
	
	output reg [1:0] b0,b1,b2,b3,b4,b5,b6,b7,b8;//
	output reg whosTurn;//0:X 1:O
	
	always@(*)begin
		if(!rst) begin
			b0 <= 2'b00;
         b1 <= 2'b00;
         b2 <= 2'b00;
         b3 <= 2'b00;
         b4 <= 2'b00;
         b5 <= 2'b00;
         b6 <= 2'b00;
         b7 <= 2'b00;
         b8 <= 2'b00;
			whosTurn <= 0;
		end
		
		b0 <= a0;
      b1 <= a1;
      b2 <= a2;
      b3 <= a3;
      b4 <= a4;
      b5 <= a5;
      b6 <= a6;
      b7 <= a7;
      b8 <= a8;
		
		case(keyPadBuf) 
		
			3'd0:begin
				if(a0==0) begin
					b0 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd1:begin
				if(a1==0) begin
					b1 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd2:begin
				if(a2==0) begin
					b2 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd3:begin
				if(a3==0) begin
					b3 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd4:begin
				if(a4==0) begin
					b4 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd5:begin
				if(a5==0) begin
					b5 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd6:begin
				if(a6==0) begin
					b6 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd7:begin
				if(a7==0) begin
					b7 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd8:begin
				if(a8==0) begin
					b8 <= (whosTurn)?2'b01:2'b10;
					whosTurn <= ~whosTurn;
				end
			end
			
		endcase
	end
	
endmodule
