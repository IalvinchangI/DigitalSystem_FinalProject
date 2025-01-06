module Marker_and_Recorder( 
    input clk,
    input rst,
    input game_state, 
    input whosTurn,                      // 1:X,  0:O
    input [1:0] mark,                    // mark for 10:X, 01:O, 00:default
    input [3:0] position,                // choice of position for this run on grid (0-8)
                                         // 01:O     10:X    00:empty
    input [1:0] x0, x1, x2, x3, x4, x5, x6, x7, x8,
    output reg [1:0] y0, y1, y2, y3, y4, y5, y6, y7, y8              
); 
	reg [3:0] p0,p1,p2,p3,p4,p5; // record to erase
	reg [2:0] pt; // erase pointer

	always @(posedge clk or negedge rst) begin
		if (~rst) begin
			p0 <= 4'b9;
			p1 <= 4'b9;
			p2 <= 4'b9;	
			p3 <= 4'b9;
			p4 <= 4'b9;
			p5 <= 4'b9;	
			pt <= 3'b0;
			y0 <= 2'b0;
			y1 <= 2'b0;
			y2 <= 2'b0;
			y3 <= 2'b0;
			y4 <= 2'b0;
			y5 <= 2'b0;
			y6 <= 2'b0;
			y7 <= 2'b0;
			y8 <= 2'b0;
		end
		else begin
			if(position==0 && x0==0) begin
				y0 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end
			else if(position==1 && x1==0) begin
				y1 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end
			else if(position==2 && x2==0) begin
				y2 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end
			else if(position==3 && x3==0) begin
				y3 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end
			else if(position==4 && x4==0) begin
				y4 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end
			else if(position==5 && x5==0) begin
				y5 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end
			else if(position==6 && x6==0) begin
				y6 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end
			else if(position==7 && x7==0) begin
				y7 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end
			else if(position==8 && x8==0) begin
				y8 = whosTurn + 1;
				if(pt==3'd0) begin
					case(p0)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p0<=position;
				end
				else if(pt==3'd1) begin
					case(p1)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p1<=position;
				end
				else if(pt==3'd2) begin
					case(p2)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p2<=position;
				end
				else if(pt==3'd3) begin
					case(p3)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p3<=position;
				end
				else if(pt==3'd4) begin
					case(p4)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p4<=position;
				end
				else if(pt==3'd5) begin
					case(p5)
						4'd0: y0 = 2'b0; 
						4'd1: y1 = 2'b0;
						4'd2: y2 = 2'b0;
						4'd3: y3 = 2'b0;
						4'd4: y4 = 2'b0;
						4'd5: y5 = 2'b0;
						4'd6: y6 = 2'b0;
						4'd7: y7 = 2'b0;
						4'd8: y8 = 2'b0;
					endcase
					p5<=position;
				end
				pt <= (pt+1)%6;
			end			
		end
	end
endmodule
