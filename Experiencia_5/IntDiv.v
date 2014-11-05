`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:43:36 10/31/2014 
// Design Name: 
// Module Name:    IntDiv 
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
module IntDiv
	#(	parameter numBits = 8, parameter demBits = 8)
	(	input [(numBits - 1):0] numerator,
		input [(demBits - 1):0] denominador,
		input signN, signD,
		
		output [(numBits - 1):0] result,
		output sign);
		
		localparam remainderEnd = (demBits*numBits - 1);
		
		assign sign = signN ^ signD;
		wire [(numBits - 1):0] notResult;
		
		wire [remainderEnd:0] remainder;
		wire [demBits:0] extDem;
		
		assign extDem = {1'b0, denominador};
		
		assign remainder[remainderEnd:(remainderEnd - (demBits - 1))] = 0;
		
		genvar ii;
		generate
			for(ii = 0; ii < (numBits - 1); ii = ii + 1) begin : remainderCascade
				
				wire [demBits:0] subsResult;
				wire [(demBits - 1):0] previousRemainder;
				assign previousRemainder = remainder[(remainderEnd - ii*demBits):(remainderEnd - ii*demBits - (demBits - 1))];
		
				Substracter #(demBits + 1) remainderSub (	{previousRemainder, numerator[numBits - 1 - ii]},
																		extDem,
																		1'b0,1'b0,
																		subsResult,
																		notResult[numBits - 1 - ii]);
				
				assign remainder[(remainderEnd - (ii + 1)*demBits):(remainderEnd - (ii + 1)*demBits - (demBits - 1))] =
					{(demBits){ result[numBits - 1 - ii]}} & subsResult[(demBits - 1):0] |
					{(demBits){!result[numBits - 1 - ii]}} & {previousRemainder[(demBits - 2):0], numerator[numBits - 1 - ii]};
				
			assign result[numBits - 1 - ii] =  !(|subsResult) | !notResult[numBits - 1 - ii];
				
			end
		endgenerate
	
		wire [(demBits - 1):0] finalRemainder;
		assign finalRemainder = remainder[(demBits - 1):0];
	
		wire [demBits:0] lastRemainder;
	
		Substracter #(demBits + 1) lastSub (	{	finalRemainder, numerator[0]},
																extDem,
																1'b0,1'b0,
																lastRemainder,
																notResult[0]);
																
		assign result[0] =  !(|lastRemainder) | !notResult[0];
	
endmodule
