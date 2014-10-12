`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:18:26 10/10/2014
// Design Name:   pong
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_4/Modulos_Waissbluth/Exp4/Pong_tf.v
// Project Name:  Exp4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pong
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pong_tf;

	// Inputs
	reg mclk;
	reg [7:0] sw;
	reg [3:0] btn;

	// Outputs
	wire [7:0] Led;
	wire HSYNC;
	wire VSYNC;
	wire [2:0] OutRed;
	wire [2:0] OutGreen;
	wire [2:0] OutBlue;

	// Instantiate the Unit Under Test (UUT)
	pong uut (
		.mclk(mclk), 
		.sw(sw), 
		.btn(btn), 
		.Led(Led), 
		.HSYNC(HSYNC), 
		.VSYNC(VSYNC), 
		.OutRed(OutRed), 
		.OutGreen(OutGreen), 
		.OutBlue(OutBlue)
	);

	initial begin
		// Initialize Inputs
		mclk = 0;
		sw = 0;
		btn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		btn[0] = 1;
		
		#10;
		btn[0] = 0;
		btn[1] = 1;

		#10;
		btn[1] = 0;

	end
	
	always
	#5 mclk = ~mclk;
      
endmodule

