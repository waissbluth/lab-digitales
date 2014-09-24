`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:02:26 09/23/2014
// Design Name:   count_1
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_3/Modulos_Waissbluth/modulos/count_1_tf.v
// Project Name:  modulos
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: count_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module count_1_tf;

	// Inputs
	reg clk;
	reg enable;

	// Outputs
	wire [7:0] q;

	// Instantiate the Unit Under Test (UUT)
	count_1 uut (
		.clk(clk), 
		.enable(enable), 
		.q(q)
	);
	
	initial begin
		clk = 0;
		enable = 0;
		
		#100
		enable = 1;
		
		#1000
		enable = 0;
		
	end
		
	always begin
		#1  clk = ~clk;
	
	end
      
endmodule

