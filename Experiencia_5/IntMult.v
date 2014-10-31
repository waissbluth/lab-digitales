`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:34 10/17/2014 
// Design Name: 
// Module Name:    IntMult 
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
module IntMult
	#( parameter aBits = 8, parameter bBits = 8)
	(  input [(aBits - 1):0] a,
		input [(bBits - 1):0] b,
		
		output [(aBits + bBits - 1):0] out );
		
		wire [((aBits + 1)*bBits - 1):0] intermediateValues;
		assign intermediateValues[(aBits - 1): 0] = a & {aBits{b[0]}};
		assign intermediateValues[aBits] = 0;
		
		assign out[0] = intermediateValues[0];
		
		genvar ii;
		generate
		for(ii = 1; ii < bBits; ii = ii + 1)
			begin : intermediateCascade
				
				Adder #(aBits) cascader 
					(	intermediateValues[((ii - 1)*(aBits + 1) + aBits):((ii - 1)*(aBits + 1) + 1)], //previousA
						{a & {aBits{b[ii]}}},
						intermediateValues[(ii*(aBits + 1) + (aBits - 1)):(ii*(aBits + 1))], //nextA
						intermediateValues[ii*(aBits + 1) + aBits] ); //carryOut
						
				assign out[ii] = intermediateValues[ii*(aBits + 1)];
				
			end
		endgenerate
		
		assign out[(aBits + bBits - 1):bBits] = intermediateValues[((aBits + 1)*bBits - 1):((aBits + 1)*bBits - aBits)];
		

endmodule

