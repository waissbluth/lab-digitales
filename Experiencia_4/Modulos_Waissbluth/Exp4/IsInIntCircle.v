`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:55:45 10/12/2014 
// Design Name: 
// Module Name:    IsInIntCircle 
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
module IsInIntCircle
#(parameter posBits = 9, parameter dimBits = 8)
	(  input [(dimBits - 1):0] radius,
		input [(posBits - 1):0] posX, posY, evalX, evalY,
		
		output reg collision);

	reg [(posBits - 1):0] relativX;
	reg [(posBits - 1):0] relativY;
	
	always @(*)
	begin
		if(posX > evalX) relativX = posX - evalX;
		else relativX = evalX - posX;
		
		if(posY > evalY) relativY = posY - evalY;
		else relativY = evalY - posY;
		
		collision = relativX*relativX + relativY*relativY <= radius*radius;
	end

endmodule
