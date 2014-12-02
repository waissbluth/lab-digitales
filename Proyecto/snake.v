`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:01 12/02/2014 
// Design Name: 
// Module Name:    snake 
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
module snake
#(parameter H = 32, parameter V = 32)
(		input clk,
		input reset,
		input dir_enable,
		input shift,
		input [1:0] dir,
		input [(logb2(H)-1):0] x,
		input [(logb2(V)-1):0] y,
		output exists,
		output self_col
    );

	localparam xBits = logb2(H);
	localparam yBits = logb2(V);
	localparam addrBits = log2(H*V);

	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	reg [(xBits-1):0] write_x;
	reg [(yBits-1):0] write_y;
	reg write_active;
	
	wire [(xBits + yBits):0] dina, doutb;
	
	wire [(addrBits-1):0]  addra_snake, addra_snake;
	
	assign dina = {write_x, write_y, write_active};
	

	wire [(xBits-1):0] read_x = doutb[(addrBits-1):(addrBits-xBits)];
	wire [(yBits-1):0] read_y = doutb[(addrBits-1-xBits):(addrBits-xBits-yBits)];
	wire read_active = doutb[0];
	
	snake_mem snake_mem_i (
	  .clka(clk), // input clka
	  .wea(wea), // input [0 : 0] wea
	  .addra(addra), // input [9 : 0] addra
	  .dina(dina), // input [10 : 0] dina
	  .clkb(clk), // input clkb
	  .addrb(addrb), // input [9 : 0] addrb
	  .doutb(doutb) // output [10 : 0] doutb
	);

endmodule
