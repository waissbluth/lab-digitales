`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:47 11/06/2014 
// Design Name: 
// Module Name:    KeyToTermometer 
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
module KeyToTermometer
(	input clk, reset,
	input newKey,
	input [7:0] keyCode,
	output reg [23:0] termoCode );

	reg [7:0] previousKeyCode;
	reg toAssignValue;
	always@(posedge clk)
	begin
		if(newKey)
		begin
			if(|(previousKeyCode ^ 8'b11110000))
			begin
				case(keyCode)
					18: termoCode[0] 	<= 1;	// Shift L
					97: termoCode[0] 	<= 1;	// > <
					28: termoCode[1] 	<= 1;	// A
					26: termoCode[2] 	<= 1;	// Z
					27: termoCode[3] 	<= 1;	// S
					34: termoCode[4] 	<= 1;	// X
					35: termoCode[5] 	<= 1;	// D
					33: termoCode[6] 	<= 1;	// C
					43: termoCode[7] 	<= 1;	// F
					42: termoCode[8] 	<= 1;	// V
					52: termoCode[9] 	<= 1;	// G
					50: termoCode[10] <= 1;	// B
					51: termoCode[11] <= 1;	// H
					49: termoCode[12] <= 1;	// N
					59: termoCode[13] <= 1;	// J
					58: termoCode[14] <= 1;	// M
					66: termoCode[15] <= 1;	// K
					65: termoCode[16] <= 1;	// , ;
					75: termoCode[17] <= 1;	// L
					73: termoCode[18] <= 1;	// . :
					76: termoCode[19] <= 1;	// Ñ
					74: termoCode[20] <= 1;	// - _
					82: termoCode[21] <= 1;	// { [
					89: termoCode[22] <= 1;	// Shift R
					90: termoCode[23] <= 1;	// Enter
					41: termoCode <= 0;		// Space
				endcase
			end else begin
				case(keyCode)
					18: termoCode[0] 	<= 0;	// Shift L
					97: termoCode[0] 	<= 0;	// > <
					28: termoCode[1] 	<= 0;	// A
					26: termoCode[2] 	<= 0;	// Z
					27: termoCode[3] 	<= 0;	// S
					34: termoCode[4] 	<= 0;	// X
					35: termoCode[5] 	<= 0;	// D
					33: termoCode[6] 	<= 0;	// C
					43: termoCode[7] 	<= 0;	// F
					42: termoCode[8] 	<= 0;	// V
					52: termoCode[9] 	<= 0;	// G
					50: termoCode[10] <= 0;	// B
					51: termoCode[11] <= 0;	// H
					49: termoCode[12] <= 0;	// N
					59: termoCode[13] <= 0;	// J
					58: termoCode[14] <= 0;	// M
					66: termoCode[15] <= 0;	// K
					65: termoCode[16] <= 0;	// , ;
					75: termoCode[17] <= 0;	// L
					73: termoCode[18] <= 0;	// . :
					76: termoCode[19] <= 0;	// Ñ
					74: termoCode[20] <= 0;	// - _
					82: termoCode[21] <= 0;	// { [
					89: termoCode[22] <= 0;	// Shift R
					90: termoCode[23] <= 0;	// Enter
					41: termoCode <= 0;		// Space
				endcase
			end
			previousKeyCode <= keyCode;
		end
		
		if(reset)
		begin
			previousKeyCode <= 0;
			termoCode <= 0;
		end
		
	end

endmodule
