`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: John Debouncy
// Engineer: Juan Andr�s Bozzo 
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
		
		reg [7:0] sine;
		
	always @(*)
	begin
		case(index)
			8'b00000000: sine = 8'b10000000;
			8'b00000001: sine = 8'b10000011;
			8'b00000010: sine = 8'b10000110;
			8'b00000011: sine = 8'b10001001;
			8'b00000100: sine = 8'b10001100;
			8'b00000101: sine = 8'b10001111;
			8'b00000110: sine = 8'b10010010;
			8'b00000111: sine = 8'b10010101;
			8'b00001000: sine = 8'b10011001;
			8'b00001001: sine = 8'b10011100;
			8'b00001010: sine = 8'b10011111;
			8'b00001011: sine = 8'b10100010;
			8'b00001100: sine = 8'b10100101;
			8'b00001101: sine = 8'b10101000;
			8'b00001110: sine = 8'b10101011;
			8'b00001111: sine = 8'b10101110;
			8'b00010000: sine = 8'b10110001;
			8'b00010001: sine = 8'b10110100;
			8'b00010010: sine = 8'b10110110;
			8'b00010011: sine = 8'b10111001;
			8'b00010100: sine = 8'b10111100;
			8'b00010101: sine = 8'b10111111;
			8'b00010110: sine = 8'b11000010;
			8'b00010111: sine = 8'b11000100;
			8'b00011000: sine = 8'b11000111;
			8'b00011001: sine = 8'b11001001;
			8'b00011010: sine = 8'b11001100;
			8'b00011011: sine = 8'b11001111;
			8'b00011100: sine = 8'b11010001;
			8'b00011101: sine = 8'b11010011;
			8'b00011110: sine = 8'b11010110;
			8'b00011111: sine = 8'b11011000;
			8'b00100000: sine = 8'b11011010;
			8'b00100001: sine = 8'b11011100;
			8'b00100010: sine = 8'b11011111;
			8'b00100011: sine = 8'b11100001;
			8'b00100100: sine = 8'b11100011;
			8'b00100101: sine = 8'b11100101;
			8'b00100110: sine = 8'b11100111;
			8'b00100111: sine = 8'b11101000;
			8'b00101000: sine = 8'b11101010;
			8'b00101001: sine = 8'b11101100;
			8'b00101010: sine = 8'b11101110;
			8'b00101011: sine = 8'b11101111;
			8'b00101100: sine = 8'b11110001;
			8'b00101101: sine = 8'b11110010;
			8'b00101110: sine = 8'b11110011;
			8'b00101111: sine = 8'b11110101;
			8'b00110000: sine = 8'b11110110;
			8'b00110001: sine = 8'b11110111;
			8'b00110010: sine = 8'b11111000;
			8'b00110011: sine = 8'b11111001;
			8'b00110100: sine = 8'b11111010;
			8'b00110101: sine = 8'b11111011;
			8'b00110110: sine = 8'b11111100;
			8'b00110111: sine = 8'b11111101;
			8'b00111000: sine = 8'b11111101;
			8'b00111001: sine = 8'b11111110;
			8'b00111010: sine = 8'b11111110;
			8'b00111011: sine = 8'b11111111;
			8'b00111100: sine = 8'b11111111;
			8'b00111101: sine = 8'b11111111;
			8'b00111110: sine = 8'b11111111;
			8'b00111111: sine = 8'b11111111;
			8'b01000000: sine = 8'b11111111;
			8'b01000001: sine = 8'b11111111;
			8'b01000010: sine = 8'b11111111;
			8'b01000011: sine = 8'b11111111;
			8'b01000100: sine = 8'b11111111;
			8'b01000101: sine = 8'b11111110;
			8'b01000110: sine = 8'b11111110;
			8'b01000111: sine = 8'b11111101;
			8'b01001000: sine = 8'b11111101;
			8'b01001001: sine = 8'b11111100;
			8'b01001010: sine = 8'b11111011;
			8'b01001011: sine = 8'b11111011;
			8'b01001100: sine = 8'b11111010;
			8'b01001101: sine = 8'b11111001;
			8'b01001110: sine = 8'b11111000;
			8'b01001111: sine = 8'b11110111;
			8'b01010000: sine = 8'b11110101;
			8'b01010001: sine = 8'b11110100;
			8'b01010010: sine = 8'b11110011;
			8'b01010011: sine = 8'b11110001;
			8'b01010100: sine = 8'b11110000;
			8'b01010101: sine = 8'b11101110;
			8'b01010110: sine = 8'b11101101;
			8'b01010111: sine = 8'b11101011;
			8'b01011000: sine = 8'b11101001;
			8'b01011001: sine = 8'b11101000;
			8'b01011010: sine = 8'b11100110;
			8'b01011011: sine = 8'b11100100;
			8'b01011100: sine = 8'b11100010;
			8'b01011101: sine = 8'b11100000;
			8'b01011110: sine = 8'b11011110;
			8'b01011111: sine = 8'b11011011;
			8'b01100000: sine = 8'b11011001;
			8'b01100001: sine = 8'b11010111;
			8'b01100010: sine = 8'b11010101;
			8'b01100011: sine = 8'b11010010;
			8'b01100100: sine = 8'b11010000;
			8'b01100101: sine = 8'b11001101;
			8'b01100110: sine = 8'b11001011;
			8'b01100111: sine = 8'b11001000;
			8'b01101000: sine = 8'b11000110;
			8'b01101001: sine = 8'b11000011;
			8'b01101010: sine = 8'b11000000;
			8'b01101011: sine = 8'b10111101;
			8'b01101100: sine = 8'b10111011;
			8'b01101101: sine = 8'b10111000;
			8'b01101110: sine = 8'b10110101;
			8'b01101111: sine = 8'b10110010;
			8'b01110000: sine = 8'b10101111;
			8'b01110001: sine = 8'b10101100;
			8'b01110010: sine = 8'b10101001;
			8'b01110011: sine = 8'b10100110;
			8'b01110100: sine = 8'b10100011;
			8'b01110101: sine = 8'b10100000;
			8'b01110110: sine = 8'b10011101;
			8'b01110111: sine = 8'b10011010;
			8'b01111000: sine = 8'b10010111;
			8'b01111001: sine = 8'b10010100;
			8'b01111010: sine = 8'b10010001;
			8'b01111011: sine = 8'b10001110;
			8'b01111100: sine = 8'b10001011;
			8'b01111101: sine = 8'b10000111;
			8'b01111110: sine = 8'b10000100;
			8'b01111111: sine = 8'b10000001;
			8'b10000000: sine = 8'b01111110;
			8'b10000001: sine = 8'b01111011;
			8'b10000010: sine = 8'b01111000;
			8'b10000011: sine = 8'b01110100;
			8'b10000100: sine = 8'b01110001;
			8'b10000101: sine = 8'b01101110;
			8'b10000110: sine = 8'b01101011;
			8'b10000111: sine = 8'b01101000;
			8'b10001000: sine = 8'b01100101;
			8'b10001001: sine = 8'b01100010;
			8'b10001010: sine = 8'b01011111;
			8'b10001011: sine = 8'b01011100;
			8'b10001100: sine = 8'b01011001;
			8'b10001101: sine = 8'b01010110;
			8'b10001110: sine = 8'b01010011;
			8'b10001111: sine = 8'b01010000;
			8'b10010000: sine = 8'b01001101;
			8'b10010001: sine = 8'b01001010;
			8'b10010010: sine = 8'b01000111;
			8'b10010011: sine = 8'b01000100;
			8'b10010100: sine = 8'b01000010;
			8'b10010101: sine = 8'b00111111;
			8'b10010110: sine = 8'b00111100;
			8'b10010111: sine = 8'b00111001;
			8'b10011000: sine = 8'b00110111;
			8'b10011001: sine = 8'b00110100;
			8'b10011010: sine = 8'b00110010;
			8'b10011011: sine = 8'b00101111;
			8'b10011100: sine = 8'b00101101;
			8'b10011101: sine = 8'b00101010;
			8'b10011110: sine = 8'b00101000;
			8'b10011111: sine = 8'b00100110;
			8'b10100000: sine = 8'b00100100;
			8'b10100001: sine = 8'b00100001;
			8'b10100010: sine = 8'b00011111;
			8'b10100011: sine = 8'b00011101;
			8'b10100100: sine = 8'b00011011;
			8'b10100101: sine = 8'b00011001;
			8'b10100110: sine = 8'b00010111;
			8'b10100111: sine = 8'b00010110;
			8'b10101000: sine = 8'b00010100;
			8'b10101001: sine = 8'b00010010;
			8'b10101010: sine = 8'b00010001;
			8'b10101011: sine = 8'b00001111;
			8'b10101100: sine = 8'b00001110;
			8'b10101101: sine = 8'b00001100;
			8'b10101110: sine = 8'b00001011;
			8'b10101111: sine = 8'b00001010;
			8'b10110000: sine = 8'b00001000;
			8'b10110001: sine = 8'b00000111;
			8'b10110010: sine = 8'b00000110;
			8'b10110011: sine = 8'b00000101;
			8'b10110100: sine = 8'b00000100;
			8'b10110101: sine = 8'b00000100;
			8'b10110110: sine = 8'b00000011;
			8'b10110111: sine = 8'b00000010;
			8'b10111000: sine = 8'b00000010;
			8'b10111001: sine = 8'b00000001;
			8'b10111010: sine = 8'b00000001;
			8'b10111011: sine = 8'b00000000;
			8'b10111100: sine = 8'b00000000;
			8'b10111101: sine = 8'b00000000;
			8'b10111110: sine = 8'b00000000;
			8'b10111111: sine = 8'b00000000;
			8'b11000000: sine = 8'b00000000;
			8'b11000001: sine = 8'b00000000;
			8'b11000010: sine = 8'b00000000;
			8'b11000011: sine = 8'b00000000;
			8'b11000100: sine = 8'b00000000;
			8'b11000101: sine = 8'b00000001;
			8'b11000110: sine = 8'b00000001;
			8'b11000111: sine = 8'b00000010;
			8'b11001000: sine = 8'b00000010;
			8'b11001001: sine = 8'b00000011;
			8'b11001010: sine = 8'b00000100;
			8'b11001011: sine = 8'b00000101;
			8'b11001100: sine = 8'b00000110;
			8'b11001101: sine = 8'b00000111;
			8'b11001110: sine = 8'b00001000;
			8'b11001111: sine = 8'b00001001;
			8'b11010000: sine = 8'b00001010;
			8'b11010001: sine = 8'b00001100;
			8'b11010010: sine = 8'b00001101;
			8'b11010011: sine = 8'b00001110;
			8'b11010100: sine = 8'b00010000;
			8'b11010101: sine = 8'b00010001;
			8'b11010110: sine = 8'b00010011;
			8'b11010111: sine = 8'b00010101;
			8'b11011000: sine = 8'b00010111;
			8'b11011001: sine = 8'b00011000;
			8'b11011010: sine = 8'b00011010;
			8'b11011011: sine = 8'b00011100;
			8'b11011100: sine = 8'b00011110;
			8'b11011101: sine = 8'b00100000;
			8'b11011110: sine = 8'b00100011;
			8'b11011111: sine = 8'b00100101;
			8'b11100000: sine = 8'b00100111;
			8'b11100001: sine = 8'b00101001;
			8'b11100010: sine = 8'b00101100;
			8'b11100011: sine = 8'b00101110;
			8'b11100100: sine = 8'b00110000;
			8'b11100101: sine = 8'b00110011;
			8'b11100110: sine = 8'b00110110;
			8'b11100111: sine = 8'b00111000;
			8'b11101000: sine = 8'b00111011;
			8'b11101001: sine = 8'b00111101;
			8'b11101010: sine = 8'b01000000;
			8'b11101011: sine = 8'b01000011;
			8'b11101100: sine = 8'b01000110;
			8'b11101101: sine = 8'b01001001;
			8'b11101110: sine = 8'b01001011;
			8'b11101111: sine = 8'b01001110;
			8'b11110000: sine = 8'b01010001;
			8'b11110001: sine = 8'b01010100;
			8'b11110010: sine = 8'b01010111;
			8'b11110011: sine = 8'b01011010;
			8'b11110100: sine = 8'b01011101;
			8'b11110101: sine = 8'b01100000;
			8'b11110110: sine = 8'b01100011;
			8'b11110111: sine = 8'b01100110;
			8'b11111000: sine = 8'b01101010;
			8'b11111001: sine = 8'b01101101;
			8'b11111010: sine = 8'b01110000;
			8'b11111011: sine = 8'b01110011;
			8'b11111100: sine = 8'b01110110;
			8'b11111101: sine = 8'b01111001;
			8'b11111110: sine = 8'b01111100;
			8'b11111111: sine = 8'b01111111;
		endcase
	
		case(f)
			2'b01 : value = {8{index[7]}};
			2'b10 : value = index[7] ? 8'b1111_1111 - {index[6:0], 1'b0} : {index[6:0], 1'b0};
			2'b11 : value = sine;
			default value = 8'b0000_0000;
		endcase
	end


endmodule