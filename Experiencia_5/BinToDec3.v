`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:40 11/03/2014 
// Design Name: 
// Module Name:    BinToDec3 
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
module BinToDec3
	(	input [9:0] binary,
		output [3:0] value0,
		output [3:0] value1,
		output [3:0] value2);
		
		wire divSign0;
		wire [9:0] divResult0;
		IntDiv #(10, 4) division0(binary, 10, 1'b0, 1'b0, divResult0, divSign0);
		
		wire divSign1;
		wire [9:0] divResult1;
		IntDiv #(10, 4) division1(divResult0, 10, 1'b0, 1'b0, divResult1, divSign1);

		assign value0 = binary - ({divResult0[0], 3'b000} + {divResult0[2:0], 1'b0});
		assign value1 = divResult0 - ({divResult1[0], 3'b000} + {divResult1[2:0], 1'b0});
		assign value2 = divResult1[3:0];

endmodule