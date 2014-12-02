`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:39:15 11/07/2014
// Design Name:   StaticCounter
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/StaticCounter_tf.v
// Project Name:  Intento1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StaticCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module StaticCounter_tf;

	parameter upTo = 235;

	// Inputs
	reg clk;
	reg enable;
	reg reset;

	// Outputs
	wire [7:0] count;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	StaticCounter #(upTo) uut (
		.clk(clk), 
		.enable(enable), 
		.reset(reset), 
		.count(count), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		enable = 1;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
		reset = 0;
        
		// Add stimulus here

	end
	
	always #2 clk <= !clk;
      
endmodule

