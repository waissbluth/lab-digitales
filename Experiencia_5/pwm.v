`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:00 11/02/2014 
// Design Name: 
// Module Name:    pwm 
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
module pwm(
	input clk, // debe ser de  kHz
	input [8:0] value,
	output reg pwm
    );
	 
	 // Diente de sierra para PWM
	 reg [8:0] count;
	 
	 initial count = 0;
	 
	 always @(posedge clk) begin
		count <= count + 1;
		pwm <= value > count;
	 end


endmodule
