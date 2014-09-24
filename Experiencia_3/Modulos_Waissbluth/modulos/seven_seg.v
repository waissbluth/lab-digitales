`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:06 09/23/2014 
// Design Name: 
// Module Name:    seven_seg 
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
module seven_seg(
		input [1:0] value,
		output reg [6:0] segments
	);

	always@(value)
	
	case(value)       //abcdefg
		1: segments = 7'b1111001;
		2: segments = 7'b0100100;
		3: segments = 7'b0110000;
		default: segments = 7'b1111111;
	endcase

endmodule
