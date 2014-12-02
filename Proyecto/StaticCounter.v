`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:56:47 11/07/2014 
// Design Name: 
// Module Name:    StaticCounter 
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
module StaticCounter
	#(parameter upTo = 255)
	(	input clk, enable, reset,
		output [(logb2(upTo + 1) - 1):0] count, output overflow);
	
	localparam numLength = logb2(upTo + 1);
	
	 function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	generate
		if(numLength != logb2(upTo + 2)) begin : prePowerOfTwoGen //2**N - 1
		
			reg [numLength:0] internalCount;
			
			always @(posedge clk)
			begin
				if(reset) internalCount <= 0;
				else if(enable) begin
					if(overflow) internalCount[numLength] <= 0;
					internalCount <= internalCount + 1;
				end
			end
			
			assign count = internalCount[(numLength - 1):0];
			assign overflow = internalCount[numLength];
		
		end else begin : defaultGen //Default
		
			reg [logb2(upTo):0] internalCount;
			
			always @(posedge clk)
			begin
				if(reset) internalCount <= 0;
				else if(enable) begin
					if(overflow) internalCount[numLength] <= 0;
					if(internalCount[(numLength - 1):0] < upTo) internalCount <= internalCount + 1;
					else begin
						internalCount[(numLength - 1):0] <= 0;
						internalCount[numLength] <= 1;
					end
				end
			end
			
			assign count = internalCount[(numLength - 1):0];
			assign overflow = internalCount[numLength];
			
		end
		
	endgenerate


endmodule
