`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:08 10/30/2014 
// Design Name: 
// Module Name:    FromTwosComplement 
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
module FromTwosComplement
   #(	parameter bits = 8)
    (	input [bits:0] twosComp,
		
		output sign,
		output [(bits - 1):0] value );
		
		
		wire [(bits - 1):0] unComplement = {bits{1'b1}} ^ (twosComp[(bits - 1):0] - 1);
		assign sign = twosComp[bits];
		
		assign value = {{bits{!sign}} & twosComp} | {{bits{sign}} & unComplement};
endmodule
