`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:50 11/01/2014 
// Design Name: 
// Module Name:    sin_wave 
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
module sin_wave(
		input clk,
		input [8:0] count,
		output reg [8:0] val
    );
	 
	reg [6:0] addr;
	wire [7:0] mem;
	
	sin sin_instance (
	  .clka(clk), // input clka
	  .wea(0), // input [0 : 0] wea
	  .addra(addr), // input [6 : 0] addra
	  .dina(0), // input [7 : 0] dina
	  .douta(mem) // output [7 : 0] douta
	);
	
	reg [8:0] count_before;
	 
	always @(posedge clk)
	begin
		if(count <= 127)
			addr <= count;
		else if(count <= 255)
			addr <= 255 - count;
		else if(count <= 383)
			addr <= count - 256;
		else 
			addr <= 511 - count;
			
		if(count_before <= 255)
			val <= 256 + mem;
		else
			val <= 256 - mem;
			
		count_before <= count;
	end	


endmodule
