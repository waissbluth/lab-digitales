`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:23 09/23/2014 
// Design Name: 
// Module Name:    count_1 
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
module count_1(
		input wire clk,
		input wire enable,
		output reg [7:0] q
    );

	initial q = 0;

	always @(posedge clk)
	begin
	if( enable )
		if( q == 8'b11111111 )
			q <= 8'b00000000;
		else
			q <= q+1;
	else
		q <= q;
	end
endmodule

