`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:20 11/07/2014 
// Design Name: 
// Module Name:    BoothsMult 
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
module BoothsDiv
	#(	parameter integer bits = 8)
	( 	input signed [bits:0] a,
		input signed [(bits - 1):0] b,
		output signed [bits:0] quotient,
		output signed [(bits - 1):0] remainder);
		
		localparam integer aBits = bits;
		localparam integer bBits = bits - 1;
		
		wire signed [bBits:0] pre_inv_b = -b;
		
		wire signed [bBits:0] pos_b = {(bBits + 1){b[bBits]}} & pre_inv_b | {(bBits + 1){~b[bBits]}} & b;
		wire signed [bBits:0] inv_b = {(bBits + 1){b[bBits]}} & b | {(bBits + 1){~b[bBits]}} & pre_inv_b;
		
		generate
			if(aBits == 1) begin : oneABit
				
			
			end else begin : defaultCase
				wire [(aBits - 1):0] unsignedA;
				wire signA;
				FromTwosComplement #(aBits) extractSign (a, signA, unsignedA);
			
				wire [(aBits + bBits):0] partialDiv [0:bBits];
				
				wire [bBits:0] fstCycleOp = {{bBits{1'b0}}, unsignedA[aBits - 1]} + inv_b;
				assign partialDiv[0][(aBits + bBits):(aBits)] = fstCycleOp;
				assign partialDiv[0][(aBits - 1):1] = unsignedA[(aBits - 2):0];
				assign partialDiv[0][0] = ~partialDiv[0][aBits + bBits];
				
				genvar ii;
				for(ii = 1; ii <= bBits; ii = ii + 1) begin : boothStep
					wire notAPlus = partialDiv[ii - 1][aBits + bBits];
					wire aPlus = ~notAPlus;
					wire [bBits:0] cycleOp =
						partialDiv[ii - 1][(aBits + bBits - 1):(aBits - 1)] +
						({(bBits + 1){notAPlus}} & pos_b | {(bBits + 1){aPlus}} & inv_b);
						
					assign partialDiv[ii][(aBits + bBits):aBits] = cycleOp;
					assign partialDiv[ii][(aBits - 1):1] = partialDiv[ii - 1][(aBits - 2):0];
					assign partialDiv[ii][0] = ~partialDiv[ii][aBits + bBits];
						
				end
				
				wire finalSign = signA ^ b[bBits];
				ToTwosComplement #(aBits) restoreSign (partialDiv[bBits][(aBits - 1):0], finalSign, quotient);
				wire signed [bBits:0] preRemainder;
				assign preRemainder = partialDiv[bBits][(aBits + bBits):(aBits)] + (pos_b & {(bBits + 1){partialDiv[bBits][aBits + bBits]}});
				assign remainder = {(bBits + 1){signA}} & -preRemainder | {(bBits + 1){~signA}} & preRemainder;
				
			end
		endgenerate

endmodule
