`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:43:40 10/21/2014 
// Design Name: 
// Module Name:    SegmentCycler 
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
module SegmentCycler
	(  input clk,
		input [3:0] enable,
		input [3:0] in3, in2, in1, in0,
		input [3:0] dots,
		
		output [6:0] segments,
		output dot,
		output reg [3:0] an);

	reg [3:0] in;
	wire [6:0] rawSegments;
	reg currentDot;
	reg currentEnable;

	wire [9:0] slowClkCount;
	wire slowClk;

	Counter #(10) slowClkCounter(clk, 1'b1, 1'b0, slowClkCount, slowClk);

	wire [1:0] cyclerCount;
	wire cyclerOverflow;
	Counter #(2) cycler(slowClk, 1'b1, 1'b0, cyclerCount, cyclerOverflow);
	
	SegmentDisplay display(clk, in, rawSegments);
	
	always @(posedge clk)
	begin
		if(cyclerCount == 0)
		begin
			in <= in0;
			currentDot <= dots[0];
			currentEnable <= enable[0];
			an = 4'b1110;
		end
		
		if(cyclerCount == 1)
		begin
			in <= in1;
			currentDot <= dots[1];
			currentEnable <= enable[1];
			an = 4'b1101;
		end
		
		if(cyclerCount == 2)
		begin
			in <= in2;
			currentDot <= dots[2];
			currentEnable <= enable[2];
			an = 4'b1011;
		end
		
		if(cyclerCount == 3)
		begin
			in <= in3;
			currentDot <= dots[3];
			currentEnable <= enable[3];
			an = 4'b0111;
		end
	end

	assign segments = rawSegments | {7{!currentEnable}};
	assign dot = !currentDot | !currentEnable;

endmodule