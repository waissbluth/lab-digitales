`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:49:29 10/10/2014
// Design Name:   Burst
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_4/Modulos_Waissbluth/Exp4/Burst_tf.v
// Project Name:  Exp4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Burst
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Burst_tf;

	// Inputs
	reg clk;
	reg bRelease;

	// Outputs
	wire burstClk;

	// Instantiate the Unit Under Test (UUT)
	Burst #(10) uut (
		.clk(clk), 
		.bRelease(bRelease), 
		.burstClk(burstClk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		bRelease = 0;

		// Wait 100 ns for global reset to finish
		#105;
        
		// Add stimulus here
		bRelease = 1;

	end
	
	always
	#5 clk = ~clk;
      
endmodule

