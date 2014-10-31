`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:52:38 10/20/2014
// Design Name:   Ps2Signals
// Module Name:   E:/Yo/Documents/U/10sem/Lab digitales/Repo/Experiencia_5/Modulos_Bozzo/Exp5/Ps2Signals_tf.v
// Project Name:  Exp5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ps2Signals
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ps2Signals_tf;

	// Inputs
	reg clk;
	reg ps2c;
	reg ps2d;

	// Outputs
	wire dataEnable;
	wire [7:0] data;
	wire [7:0] testData;
	assign testData = 8'b1010_0101;

	// Instantiate the Unit Under Test (UUT)
	Ps2Signals uut (
		.clk(clk), 
		.ps2c(ps2c), 
		.ps2d(ps2d), 
		.dataEnable(dataEnable), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ps2c = 1;
		ps2d = 0;

		// Wait 100 ns for global reset to finish
		
		// Add stimulus here
		#100;
		ps2c = 1;
		#100; //StartBit
		ps2c = 0;
		ps2d = 0;
		
		#100;
		ps2c = 1;
		#100; //0
		ps2c = 0;
		ps2d = testData[0];
		
		#100;
		ps2c = 1;
		#100; //1
		ps2c = 0;
		ps2d = testData[1];

		#100;
		ps2c = 1;
		#100; //2
		ps2c = 0;
		ps2d = testData[2];
		
		#100;
		ps2c = 1;
		#100; //3
		ps2c = 0;
		ps2d = testData[3];
		
		#100;
		ps2c = 1;
		#100; //4
		ps2c = 0;
		ps2d = testData[4];
		
		#100;
		ps2c = 1;
		#100; //5
		ps2c = 0;
		ps2d = testData[5];
		
		#100;
		ps2c = 1;
		#100; //6
		ps2c = 0;
		ps2d = testData[6];
		
		#100;
		ps2c = 1;
		#100; //7
		ps2c = 0;
		ps2d = testData[7];
		
		#100;
		ps2c = 1;
		#100; //parity
		ps2c = 0;
		ps2d = 1;
		
		#100;
		ps2c = 1;
		#100; //StartBit
		ps2c = 0;
		ps2d = 0;
		
		#100;
		ps2c = 1;
		#100; //0
		ps2c = 0;
		ps2d = !testData[0];
		
		#100;
		ps2c = 1;
		#100; //1
		ps2c = 0;
		ps2d = !testData[1];

		#100;
		ps2c = 1;
		#100; //2
		ps2c = 0;
		ps2d = !testData[2];
		
		#100;
		ps2c = 1;
		#100; //3
		ps2c = 0;
		ps2d = !testData[3];
		
		#100;
		ps2c = 1;
		#100; //4
		ps2c = 0;
		ps2d = !testData[4];
		
		#100;
		ps2c = 1;
		#100; //5
		ps2c = 0;
		ps2d = !testData[5];
		
		#100;
		ps2c = 1;
		#100; //6
		ps2c = 0;
		ps2d = !testData[6];
		
		#100;
		ps2c = 1;
		#100; //7
		ps2c = 0;
		ps2d = !testData[7];
		
		#100;
		ps2c = 1;
		#100; //parity
		ps2c = 0;
		ps2d = 1;
		

	end
	
	always
		#5 clk <= !clk;
      
endmodule

