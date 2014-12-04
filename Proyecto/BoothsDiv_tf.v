`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:24:37 11/07/2014
// Design Name:   BoothsMult
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/BoothsMult_tf.v
// Project Name:  Intento1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BoothsMult
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BoothsDiv_tf;

	
	localparam integer bits = 15;
	localparam integer aBits = bits;
	localparam integer bBits = bits - 1;

	// Inputs
	reg clk;
	reg signed [aBits:0] a;
	reg signed [bBits:0] b;

	// Outputs
	wire signed [aBits:0] quotient;
	wire signed [bBits:0] remainder;

	// Instantiate the Unit Under Test (UUT)
	BoothsDiv #(bits) uut (
		.a(a), 
		.b(b), 
		.quotient(quotient),
		.remainder(remainder)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
	
	always @(posedge clk)
	begin
		a <= a + 1;
		if(a == 0) b <= b + 1;
	end
	
	always @(negedge clk)
	begin
		if(a/b != quotient | a - (a/b)*b != remainder) $display("Error div: %d / %d != %d , %d",a,b,quotient, remainder);
	end
	
	always #2 clk = ~clk;
      
endmodule

