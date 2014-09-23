`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: John Debouncy
// Engineer: Juan Andrés Bozzo
// 
// Create Date:    22:28:53 09/22/2014 
// Design Name: 
// Module Name:    ClockGen 
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
module ClockGen
	#(parameter halfPeriod = 5)
	(	output reg CLK);

	always
		#halfPeriod CLK = !CLK;

endmodule
