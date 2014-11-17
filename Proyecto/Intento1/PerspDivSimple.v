`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:43 11/09/2014 
// Design Name: 
// Module Name:    PerspDivSimple 
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
module PerspDivSimple
	#(parameter intBits = 8, parameter decimalBits = 8)
	(	input signed [(intBits + decimalBits):0] x, y, z,
		output signed [(intBits + decimalBits):0] newX, newY);
	
	wire signed [(intBits + decimalBits*2 - 1):0] postZ = {{(decimalBits - 1){z[decimalBits + intBits]}}, z};
	wire signed [(intBits + decimalBits*2):0] preNewX, preNewY;
	wire signed [(intBits + decimalBits*2 - 1):0] preNewX_rem, preNewY_rem;
	
	BoothsDiv #(intBits + decimalBits*2) xDiv({x, {(decimalBits){1'b0}}}, postZ, preNewX, preNewX_rem);
	BoothsDiv #(intBits + decimalBits*2) yDiv({y, {(decimalBits){1'b0}}}, postZ, preNewY, preNewY_rem);
	
	assign newX = {preNewX[(intBits + decimalBits*2)], preNewX[(intBits + decimalBits - 1):0]};
	assign newY = {preNewY[(intBits + decimalBits*2)], preNewY[(intBits + decimalBits - 1):0]};

endmodule
