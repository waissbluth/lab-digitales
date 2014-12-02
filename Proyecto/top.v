`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:17 12/02/2014 
// Design Name: 
// Module Name:    top 
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
module top(
		input mclk,
		input [7:0] sw, 			// Switches
		input [3:0] btn,			// Buttons
		input PS2C, PS2D,
		
		/*output [6:0] seg,			// Display
		output dp,
		output [3:0] an,*/
		
		output [7:0] Led,
		output HSYNC, VSYNC,
		output [2:0] OutRed, OutGreen, OutBlue
		);




endmodule
