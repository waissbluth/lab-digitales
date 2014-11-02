`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:16:31 11/02/2014
// Design Name:   pwm
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_5/pwm_tf.v
// Project Name:  Exp5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pwm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pwm_tf;

	// Inputs
	reg clk;
	reg [7:0] value;

	// Outputs
	wire pwm;

	// Instantiate the Unit Under Test (UUT)
	pwm uut (
		.clk(clk), 
		.value(value), 
		.pwm(pwm)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		value = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		value = 30;
		
		#16;
		value = 1;
		
		#32;
		value = 15;
		
		#16;
		value = 7;

	end
	
	always
	#1 clk = ~clk;
      
endmodule

