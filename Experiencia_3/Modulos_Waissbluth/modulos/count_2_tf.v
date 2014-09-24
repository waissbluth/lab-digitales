`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:20:02 09/23/2014
// Design Name:   count_2
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_3/Modulos_Waissbluth/modulos/count_2_tf.v
// Project Name:  modulos
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: count_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module count_2_tf;

	// Inputs
	reg clk;
	reg enable;

	// Outputs
	wire [0:1] q;

	// Instantiate the Unit Under Test (UUT)
	count_2 uut (
		.clk(clk), 
		.enable(enable), 
		.q(q)
	);

	initial begin
		clk = 0;
		enable = 0;
		
		#10
		enable = 1;
		
		#100
		enable = 0;
		
	end
		
	always begin
		#1  clk = ~clk;

	end
      
endmodule

