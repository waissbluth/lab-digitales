`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:23:58 09/23/2014
// Design Name:   LEDs_mgmt
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_3/Modulos_Waissbluth/modulos/LEDs_mgmt_tf.v
// Project Name:  modulos
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LEDs_mgmt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LEDs_mgmt_tf;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	LEDs_mgmt uut (
		.in(in), 
		.out(out)
	);

	initial begin
		in = 0;
	end
		
	always begin
		#1  in = in + 1;
	end
      
endmodule

