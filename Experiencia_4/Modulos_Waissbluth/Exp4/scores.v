`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:49 10/09/2014 
// Design Name: 
// Module Name:    scores 
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
module scores(
		input clk,
		input reset,
		input point1,
		input point2,
		output reg [2:0] score1,
		output reg [2:0] score2,
		output reg playing,
		output reg winner
    );
	 
	 
	 initial begin
	 	score1 = 0;
		score2 = 0;
		playing = 1;
		winner = 0;
	end
			 
	 always@(posedge clk, posedge reset)
	 begin
		 if(reset) begin
			score1 <= 0;
			score2 <= 0;
			playing <= 1;
			winner <= 0;
		 end else begin	 
			if((score1 < 7) && (score2 < 7)) begin
				score1 <= score1 + point1;
				score2 <= score2 + point2;
			end else begin
				playing <= 0;
				winner <= (score1 == 7);
			end
		 end
		 
	 
	 end


endmodule
