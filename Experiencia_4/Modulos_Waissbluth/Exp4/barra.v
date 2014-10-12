`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:00 10/09/2014 
// Design Name: 
// Module Name:    barra 
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
module barra(
		input clk,
		input reset,
		input up,
		input down,
		output reg [9:0] y
    );
	
	parameter min = 30;
	parameter max = 329;
	
	// La barra se mueve esta cantidad de pixeles
	parameter delta = 4;
	
	// La barra parte al medio
	initial y = 180;

	always@(posedge clk)
	begin

		if(reset)
			y <= 180;
		else if (up && y < max && !down)
			// Se satura en el máximo
			y <= (y + delta) < max ? y + delta : max;
		else if(down && y > min && !up)
			// Se satura en el mínimo
			y <= (y - delta > min) ? y - delta : min;
		else
			y <= y;

	end


endmodule
