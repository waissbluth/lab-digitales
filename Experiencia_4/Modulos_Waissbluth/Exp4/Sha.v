`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:38 10/10/2014 
// Design Name: 
// Module Name:    Sha 
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
module Sha
	#(parameter every = 4)
	(  input inClk,
		output outClk  );
	
	parameter bitsCount = logb2(every);
	
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	reg reset;	
	initial reset = 1;
	
	wire [bitsCount:0] count;
	Counter #(bitsCount) clkCounter(inClk, 1'b1, reset, count[(bitsCount - 1):0], count[bitsCount]);

	always @(posedge inClk)
	begin
		if(reset == 1)
			reset = 0;
		else if(count >= (every - 1))
			reset = 1;
	end
	assign outClk = reset & inClk;
	
	
endmodule