`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:43:32 09/23/2014 
// Design Name: 
// Module Name:    top_module 
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
module top_module(
		input mclk,
		input [7:0] sw, 			// Switches
		input [4:0] btn,			// Buttons
		output reg [7:0] Led,	// Leds
		output reg [6:0] seg, 	// 7 segment
		output reg dp, 			// 7 segment decimal point
		output reg [3:0] an		// 7 segment selector
    );
	
	 wire [6:0] seg_wire;
	 
	 wire enable;
	 assign enable = sw[7];
	 
	 wire freq_btn, freq_btn_deb;
	 assign freq_btn = btn[0];
	 
	 wire [1:0] freq;
	 
	 Debouncer boton(mclk, enable, freq_btn, freq_btn_deb);
	 
	 count_2 count_freq(freq_btn_deb, enable, freq);
	 
	 seven_seg segmentos(freq, seg_wire);
	 
	 always @(posedge mclk)
	 begin
		// Seven seg config
		an = 4'b1110;
		dp = 1;
		
		
		
		Led = sw;
		seg = seg_wire;
	 end
	
endmodule
