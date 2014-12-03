`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:16:42 12/02/2014
// Design Name:   ClockRatio
// Module Name:   Z:/Desktop/LabDigitales/Proyecto/ClockRatio_tf.v
// Project Name:  Proyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ClockRatio
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ClockRatio_tf;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire outClk;

	// Instantiate the Unit Under Test (UUT)
	ClockRatio #(50_000_000, 10)uut (
		.clk(clk), 
		.reset(reset),
		.outClk(outClk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		reset = 1;
		# 100
		reset = 0;

	end
	
	always
	  #1 clk = ~clk;
      
endmodule

