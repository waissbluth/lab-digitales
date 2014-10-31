`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:15 10/20/2014 
// Design Name: 
// Module Name:    SegmentDisplay 
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
module SegmentDisplay
	( 	input clk,
		input [3:0] code,
		output reg [6:0] segments);
	
	always @(posedge clk)
	begin
		segments <= 7'b1111_111;
		
		if(code == 0)						// 0
			segments[5:0] <= 6'b000_000;
		
		else if(code == 1)				// 1
			segments[2:1] <= 0;
		
		else if(code == 2) begin		// 2
			segments[1:0] <= 0;
			segments[4:3] <= 0;
			segments[6] <= 0;
		
		end else if(code == 3) begin	// 3
			segments[3:0] <= 0;
			segments[6] <= 0;
		
		end else if(code == 4) begin	// 4
			segments[2:1] <= 0;
			segments[6:5] <= 0;
		
		end else if(code == 5) begin	// 5
			segments[0] <= 0;
			segments[3:2] <= 0;
			segments[6:5] <= 0;
		
		end else if(code == 6) begin	// 6
			segments[0] <= 0;
			segments[6:2] <= 0;
		
		end else if(code == 7)			// 7
			segments[2:0] <= 0;
		
		else if(code == 8)				// 8
			segments[6:0] <= 0;
		
		else if(code == 9) begin 		//9
			segments[3:0] <= 0;
			segments[6:5] <= 0;
		
		end else if(code == 10) begin	// A (10)
			segments[2:0] <= 0;
			segments[6:4] <= 0;
		
		end else if(code == 11)			// B (11)
			segments[6:2] <= 0;
		
		else if(code == 12) begin		// C (12)
			segments[4:3] <= 0;
			segments[6] <= 0;
		
		end else if(code == 13) begin	// D (13)
			segments[4:1] <= 0;
			segments[6] <= 0;
		
		end else if(code == 14) begin	// E (14)
			segments[0] <= 0;
			segments[6:3] <= 0;
		
		end else if(code == 15) begin	// F (15)
			segments[0] <= 0;
			segments[6:4] <= 0;
		end
		
	end

endmodule
