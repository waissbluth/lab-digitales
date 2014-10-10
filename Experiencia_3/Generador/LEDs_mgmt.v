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
	//out = {in[7:4], 4'b0000};
	case(in[7:4])
		4'b0000: out = 8'b00000000;
		4'b0001: out = 8'b00000001;
		4'b0010: out = 8'b00000001;
		4'b0011: out = 8'b00000011;
		4'b0100: out = 8'b00000011;
		4'b0101: out = 8'b00000111;
		4'b0110: out = 8'b00000111;
		4'b0111: out = 8'b00001111;
		4'b1000: out = 8'b00001111;
		4'b1001: out = 8'b00011111;
		4'b1010: out = 8'b00011111;
		4'b1011: out = 8'b00111111;
		4'b1100: out = 8'b00111111;
		4'b1101: out = 8'b01111111;
		4'b1110: out = 8'b01111111;
		4'b1111: out = 8'b11111111;
		default: out = 8'b01010101;
	endcase

endmodule