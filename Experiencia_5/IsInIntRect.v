`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:07 10/10/2014 
// Design Name: 
// Module Name:    IsInIntRect 
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
module IsInIntRect
	#(parameter posBits = 9, parameter dimBits = 8)
	(  input [(dimBits - 1):0] dimX, dimY,
		input [(posBits - 1):0] posX, posY, evalX, evalY,
		
		output reg collision);
	
	
	
	reg [posBits:0] startX, endX, startY, endY;

	always @(*)
	begin 
		startX <= 0;
		startY <= 0;
		
		if((dimX>>2) <= posX) startX <= posX - dimX/2;
		if((dimY>>2) <= posY) startY <= posY - dimY/2;
		
		endX <= posX + (dimX - dimX/2);
		endY <= posY + (dimY - dimY/2);
		
		collision = startX <= evalX & evalX <= endX &
						startY <= evalY & evalY <= endY;
		
	end

endmodule
