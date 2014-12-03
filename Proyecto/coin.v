`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:36 12/03/2014 
// Design Name: 
// Module Name:    coin 
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
module coin
	#(parameter H = 32, parameter V = 32)(
		input clk,
		input reset,
		input [(logb2(H)-1):0] snake_x,
		input [(logb2(V)-1):0] snake_y,
		input snake_exists,
		input shift_snake,
		
		input [(logb2(H)-1):0] snake_tail_x,
		input [(logb2(V)-1):0] snake_tail_y,

		
		output reg [(logb2(H)-1):0] x,
		output reg [(logb2(V)-1):0] y,
		output reg exists,
		output point
    );
	 
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	 
	 reg [1:0] state_count;
	 
	 
	 always @(posedge clk) begin
		if(reset) begin
			exists <= 0;
			state_count <= 0;
		end else if(~exists) begin
			if(shift_snake)
				state_count <=  state_count + 1;
			if(state_count == 2'b11) begin
				x <= snake_tail_x;
				y <= snake_tail_y;
				exists <= 1;
			end
		end else begin
			//Interséctame
		end
	 end


endmodule
