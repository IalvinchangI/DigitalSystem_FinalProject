module CurrentInput(rst,keyPadBuf,markChecker,b0,b1,b2,b3,b4,b5,b6,b7,b8,whosTurn);
	
	input rst;
	input [2:0] keyPadBuf;
	input [8:0] markChecker;//chech if there is empty
	
	output reg [1:0] b0,b1,b2,b3,b4,b5,b6,b7,b8;
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
		
		case(keyPadBuf) 
		
			3'd0:begin
				if(!markChecker[0]) begin
					if(whosTurn) begin
						b0 <= 2'b01;
					end else begin
						b0 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd1:begin
				if(!markChecker[1]) begin
					if(whosTurn) begin
						b1 <= 2'b01;
					end else begin
						b1 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd2:begin
				if(!markChecker[2]) begin
					if(whosTurn) begin
						b2 <= 2'b01;
					end else begin
						b2 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd3:begin
				if(!markChecker[3]) begin
					if(whosTurn) begin
						b3 <= 2'b01;
					end else begin
						b3 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd4:begin
				if(!markChecker[4]) begin
					if(whosTurn) begin
						b4 <= 2'b01;
					end else begin
						b4 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd5:begin
				if(!markChecker[5]) begin
					if(whosTurn) begin
						b5 <= 2'b01;
					end else begin
						b5 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd6:begin
				if(!markChecker[6]) begin
					if(whosTurn) begin
						b6 <= 2'b01;
					end else begin
						b6 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd7:begin
				if(!markChecker[7]) begin
					if(whosTurn) begin
						b7 <= 2'b01;
					end else begin
						b7 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
			3'd8:begin
				if(!markChecker[8]) begin
					if(whosTurn) begin
						b8 <= 2'b01;
					end else begin
						b8 <= 2'b10;
					end
					whosTurn <= ~whosTurn;
				end
			end
			
		endcase
	end
	
endmodule
