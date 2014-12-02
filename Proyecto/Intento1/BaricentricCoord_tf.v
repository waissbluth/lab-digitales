`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:51:04 11/09/2014
// Design Name:   BaricentricCoords
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/BaricentricCoord_tf.v
// Project Name:  Intento1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BaricentricCoords
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BaricentricCoord_tf;

	parameter evalBits = 10;
	parameter intBits = 10;
	parameter decimalBits = 3;

	// Inputs
	reg [(intBits):0] x_0;
	reg [(intBits):0] y_0;
	reg [(intBits):0] x_1;
	reg [(intBits):0] y_1;
	reg [(intBits):0] x_2;
	reg [(intBits):0] y_2;
	reg [(evalBits - 1):0] evalX;
	reg [(evalBits - 1):0] evalY;
	reg clk;

	// Outputs
	wire [(intBits + decimalBits):0] lambda_0;
	wire [(intBits + decimalBits):0] lambda_1;
	wire [(intBits + decimalBits):0] lambda_2;
	wire inTris;

	// Instantiate the Unit Under Test (UUT)
	BaricentricCoords #(evalBits, intBits, decimalBits) uut (
		.x_0(x_0), 
		.y_0(y_0), 
		.x_1(x_1), 
		.y_1(y_1), 
		.x_2(x_2), 
		.y_2(y_2), 
		.evalX(evalX), 
		.evalY(evalY), 
		.lambda_0(lambda_0), 
		.lambda_1(lambda_1), 
		.lambda_2(lambda_2), 
		.inTris(inTris)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		x_0 = 10;
		y_0 = 10;
		x_1 = 20;
		y_1 = 10;
		x_2 = 10;
		y_2 = 20;
		evalX = 0;
		evalY = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	
	always @(posedge clk)
	begin
			evalX <= evalX + 1;
			if(evalX == 640)
			begin
				evalX <= 0;
				evalY <= evalY + 1;
			end
			
			if(evalY == 480) evalY <= 0;
			
	end
	
	always #1 clk = ~clk;
      
endmodule

