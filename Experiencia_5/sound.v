`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:52:51 11/01/2014 
// Design Name: 
// Module Name:    sound 
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
module sound(
	input clk,
	input [4:0] note,
	output [8:0] value
    );
	 
	reg [8:0] count;
	reg [28:0] remainder_accum;
	
	wire [6:0] jump;
	wire [28:0] remainder;
	
	jump jumper(note, jump, remainder);
	
	sin_wave siner(clk, count, value);
	
	initial begin
		count = 0;
		remainder_accum = 0;
	end
	
	always @(posedge clk) begin
		
		if (remainder_accum + remainder <= 100000000) begin
			remainder_accum <= remainder_accum + remainder;
			count <= count + jump;
		end else begin
			remainder_accum <= remainder_accum - 100000000 + remainder;
			count <= count + jump + 1;
		end
	
	end

endmodule
