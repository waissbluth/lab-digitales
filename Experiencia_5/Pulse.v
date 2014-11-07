`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:01 10/19/2014 
// Design Name: 
// Module Name:    Pulse 
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
module Pulse
	(  input clk,
		input enable,
		
		output reg pulse);
		
		reg previousEnable;
		initial previousEnable = 0;
		
		always @(posedge clk)
		begin
			pulse <= !previousEnable & enable;
			previousEnable <= enable;
		end

endmodule
