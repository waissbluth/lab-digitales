`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: John Debouncy
// 
// Create Date:    17:26:40 09/22/2014 
// Design Name: 
// Module Name:    mux_2 
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
module mux_2(
	input [0:7] in_0, in_1, in_2, in_3,
	input [0:1] sel,
	output wire [0:7] out
    );

assign out = sel[0] ? ( sel[1] ? (in_3) : (in_2) ) : ( sel[1] ? (in_1) : (in_0) );

endmodule
