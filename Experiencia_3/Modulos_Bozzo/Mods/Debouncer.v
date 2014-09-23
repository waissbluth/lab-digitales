`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: John Debouncy
// Engineer: Juan Andrés Bozzo
// 
// Create Date:    23:24:47 09/22/2014 
// Design Name: 
// Module Name:    Debouncer 
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
module Debouncer
	#(parameter powerWait = 8)
	(	input CLK,
		input wire enable,
		input wire in,
		
		output reg out);
		
	wire [(powerWait - 1):0] count;
	reg previousIn;
	
	wire overflow;
	reg passValue;
	reg reset;
	
	Counter #(powerWait) waitCounter(CLK, 1'b1, reset, count, overflow);
	
	always @ (posedge CLK)
	begin
		
		if(in == previousIn & enable) reset = 1'b0;
		
		else
		begin
		
			reset = 1'b1;
			passValue = 1'b0;
			
		end
		
		if(overflow) passValue = 1'b1;
		if(~enable | passValue) out = in;
		
		previousIn = in;
	
	end

endmodule
