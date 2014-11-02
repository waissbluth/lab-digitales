`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:36:05 11/01/2014
// Design Name:   jump
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_5/jump_tf.v
// Project Name:  Exp5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jump
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jump_tf;

	// Inputs
	reg [4:0] note;

	// Outputs
	wire [5:0] jump;
	wire [26:0] remainder;

	// Instantiate the Unit Under Test (UUT)
	jump uut (
		.note(note), 
		.jump(jump), 
		.remainder(remainder)
	);

	initial begin
		// Initialize Inputs
		note = 0;

		// Wait 100 ns for global reset to finish
		#100;
        

	end
	always
	#1 note = note + 1;
      
endmodule

