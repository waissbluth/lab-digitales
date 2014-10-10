`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: John Debouncy
// Engineer: Juan Andrés Bozzo
// 
// Create Date:    00:08:29 09/23/2014 
// Design Name: 
// Module Name:    ReClock 
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
module ReClock
	(	input CLK,
		input enable,
		input [1:0] frecuency,
		
		output wire out );
		
		parameter bits_0 = 4;
		parameter bits_1 = 17;
		parameter bits_2 = 16;
		parameter bits_3 = 15;
		
		wire [(bits_0 - 1):0] buffer_0;
		wire [(bits_1 - 1):0] buffer_1;
		wire [(bits_2 - 1):0] buffer_2;
		wire [(bits_3 - 1):0] buffer_3;
		
		wire CLK_0;
		wire CLK_1;
		wire CLK_2;
		wire CLK_3;
		
		Counter #(bits_0) count_0(CLK, 1'b1, ~enable, buffer_0, CLK_0);
		Counter #(bits_1) count_1(CLK, 1'b1, ~enable, buffer_1, CLK_1);
		Counter #(bits_2) count_2(CLK, 1'b1, ~enable, buffer_2, CLK_2);
		Counter #(bits_3) count_3(CLK, 1'b1, ~enable, buffer_3, CLK_3);
		
		assign out = 		frecuency[0] ?
							(	frecuency[1] ? (CLK_3) : (CLK_2) ) :
							(	frecuency[1] ? (CLK_1) : (CLK_0) ) ;

endmodule
