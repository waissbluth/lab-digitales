`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:41 11/01/2014 
// Design Name: 
// Module Name:    jump 
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
module jump(
		input [4:0] note,
		output reg [5:0] jump,
		output reg [26:0] remainder
    );

	always @*
	case (note)
		0 : begin
			jump = 16;
			remainder = 74403618;
		end 1 : begin
			jump = 17;
			remainder = 73968838;
		end 2 : begin
			jump = 18;
			remainder = 79454515;
		end 3 : begin
			jump = 19;
			remainder = 91212696;
		end 4 : begin
			jump = 21;
			remainder = 9616364;
		end 5 : begin
			jump = 22;
			remainder = 35060681;
		end 6 : begin
			jump = 23;
			remainder = 67964305;
		end 7 : begin
			jump = 25;
			remainder = 8770790;
		end 8 : begin
			jump = 26;
			remainder = 57950065;
		end 9 : begin
			jump = 28;
			remainder = 16000000;
		end 10 : begin
			jump = 29;
			remainder = 83448074;
		end 11 : begin
			jump = 31;
			remainder = 60853128;
		end 12 : begin
			jump = 33;
			remainder = 48807236;
		end 13 : begin
			jump = 35;
			remainder = 47937677;
		end 14 : begin
			jump = 37;
			remainder = 58909029;
		end 15 : begin
			jump = 39;
			remainder = 82425392;
		end 16 : begin
			jump = 42;
			remainder = 19232728;	
		end 17 : begin
			jump = 44;
			remainder = 70121362;	
		end 18 : begin
			jump = 47;
			remainder = 35928611;
		end 19 : begin
			jump = 50;
			remainder = 17541581;
		end 20 : begin
			jump = 53;
			remainder = 15900129;
		end 21 : begin
			jump = 56;
			remainder = 32000000;
		end 22 : begin
			jump = 59;
			remainder = 66896147;
		end 23 : begin
			jump = 63;
			remainder = 21706256;
		end default : begin
			jump = 0;
			remainder = 0;
		end
	endcase

endmodule