`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:09 10/09/2014 
// Design Name: 
// Module Name:    pong 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pong(
		input mclk,
		input [7:0] sw, 			// Switches
		input [3:0] btn,			// Buttons
		
		output [7:0] Led,
		
		output HSYNC,
		output VSYNC,
		
		output reg [2:0] OutRed,
		output reg [2:0] OutGreen,
		output reg [2:0] OutBlue
    );

	// Parametros
	parameter bitsPosicion = 10;
	parameter bitsDimension = 10;
	
	wire [(bitsPosicion - 1):0] offsetXCancha, offsetYCancha, posYPuntajes;
	assign offsetXCancha = 10;
	assign offsetYCancha = 10;
	assign posYPuntajes = 420;
	
	wire [(bitsDimension - 1):0] anchoPared;
	assign anchoPared = 1;
	
	wire [(bitsDimension - 1):0] anchoBloques;
	wire [(bitsDimension - 1):0] altoBloques;
	
	assign anchoBloques = 10;
	assign altoBloques = 60;
	
	wire [(bitsPosicion - 1):0] bar_1_x;
	wire [(bitsPosicion - 1):0] bar_2_x;
	
	assign bar_1_x = 20 + offsetXCancha;
	assign bar_2_x = 600 + offsetXCancha;

	//Clocks
	wire vgaClk;
	wire logicClk;
	wire halverCount;
	
	wire reset;
	assign reset = sw[0];
	
	Sha #(500000) logicTimer(mclk, logicClk);
	Counter #(1) clockHalver(mclk, 1'b1, reset, halverCount, vgaClk);
	
	// Pantalla
	wire [(bitsPosicion - 1):0] x_pixel, y_pixel, y_tmp;
	wire vOn, refresh;
	
	Sync vgaDriver(vgaClk, 1'b0, x_pixel, y_tmp, HSYNC, VSYNC, vOn, refresh);
	assign y_pixel = 480 - y_tmp;
	
	// Posicion en y de cada barra y la pelota
	wire [(bitsPosicion - 1):0] bar_1_y, bar_2_y;
	wire [(bitsPosicion - 1):0] x_ball, y_ball;
	
	// Pulsos cuando hay punto para alguien
	wire point1, point2;
	
	// Playing = 1: Seguimos Jugando.
	// Winner = 1: El ganador es el player 1.
	wire playing, winner;
	
	wire [2:0] score1;
	wire [2:0] score2;
	
	// Bloques logicos
	barra Barra1(logicClk, reset, btn[0], btn[1], bar_1_y);
	barra Barra2(logicClk, reset, btn[2], btn[3], bar_2_y);

	ball Ball(logicClk, reset, bar_1_y, bar_2_y, x_ball, y_ball, point1, point2);
	
	scores Scores(logicClk, reset, point1, point2, score1, score2, playing, winner);
	
	// Offset en y a barras, pelota y puntajes entre grafica y logica
	wire [(bitsPosicion - 1):0]  g_bar_1_y, g_bar_2_y, g_x_ball, g_y_ball;
	wire [6:0] g_score1, g_score2;
	
	assign g_bar_1_y = bar_1_y + offsetYCancha;
	assign g_bar_2_y = bar_2_y + offsetYCancha;
	assign g_x_ball = x_ball + offsetXCancha;
	assign g_y_ball = y_ball + offsetYCancha;
	
	assign g_score1 = score1 + 48;
	assign g_score2 = score2 + 48;
	
	// Bloques graficos
	wire pixelB1, pixelB2, pixelBall, pixelCageLeft, pixelCageRight, pixelCageUp, pixelCageDown, pixelScoreP1, pixelScoreP2;
	
	// Pelota, barras
	IsInIntRect #(bitsPosicion, bitsDimension) graphicP1 (anchoBloques, altoBloques, bar_1_x, g_bar_1_y, x_pixel, y_pixel, pixelB1);
	IsInIntRect #(bitsPosicion, bitsDimension) graphicP2 (anchoBloques, altoBloques, bar_2_x, g_bar_2_y, x_pixel, y_pixel, pixelB2);
	IsInIntCircle #(bitsPosicion, bitsDimension) graphicBall (8, g_x_ball, g_y_ball, x_pixel, y_pixel, pixelBall);
	
	// Cancha
	IsInIntRect #(bitsPosicion, bitsDimension) graphicCageLeft (anchoPared, 360, offsetXCancha, 180 + offsetYCancha, x_pixel, y_pixel, pixelCageLeft);
	IsInIntRect #(bitsPosicion, bitsDimension) graphicCageRight (anchoPared, 360, 620 + offsetXCancha, 180 + offsetYCancha, x_pixel, y_pixel, pixelCageRight);
	IsInIntRect #(bitsPosicion, bitsDimension) graphicCageUp (620, anchoPared, 310 + offsetXCancha, 360 + offsetYCancha, x_pixel, y_pixel, pixelCageUp);
	IsInIntRect #(bitsPosicion, bitsDimension) graphicCageDown (620, anchoPared, 310 + offsetXCancha, offsetYCancha, x_pixel, y_pixel, pixelCageDown);
	
	// Puntajes
	FontPrint #(bitsPosicion) graphicScore1 (mclk, g_score1, 100, posYPuntajes, x_pixel, y_pixel, pixelScoreP1);
	FontPrint #(bitsPosicion) graphicScore2 (mclk, g_score2, 532, posYPuntajes, x_pixel, y_pixel, pixelScoreP2);
	
	wire paintPixel;
	assign paintPixel = pixelB1 | pixelB2 | pixelBall | pixelCageLeft | pixelCageRight | pixelCageUp | pixelCageDown | pixelScoreP1 | pixelScoreP2;
	
	// Refrescar pantalla
	always @(posedge mclk)
	begin
		OutBlue[0] = 0;
		
		if(vOn)
		begin
			
			if(paintPixel)
			begin		
				OutRed = ~sw[7:5];
				OutGreen = ~sw[4:2];
				OutBlue[2:1] = ~sw[1:0];
			end
			else
			begin		
				OutRed = sw[7:5];
				OutGreen = sw[4:2];
				OutBlue[2:1] = sw[1:0];
			end
			
		end
		
		else
		begin
			OutRed = 3'b0;
			OutGreen = 3'b0;
			OutBlue[2:1] = 2'b0;
		end
	end
	
	//Debug
	//assign Led = x_ball[7:0];
	assign Led = logicClk;
	
endmodule
