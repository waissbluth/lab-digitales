`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:11:33 10/09/2014
// Design Name:   scores
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_4/Modulos_Waissbluth/Exp4/scores_tf.v
// Project Name:  Exp4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: scores
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module scores_tf;

	// Inputs
	reg clk;
	reg reset;
	reg point1;
	reg point2;

	// Outputs
	wire [2:0] score1;
	wire [2:0] score2;
	wire playing;
	wire winner;

	// Instantiate the Unit Under Test (UUT)
	scores uut (
		.clk(clk), 
		.reset(reset), 
		.point1(point1), 
		.point2(point2), 
		.score1(score1), 
		.score2(score2), 
		.playing(playing), 
		.winner(winner)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		point1 = 0;
		point2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		point1 = 1;

	end
	
	always
	#1  clk = ~clk;
      
endmodule

