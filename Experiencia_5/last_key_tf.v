`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:03:11 11/05/2014
// Design Name:   last_key
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_5/last_key_tf.v
// Project Name:  Exp5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: last_key
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module last_key_tf;

	// Inputs
	reg clk;
	reg [23:0] keys;

	// Outputs
	wire [4:0] key;
	wire press;

	// Instantiate the Unit Under Test (UUT)
	last_key uut (
		.clk(clk), 
		.keys(keys), 
		.key(key),
		.press(press)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		keys = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		keys = 24'b 000000_000000_000000_000000;
		
		#10;
		keys = 24'b 000000_000000_000000_000001;
		
		#10;
		keys = 24'b 000000_000000_000000_010001;
		
		#10;
		keys = 24'b 000000_000000_000000_000011;
		
		#10;
		keys = 24'b 100000_000000_000000_000000;
		
		#10;
		keys = 24'b 000000_000000_000000_000000;

	end
	
	always
	#1 clk = ~clk;
      
endmodule

