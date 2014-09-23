`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:51:24 09/22/2014
// Design Name:   Adder
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_3/Modulos_Bozzo/Mods/Adder_tf.v
// Project Name:  ModsBozzo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Adder_tf;

	parameter pbits = 7;

	// Inputs
	reg [pbits:0] a;
	reg [pbits:0] b;

	// Outputs
	wire [pbits:0] y;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	Adder #(pbits + 1) uut (
		.a(a), 
		.b(b), 
		.y(y), 
		.c_out(c_out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

