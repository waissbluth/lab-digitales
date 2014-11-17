`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:21:46 11/15/2014
// Design Name:   RotationZYXMat
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/RotationZYXMat_tf.v
// Project Name:  Intento1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RotationZYXMat
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RotationZYXMat_tf;

	localparam decimalBits = 8;

	localparam integer pi_2 = 3.14159265359 * 2**(decimalBits - 1);

	// Inputs
	reg clk;
	reg reset;
	reg [(decimalBits + 2):0] rot_x;
	reg [(decimalBits + 2):0] rot_y;
	reg [(decimalBits + 2):0] rot_z;
	reg inputEnable;

	// Outputs
	wire [(decimalBits + 1):0] m_00;
	wire [(decimalBits + 1):0] m_01;
	wire [(decimalBits + 1):0] m_02;
	wire [(decimalBits + 1):0] m_10;
	wire [(decimalBits + 1):0] m_11;
	wire [(decimalBits + 1):0] m_12;
	wire [(decimalBits + 1):0] m_20;
	wire [(decimalBits + 1):0] m_21;
	wire [(decimalBits + 1):0] m_22;
	wire outputEnable;

	// Instantiate the Unit Under Test (UUT)
	RotationZYXMat #(decimalBits) uut (
		.clk(clk), 
		.reset(reset), 
		.rot_x(rot_x), 
		.rot_y(rot_y), 
		.rot_z(rot_z), 
		.inputEnable(inputEnable), 
		.m_00(m_00), 
		.m_01(m_01), 
		.m_02(m_02), 
		.m_10(m_10), 
		.m_11(m_11), 
		.m_12(m_12), 
		.m_20(m_20), 
		.m_21(m_21), 
		.m_22(m_22), 
		.outputEnable(outputEnable)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rot_x = pi_2;
		rot_y = 0;
		rot_z = 0;
		inputEnable = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		reset = 1;
		#1;
		reset = 0;
		inputEnable = 1;
		#4;
		inputEnable = 0;
        
	end
	
	always #1 clk = ~clk;
      
endmodule

