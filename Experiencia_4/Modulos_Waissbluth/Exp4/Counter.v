`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: John Debouncy
// Engineer: Juan Andrés Bozzo
// 
// Create Date:    21:53:37 09/22/2014 
// Design Name: 
// Module Name:    Counter 
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
module Counter
	#(parameter bits = 8)
	(	input CLK,
		input enable,
		input reset,
		output reg [(bits-1):0] count,
		output reg overflow );

	wire nextOverflow;
	wire [(bits-1):0] nextCount;
	Adder #(bits) counter(	{{(bits - 1){1'b0}}, 1'b1},
									count,
									nextCount,
									nextOverflow);

	always @ (posedge CLK)
	begin
		if(enable & ~reset)
		begin
			count = nextCount;
			overflow = nextOverflow;
		end
		
		else if(reset)
		begin
			count = {bits{1'b0}};
			overflow = 1'b0;
		end
	end
		
endmodule
