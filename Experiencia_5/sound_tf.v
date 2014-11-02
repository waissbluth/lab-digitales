`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:03:09 11/01/2014
// Design Name:   sound
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_5/sound_tf.v
// Project Name:  Exp5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sound
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sound_tf;

	// Inputs
	reg clk;
	reg [4:0] note;

	// Outputs
	wire [8:0] value;

	// Instantiate the Unit Under Test (UUT)
	sound uut (
		.clk(clk), 
		.note(note), 
		.value(value)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		note = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
		#1 clk = ~clk;
		#100 note = note + 1;
	end
	
      
endmodule

