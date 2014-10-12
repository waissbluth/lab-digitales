`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:20 10/10/2014 
// Design Name: 
// Module Name:    Burst 
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
module Burst
	#(parameter numberOfClocks = 50)
	(  input clk,
		input bRelease,
		
		output burstClk,
		output reg counting);
		
	parameter counterBits = logb2(numberOfClocks);
	
	wire [(counterBits-1):0] count;
	wire overflow;
	
	initial counting = 0;
	
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	 
	Counter #(counterBits) clocksCount(clk, counting, ~counting, count, overflow);
	
	always @(posedge clk)
	begin
		if(count >= (numberOfClocks - 1))
			counting = 0;
		else 
			counting = (counting | bRelease);
	end
	
	assign burstClk = counting & clk;
	


endmodule
