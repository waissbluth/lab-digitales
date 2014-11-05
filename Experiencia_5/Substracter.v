`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:14 10/30/2014 
// Design Name: 
// Module Name:    Substracter 
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
module Substracter
	#(parameter bits = 8)
	( 	input [(bits - 1):0] a, b,
		input signA, signB,
		
		output [(bits - 1):0] result,
		output sign );
		
	wire [bits:0] compA, compB, compResult;
	
	ToTwosComplement #(bits) complementA (a, signA, compA);
	ToTwosComplement #(bits) complementB (b, !signB, compB);
	
	assign compResult = compA + compB;
	
	FromTwosComplement #(bits) unComplement (compResult, sign, result);

endmodule
