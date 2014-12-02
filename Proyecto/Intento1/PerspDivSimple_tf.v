`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:08:45 11/09/2014
// Design Name:   PerspDivSimple
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/PerspDivSimple_tf.v
// Project Name:  Intento1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PerspDivSimple
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PerspDivSimple_tf;

	localparam intBits = 3;
	localparam decimalBits = 3;
	
	// Inputs
	reg clk;
	reg [(intBits + decimalBits):0] x;
	reg [(intBits + decimalBits):0] y;
	reg [(intBits + decimalBits):0] z;

	// Outputs
	wire [(intBits + decimalBits):0] newX;
	wire [(intBits + decimalBits):0] newY;

	// Instantiate the Unit Under Test (UUT)
	PerspDivSimple #(intBits, decimalBits) uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.newX(newX), 
		.newY(newY)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		x = 0;
		y = 0;
		z = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always @(posedge clk)
	begin
		x <= x + 1;
		if(x == 0) y <= y + 1;
		if(y == 0 && x == 0) z <= z + 1;
	end
	
	always #1 clk = ~clk;
      
endmodule

