`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:27 11/01/2014 
// Design Name: 
// Module Name:    sin 
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
module sin(
		input clk,
		input [8:0] count,
		output [7:0] val
    );
	 
	reg [6:0] addr;
	
	sin sin_instance (
	  .clka(clk), // input clka
	  .wea(0), // input [0 : 0] wea
	  .addra(addr), // input [6 : 0] addra
	  .dina(0), // input [7 : 0] dina
	  .douta(val) // output [7 : 0] douta
	);
	 
	always @(posedge clk)
	begin
		if(count <= 127)
			addr <= count;
		else if(count <= 255)
			addr <= 255 - count;
		else if(count <= 383)
			addr <= count - 383;
		else 
			addr <= 511 - count;
	end	
	
		always
	#1  clk = ~clk;
	
	always
	#1  count = count + 1;


endmodule
