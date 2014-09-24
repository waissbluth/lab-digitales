`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: John Debouncy
// Engineer: Juan Andrés Bozzo 
// 
// Create Date:    00:29:34 09/24/2014 
// Design Name: 
// Module Name:    Functions 
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
module Functions
	(	input [1:0] f,
		input [7:0] index,
					
		output reg [7:0] value );
		
	always @(*)
	begin
		case(f)
			2'b01 : value = index;
			2'b10 : value = index[7] ? 8'b1111_1111 - {index[6:0], 1'b0} : {index[6:0], 1'b0};
			default value = 8'b0000_0000;
		endcase
	end


endmodule
