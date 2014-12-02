`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:37:48 11/09/2014
// Design Name:   Cosine
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/Cosine_tf.v
// Project Name:  Intento1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Cosine_tf;

	localparam intBits = 4;
	localparam decimalBits = 8;

	// Inputs
	reg [(intBits + decimalBits):0] x;
	reg clk;

	// Outputs
	wire [(1 + decimalBits):0] y;

	// Instantiate the Unit Under Test (UUT)
	Cosine #(intBits, decimalBits) uut
	(
		.x(x), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		clk = 0;
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
	
	wire [(intBits + decimalBits - 1):0] xValue;
	wire [decimalBits:0] yValue;
	wire xSign, ySign;
	
	FromTwosComplement #(intBits + decimalBits) xTwos (x, xSign, xValue);
	FromTwosComplement #(1 + decimalBits) yTwos (y, ySign, yValue);
		
	always #1 clk = !clk;
	
	always @(posedge clk)
	begin
		if(xSign & ySign) $display("Cos(-%f) = -%f", (xValue + 0.0)/(2**decimalBits), (yValue + 0.0)/(2**decimalBits));
		if(!xSign & ySign) $display("Cos(%f) = -%f", (xValue + 0.0)/(2**decimalBits), (yValue + 0.0)/(2**decimalBits));
		if(xSign & !ySign) $display("Cos(-%f) = %f", (xValue + 0.0)/(2**decimalBits), (yValue + 0.0)/(2**decimalBits));
		if(!xSign & !ySign) $display("Cos(%f) = %f", (xValue + 0.0)/(2**decimalBits), (yValue + 0.0)/(2**decimalBits));
		x <= x + 1;
	end
      
endmodule

