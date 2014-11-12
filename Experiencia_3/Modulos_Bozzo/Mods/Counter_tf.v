`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:26:26 09/22/2014
// Design Name:   Counter
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_3/Modulos_Bozzo/Mods/Counter_tf.v
// Project Name:  ModsBozzo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Counter_tf;

	parameter bits = 4;

	// Inputs
	reg CLK;
	reg enable;
	reg reset;

	// Outputs
	wire [(bits - 1):0] count;
	wire overflow;
	
	wire xorTest;
	assign xorTest = ^count;

	// Instantiate the Unit Under Test (UUT)
	Counter #(bits) uut (
		.CLK(CLK), 
		.enable(enable), 
		.reset(reset), 
		.count(count), 
		.overflow(overflow)
	);
	
	initial begin
		// Initialize Inputs
		CLK = 0;
		enable = 1;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 0;
        
		// Add stimulus here

	end
	
	always
		#5 CLK = ~CLK;
      
endmodule

