`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:52 12/03/2014 
// Design Name: 
// Module Name:    score_print 
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
module score_print #(
		parameter H = 32,
		parameter V = 32
)(		input clk,
		
		input evalX,
		input evalY,
		input posX,
		input posY,
		output reg col
	
    );
	 
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction


endmodule
