`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:45 10/13/2014 
// Design Name: 
// Module Name:    GameOverPrint 
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
module GameOverPrint
	#(parameter posBits = 9)
	(
		input clk,
		input [(posBits-1):0] posX, posY, evalX, evalY,
		input player,
		output collision
    );
	 
		parameter spacing = 8;
	 
	 	wire [(posBits-1):0] subX, subY;
		
		assign subX = evalX - posX;
		assign subY = evalY - posY;
		
		wire cW, cI, cN1, cN2, cE, cR, cP, c1, c2;
		
		FontPrint #(posBits) w  (clk, 87, 0, 0, subX, subY, cW);
		FontPrint #(posBits) i  (clk, 73, (spacing * 1), 0, subX, subY, cI);
		FontPrint #(posBits) n1 (clk, 78, spacing * 2, 0, subX, subY, cN1);
		FontPrint #(posBits) n2 (clk, 78, spacing * 3, 0, subX, subY, cN2);
		FontPrint #(posBits) e  (clk, 69, spacing * 4, 0, subX, subY, cE);
		FontPrint #(posBits) r  (clk, 82, spacing * 5, 0, subX, subY, cR);
		FontPrint #(posBits) p  (clk, 80, spacing * 7, 0, subX, subY, cP);
		FontPrint #(posBits) p1 (clk, 49, spacing * 8, 0, subX, subY, c1);
		FontPrint #(posBits) p2 (clk, 50, spacing * 8, 0, subX, subY, c2);
		
		assign collision = cW | cI | cN1 | cN2 | cE | cR | cP | ( (player & c1) | (!player & c2) );

	
endmodule
