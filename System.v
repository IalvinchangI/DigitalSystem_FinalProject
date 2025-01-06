module System (rst,keyPadBuf,clock,b0,b1,b2,b3,b4,b5,b6,b7,b8,gameend,timeLeftten,timeLeftone,whosTurn); // top module
input [3:0] keyPadBuf;
input clock; //10HZ
input rst;
output  [1:0] b0,b1,b2,b3,b4,b5,b6,b7,b8;
output  [1:0] gameend; //00 not end, 01 Owin, 10 Xwin
output  [3:0] timeLeftten;
output  [3:0] timeLeftone;
output   whosTurn; //0:O,1:X
wire [3:0] location;
wire [1:0] mark;

CurrentInput CI(.clk(clock),.rst(rst),.keyPadBuf(keyPadBuf),.a0(b0),.a1(b1),.a2(b2),.a3(b3),.a4(b4),.a5(b5),.a6(b6),.a7(b7),.a8(b8),.location(location),.whosTurn(whosTurn),.mark(mark),.timeLeft1(timeLeftten),.timeLeft2(timeLeftone),.gameend(gameend));
Marker_and_Recorder MR(.clk(clock),.rst(rst),.game_state(gameend),.whosTurn(whosTurn),.mark(mark),.position(location),.x0(b0),.x1(b1),.x2(b2),.x3(b3),.x4(b4),.x5(b5),.x6(b6),.x7(b7),.x8(b8),.y0(b0),.y1(b1),.y2(b2),.y3(b3),.y4(b4),.y5(b5),.y6(b6),.y7(b7),.y8(b8));
GameIsOver GIO(.b0(b0),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),.b6(b6),.b7(b7),.b8(b8),.whosTurn(whosTurn),.tenDigit(timeLeftten),.UnitDigit(timeLeftone),.gameend(gameend));

endmodule
