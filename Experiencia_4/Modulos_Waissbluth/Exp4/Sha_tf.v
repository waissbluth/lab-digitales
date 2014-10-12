`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:42:33 10/10/2014
// Design Name:   Sha
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_4/Modulos_Waissbluth/Exp4/Sha_tf.v
// Project Name:  Exp4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sha
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sha_tf;

	// Inputs
	reg inClk;

	// Outputs
	wire outClk;

	// Instantiate the Unit Under Test (UUT)
	Sha uut (
		.inClk(inClk), 
		.outClk(outClk)
	);

	initial begin
		// Initialize Inputs
		inClk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

	always
	#5 inClk = ~inClk;
      
endmodule

