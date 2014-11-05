`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:57:30 11/03/2014
// Design Name:   BinToDec2
// Module Name:   E:/Yo/Documents/U/10sem/Diseno digital/Proyecto/Entrega 2/Filtor/BinToDec.v
// Project Name:  Filtor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BinToDec2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BinToDec;

	// Inputs
	reg [9:0] binary;
	reg clk;

	// Outputs
	wire [3:0] value0;
	wire [3:0] value1;
	wire [3:0] value2;

	// Instantiate the Unit Under Test (UUT)
	BinToDec3 uut (
		.binary(binary), 
		.value0(value0), 
		.value1(value1),
		.value2(value2)
	);

	initial begin
		// Initialize Inputs
		binary = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always @(posedge clk) binary <= binary + 1;
	always #2 clk = !clk;
      
endmodule

