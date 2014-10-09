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
		input [3:0] btn			// Buttons
    );

	wire reset;
	assign reset = sw[0];
	
	// Posicion en y de cada barra
	wire [9:0] bar_1_y;
	wire [9:0] bar_2_y;
	
	// Pulsos cuando hay punto para alguien
	wire point1, point2;
	
	// Playing = 1: Seguimos Jugando.
	// Winner = 1: El ganador es el player 1.
	wire playing, winner;
	
	wire [2:0] score1;
	wire [2:0] score2;
	
	Barra1 barra(clk, reset, btn[0], btn[1], bar_1_y);
	Barra2 barra(clk, reset, btn[2], btn[3], bar_2_y);

	Ball ball(clk, reset, bar_1_y, bar_2_y, x_ball, y_ball, point1, point2);
	
	Scores scores(clk, reset, point1, point2, score1, score2, playing, winner);
	  

endmodule
