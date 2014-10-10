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
		output reg [3:0] an,		// 7 segment selector
		output reg [7:0] PIO
    );
	
	 wire [6:0] seg_wire;
	 
	 wire enable;
	 assign enable = sw[7];
	 
	 wire wave_btn, wave_btn_deb;
	 assign wave_btn = btn[0];
	 
	 wire [1:0] wave;
	 wire [7:0] index;
	 wire [7:0] outValue;
	 
	 wire [1:0] freq;
	 assign freq = sw[1:0];
	 
	 wire clk;
	 
	 Debouncer boton(mclk, enable, wave_btn, wave_btn_deb);
	 
	 count_2 count_freq(wave_btn_deb, enable, wave);
	 
	 seven_seg segmentos(wave, seg_wire);
	 
	 ReClock clock_mgmt(mclk, enable, freq, clk);
	 
	 count_1 count_index(clk, enable, index);
	 
	 Functions waves(wave, index, outValue);


	 wire [7:0] Led_wire;
	 LEDs_mgmt leds(outValue, Led_wire);
	 
	 always @(posedge mclk)
	 begin
		// Seven seg config
		an = 4'b1110;
		dp = 1;
		
		Led = Led_wire;
	
		seg = seg_wire;
		
		PIO = {outValue[0], outValue[1], outValue[2], outValue[3], outValue[4], outValue[5], outValue[6], outValue[7]};
	 end
	
endmodule
