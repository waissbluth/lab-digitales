`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:58:46 11/14/2014 
// Design Name: 
// Module Name:    TrisRender 
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
module TrisRender
	#(	parameter screenX = 640, parameter screenY = 480, parameter intBits = 8, parameter decimalBits = 8, parameter colorDepth = 4)
	(	input [(max(logb2(screenX), logb2(screenY)) - 1):0] evalX, evalY,
		input signed [(intBits + decimalBits):0] vert_0_x, vert_0_y, vert_0_z,
		input signed [(intBits + decimalBits):0] vert_1_x, vert_1_y, vert_1_z,
		input signed [(intBits + decimalBits):0] vert_2_x, vert_2_y, vert_2_z,
		input signed [(2 + decimalBits):0] rot_x, rot_y, rot_z,
		input signed [(intBits + decimalBits):0] pos_x, pos_y, pos_z,
		input	signed [(colorDepth - 1):0] col_0, col_1, col_2
		);
	
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	function integer max;
	  input integer a;
	  input integer b;
	  begin
		 if(a > b) max = a;
		 else max = b;
	  end
	endfunction
	
	localparam integer screenXSize = logb2(screenX);
	localparam integer screenYSize = logb2(screenY);
	localparam integer halfScreenX = screenX/2;
	localparam integer halfScreenY = screenY/2;
	localparam integer evalBits = max(screenXSize, screenYSize);
	
	

endmodule

