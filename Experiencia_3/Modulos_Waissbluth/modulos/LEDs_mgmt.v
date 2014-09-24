`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:23:11 09/23/2014 
// Design Name: 
// Module Name:    LEDs_mgmt 
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
module LEDs_mgmt(
		input wire [7:0] in,
		output reg [7:0] out
	);
	
	always@(*)
	
	case(in[7:4])
		0:  out = 8'b00000000;
		1:  out = 8'b00000001;
		2:  out = 8'b00000001;
		3:  out = 8'b00000011;
		4:  out = 8'b00000011;
		5:  out = 8'b00000111;
		6:  out = 8'b00000111;
		7:  out = 8'b00001111;
		8:  out = 8'b00001111;
		9:  out = 8'b00011111;
		10: out = 8'b00011111;
		11: out = 8'b00111111;
		12: out = 8'b00111111;
		13: out = 8'b01111111;
		14: out = 8'b01111111;
		15: out = 8'b11111111;
	endcase

endmodule