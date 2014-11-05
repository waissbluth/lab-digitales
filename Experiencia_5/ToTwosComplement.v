`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:02 10/30/2014 
// Design Name: 
// Module Name:    ToTwosComplement 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ToTwosComplement
	#(	parameter bits = 8)
    (	input [(bits - 1):0] value,
		input sign,
		
		output [bits:0] twosComp );
		
		wire metaSign = sign & (|value);
		
		wire [(bits - 1):0] complement;
		assign complement = ({bits{1'b1}} ^ value) + 1;
		
		assign twosComp = {metaSign, {{bits{!metaSign}} & value} | {{bits{metaSign}} & complement}};

endmodule
