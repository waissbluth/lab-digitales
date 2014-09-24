`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:28 09/23/2014 
// Design Name: 
// Module Name:    count_2 
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
module count_2(
	   input wire clk,
		input wire enable,
	   output reg [0:1] q
    );

	initial q = 8'b01;

	always @(posedge clk)
	begin
	if( enable )
		if( q == 8'b11 )
			q <= 8'b01;
		else
			q <= q+1;
	else
		q <= q;
	end
endmodule

