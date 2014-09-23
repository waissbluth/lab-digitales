`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:18:34 09/23/2014
// Design Name:   ReClock
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_3/Modulos_Bozzo/Mods/ReClock_tf.v
// Project Name:  ModsBozzo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ReClock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ReClock_tf;

	// Inputs
	reg CLK;
	reg enable;
	reg [1:0] frecuency;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	ReClock uut (
		.CLK(CLK), 
		.enable(enable), 
		.frecuency(frecuency), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		enable = 0;
		frecuency = 0;

		// Wait 100 ns for global reset to finish
		#100;
		enable = 1;
        
		// Add stimulus here
		#200;
		frecuency = 1;
		
		#200;
		frecuency = 2;
		
		#200;
		frecuency = 3;

	end
	
	always
		#1 CLK = ~CLK;
      
endmodule

