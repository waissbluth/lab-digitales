`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:41:27 11/01/2014
// Design Name:   sin_wave
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_5/sin_wave_tf.v
// Project Name:  Exp5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sin_wave
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sin_wave_tf;

	// Inputs
	reg clk;
	reg [8:0] count;

	// Outputs
	wire [8:0] val;

	// Instantiate the Unit Under Test (UUT)
	sin_wave uut (
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
		
	always
	begin
		#1  clk = ~clk;
		#1  count = count + 1;
	end
      
endmodule

