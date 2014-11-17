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
module BoothsMult
	#(	parameter integer aBits = 8, parameter integer bBits = 8)
	( 	input signed [aBits:0] a,
		input signed [bBits:0] b,
		output signed [(aBits + bBits + 1):0] y);
		
		wire signed [bBits:0] inv_b = -b;
		
		generate
			if(aBits == 1) begin : oneABit
				assign y = {(aBits + bBits + 1){a[0]}} & (-b & {(aBits + bBits + 1){a[1]}} | b & & {(aBits + bBits + 1){~a[1]}});
			
			end else begin : defaultCase
				wire [(aBits + bBits + 1):0] partialProducts [0:aBits];
				
				wire [bBits:0] fstCycleOp = inv_b & {(bBits + 1){a[0]}};
				assign partialProducts[0][(aBits - 1):0] = a[aBits:1];
				assign partialProducts[0][(aBits + bBits):aBits] = fstCycleOp;
				assign partialProducts[0][aBits + bBits + 1] = partialProducts[0][aBits + bBits];
				
				wire scnDoSomething = a[0] ^ partialProducts[0][0];
				wire [bBits:0] sndCycleOp = 
						partialProducts[0][(aBits + bBits + 1):(aBits + 1)]
						+ (b & {(bBits + 1){a[0] & scnDoSomething}} | inv_b & {(bBits + 1){partialProducts[0][0] & scnDoSomething}});
						
				assign partialProducts[1][(aBits - 1):0] = partialProducts[0][aBits:1];
				assign partialProducts[1][(aBits + bBits):aBits] = sndCycleOp;
				assign partialProducts[1][aBits + bBits + 1] = partialProducts[1][aBits + bBits];
				
				genvar ii;
				for(ii = 2; ii <= aBits; ii = ii + 1) begin : boothStep
					
					wire previousQ = partialProducts[ii - 2][0];
					wire Q = partialProducts[ii - 1][0];
					wire doSomething = previousQ ^ Q ;
					
					wire [bBits:0] cycleOp = 
							partialProducts[ii - 1][(aBits + bBits + 1):(aBits + 1)]
							+ (b & {(bBits + 1){previousQ & doSomething}} | inv_b & {(bBits + 1){Q & doSomething}});
							
					assign partialProducts[ii][(aBits - 1):0] = partialProducts[ii - 1][aBits:1];
					assign partialProducts[ii][(aBits + bBits):aBits] = cycleOp;
					assign partialProducts[ii][aBits + bBits + 1] = partialProducts[ii][aBits + bBits];
					
				end
				
				assign y = partialProducts[aBits];
				
			end
		endgenerate

endmodule
