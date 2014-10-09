`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:31:59 10/09/2014
// Design Name:   ball
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_4/Modulos_Waissbluth/Exp4/ball_tf.v
// Project Name:  Exp4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ball
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ball_tf;

	// Inputs
	reg clk;
	reg reset;
	reg [9:0] bar_1_y;
	reg [9:0] bar_2_y;

	// Outputs
	wire [10:0] x;
	wire [9:0] y;
	wire point_1;
	wire point_2;

	// Instantiate the Unit Under Test (UUT)
	ball uut (
		.clk(clk), 
		.reset(reset), 
		.bar_1_y(bar_1_y), 
		.bar_2_y(bar_2_y), 
		.x(x), 
		.y(y), 
		.point_1(point_1), 
		.point_2(point_2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		bar_1_y = 0;
		bar_2_y = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
	end
	
	always
	#1  clk = ~clk;
      
endmodule

