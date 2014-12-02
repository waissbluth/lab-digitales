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
		
		localparam right = 0, up = 1, left = 2, down = 3;
		localparam H = 32, V = 32;
		
		function integer logb2;
			input integer n;
			begin
				n = n-1;
			for(logb2=0; n>0; logb2=logb2 + 1)
				n = n>>1;
			end
		endfunction
		
		wire reset = sw[0];
		
		reg [1:0] move;
		
		always @(posedge mclk) begin
			if(btn < 2)
				move <= right;
			else if(btn < 4)
				move <= left;
			else if(btn < 8)
				move <= up;
			else
				move <= down;
		end
		
		wire [(logb2(H)-1):0] x_snake;
		wire [(logb2(V)-1):0] y_snake;
		wire exists;
		wire game_over;

		snake #(H, V) snake_i  ( mclk, reset, |btn, 0, move, x_snake, y_snake, exists, game_over);


endmodule
