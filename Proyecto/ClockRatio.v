`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:01 11/02/2014 
// Design Name: 
// Module Name:    ClockRatio 
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
module ClockRatio
	#(	parameter numRatio = 25000000, parameter demRatio = 22050)
	( 	input clk,
		input reset,
		output outClk);
		
	localparam numSize = logb2(numRatio) + 1;
		
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	reg [(numSize - 1):0] currrentCount;
	reg reClk;
	
	always @(posedge clk)
	begin
		if(reset)
			currrentCount <= 0;
		else if(currrentCount >= numRatio) begin
			currrentCount <= currrentCount - (numRatio - demRatio);
			reClk <= 1;
		end else begin
			currrentCount <= currrentCount + demRatio;
			reClk <= 0;
		end
	end
	
	assign outClk = reClk;



endmodule
