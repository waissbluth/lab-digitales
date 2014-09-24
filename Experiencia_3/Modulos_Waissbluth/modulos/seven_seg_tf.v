`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:39:47 09/23/2014
// Design Name:   seven_seg
// Module Name:   Z:/Desktop/LabDigitales/Experiencia_3/Modulos_Waissbluth/modulos/seven_seg_tf.v
// Project Name:  modulos
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_seg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_seg_tf;

	// Inputs
	reg [1:0] value;

	// Outputs
	wire [6:0] segments;

	// Instantiate the Unit Under Test (UUT)
	seven_seg uut (
		.value(value), 
		.segments(segments)
	);

	initial begin
		// Initialize Inputs
		value = 0;
		#100;
		value = 1;
		#100;
		value = 2;
		#100;
		value = 3;
		#100;
        
		// Add stimulus here

	end
      
endmodule

