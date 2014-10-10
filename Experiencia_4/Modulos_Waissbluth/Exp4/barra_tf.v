`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:44:32 10/09/2014
// Design Name:   barra
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_4/Modulos_Waissbluth/Exp4/barra_tf.v
// Project Name:  Exp4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barra
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module barra_tf;

	// Inputs
	reg clk;
	reg reset;
	reg up;
	reg down;

	// Outputs
	wire [9:0] y;

	// Instantiate the Unit Under Test (UUT)
	barra uut (
		.clk(clk), 
		.reset(reset), 
		.up(up), 
		.down(down), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		up = 0;
		down = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		up = 1;
		
		#10;
		
		down = 1;
		
		#5;
		
		up = 0;
		
		#500;
		
		down = 0;
		
		#10
		
		reset = 1;
		
		#10
		reset = 0;
		up = 1;
		

	end
	
	always
	#1  clk = ~clk;
      
endmodule

