`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:57:16 11/15/2014
// Design Name:   ApplyMat
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Proyecto/Intento1/ApplyMat_tf.v
// Project Name:  Intento1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ApplyMat
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ApplyMat_tf;

	localparam intBits = 4;
	localparam decimalBits = 8;
	
	localparam one = 2**decimalBits;

	// Inputs
	reg clk;
	reg reset;
	reg [(intBits + decimalBits):0] inVec_x;
	reg [(intBits + decimalBits):0] inVec_y;
	reg [(intBits + decimalBits):0] inVec_z;
	reg [(intBits + decimalBits):0] m_00;
	reg [(intBits + decimalBits):0] m_01;
	reg [(intBits + decimalBits):0] m_02;
	reg [(intBits + decimalBits):0] m_10;
	reg [(intBits + decimalBits):0] m_11;
	reg [(intBits + decimalBits):0] m_12;
	reg [(intBits + decimalBits):0] m_20;
	reg [(intBits + decimalBits):0] m_21;
	reg [(intBits + decimalBits):0] m_22;
	reg inputEnable;

	// Outputs
	wire [(intBits + decimalBits):0] outVec_x;
	wire [(intBits + decimalBits):0] outVec_y;
	wire [(intBits + decimalBits):0] outVec_z;
	wire outputEnable;

	// Instantiate the Unit Under Test (UUT)
	ApplyMat #(intBits, decimalBits) uut (
		.clk(clk), 
		.reset(reset), 
		.inVec_x(inVec_x), 
		.inVec_y(inVec_y), 
		.inVec_z(inVec_z), 
		.m_00(m_00), 
		.m_01(m_01), 
		.m_02(m_02), 
		.m_10(m_10), 
		.m_11(m_11), 
		.m_12(m_12), 
		.m_20(m_20), 
		.m_21(m_21), 
		.m_22(m_22), 
		.inputEnable(inputEnable), 
		.outVec_x(outVec_x), 
		.outVec_y(outVec_y), 
		.outVec_z(outVec_z), 
		.outputEnable(outputEnable)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		inVec_x = 404;
		inVec_y = 33;
		inVec_z = 1;
		m_00 = one;
		m_01 = 0;
		m_02 = 0;
		m_10 = 0;
		m_11 = one;
		m_12 = 0;
		m_20 = 0;
		m_21 = 0;
		m_22 = one;
		inputEnable = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		inputEnable = 1;
		#2;
		inputEnable = 0;
        
		// Add stimulus here

	end
	
	always #1 clk = ~clk;
      
endmodule

