`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:51:16 10/12/2014 
// Design Name: 
// Module Name:    FontPrint 
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
module FontPrint
	#(parameter posBits = 9)
	  (input clk,
		input [6:0] char,
		input [(posBits - 1):0] posX, posY, evalX, evalY,
		
		output reg collision);
	
	wire [7:0] data;	
	reg [10:0] address;
	initial address = 0;
	
	wire [2:0] subsX;
	wire [3:0] subsY;
	
	assign subsX = evalX - posX;
	assign subsY = evalY - posY;
	
	font_rom Data (clk, address, data);
	
	always @(*)
	begin
		if(evalY >= posY & evalY - posY < 16) address = {char, subsY};
		else address = 0;
		
		if(evalX >= posX & evalX - posX < 8)
		begin
			case(subsX)
				0: collision = data[0];
				1: collision = data[1];
				2: collision = data[2];
				3: collision = data[3];
				4: collision = data[4];
				5: collision = data[5];
				6: collision = data[6];
				default: collision = data[7];
			endcase
		end
		else collision = 0;
	end
	


endmodule
