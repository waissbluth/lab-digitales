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
		output reg [7:0] segments
	);

	always@(value)
	
	case(value)
		1: segments = 8'b10011111;
		2: segments = 8'b00100101;
		3: segments = 8'b00001101;
		default: segments = 8'b00000011;
	endcase

endmodule
