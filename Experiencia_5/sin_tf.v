`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:38:25 11/01/2014
// Design Name:   sin
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_5/sin_tf.v
// Project Name:  Exp5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sin
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sin_tf;

	// Inputs
	reg clk;
	reg [8:0] count;

	// Outputs
	wire [7:0] val;

	// Instantiate the Unit Under Test (UUT)
	sin uut (
		.clk(clk), 
		.count(count), 
		.val(val)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		count = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

