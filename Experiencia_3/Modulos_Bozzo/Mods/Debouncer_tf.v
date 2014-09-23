`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:44:53 09/22/2014
// Design Name:   Debouncer
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_3/Modulos_Bozzo/Mods/Debouncer_tf.v
// Project Name:  ModsBozzo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Debouncer_tf;

	// Inputs
	reg CLK;
	reg enable;
	reg in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Debouncer #(4) uut (
		.CLK(CLK), 
		.enable(enable),
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		in = 0;
		enable = 0;

		// Wait 100 ns for global reset to finish
		#100;
		enable = 1;
        
		// Add stimulus here
		in = ~in;
		
		#10 in = ~in;
		#10 in = ~in;
		#10 in = ~in;
		#10 in = ~in;
		#10 in = ~in;
		#10 in = ~in;
		#10 in = ~in;
		#10 in = ~in;
		
	end
	
	always
		#2 CLK = ~CLK;
      
endmodule

