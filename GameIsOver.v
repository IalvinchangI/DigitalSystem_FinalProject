module GameIsOver(b0,b1,b2,b3,b4,b5,b6,b7,b8,whosTurn,tenDigit,UnitDigit,gameend)
input [1:0] b0,b1,b2,b3,b4,b5,b6,b7,b8;
input whosTurn;
input [3:0] tenDigit,UnitDigit;
output [1:0] gameend;
reg [1:0] gameend;
always@(whosTurn)
begin
    gameend = 2'b00;
    if (
        (b0 == 2'b01 && b3 == 2'b01 && b6 == 2'b01) ||
        (b1 == 2'b01 && b4 == 2'b01 && b7 == 2'b01) ||
        (b2 == 2'b01 && b5 == 2'b01 && b8 == 2'b01) ||
        (b0 == 2'b01 && b1 == 2'b01 && b2 == 2'b01) ||
        (b3 == 2'b01 && b4 == 2'b01 && b5 == 2'b01) ||
        (b6 == 2'b01 && b7 == 2'b01 && b8 == 2'b01) ||
        (b0 == 2'b01 && b4 == 2'b01 && b8 == 2'b01) ||
        (b2 == 2'b01 && b4 == 2'b01 && b6 == 2'b01)
    )
    begin
        gameend = 2'b01;
    end 
    else if (
        (b0 == 2'b10 && b3 == 2'b10 && b6 == 2'b10) || 
        (b1 == 2'b10 && b4 == 2'b10 && b7 == 2'b10) ||
        (b2 == 2'b10 && b5 == 2'b10 && b8 == 2'b10) ||
        (b0 == 2'b10 && b1 == 2'b10 && b2 == 2'b10) ||
        (b3 == 2'b10 && b4 == 2'b10 && b5 == 2'b10) ||
        (b6 == 2'b10 && b7 == 2'b10 && b8 == 2'b10) ||
        (b0 == 2'b10 && b4 == 2'b10 && b8 == 2'b10) ||
        (b2 == 2'b10 && b4 == 2'b10 && b6 == 2'b10)
    ) 
    begin
        gameend = 2'b10;
    end
    else if(tenDigit == 4'b0000 && UnitDigit == 4'b0000)
    begin
        if(whosTurn == 1'b0)
        begin
            gameend = 2'b01;
        end
        else
        begin
            gameend = 2'b10;
        end
    end
end
endmodule
