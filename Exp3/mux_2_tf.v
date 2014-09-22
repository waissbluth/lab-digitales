`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:27:18 09/22/2014
// Design Name:   mux_2
// Module Name:   W:/Desktop/LabDigitales/Exp3/mux_2_tf.v
// Project Name:  Exp3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_2_tf;

	// Inputs
	reg [0:7] in_0;
	reg [0:7] in_1;
	reg [0:7] in_2;
	reg [0:7] in_3;
	reg [0:1] sel;

	// Outputs
	wire [0:7] out;

	// Instantiate the Unit Under Test (UUT)
	mux_2 uut (
		.in_0(in_0), 
		.in_1(in_1), 
		.in_2(in_2), 
		.in_3(in_3), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in_0 = 0;
		in_1 = 1;
		in_2 = 2;
		in_3 = 3;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel = 2'b01;
		
		#100;
		
		sel = 2'b10;
		
		#100;
		
		sel = 2'b11;
		
	end
      
endmodule

