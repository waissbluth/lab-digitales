`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:38:03 09/24/2014
// Design Name:   Functions
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_3/Modulos_Bozzo/Mods/Functions_tf.v
// Project Name:  ModsBozzo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Functions
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Functions_tf;

	reg CLK;
	reg reset;
	
	// Inputs
	reg [1:0] f;
	wire [7:0] count;

	// Outputs
	wire [7:0] value;

	wire loop;
	
	
	
	Counter #(8) indexer (CLK, 1'b1, reset, count, loop);

	// Instantiate the Unit Under Test (UUT)
	Functions uut (
		.f(f), 
		.index(count), 
		.value(value)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		f = 2;
		reset = 1;
		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
        
		// Add stimulus here

	end
	
	always
	 #5 CLK = ~CLK;
      
endmodule

