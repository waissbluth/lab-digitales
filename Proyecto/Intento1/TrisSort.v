`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:24 11/16/2014 
// Design Name: 
// Module Name:    TrisSort 
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
module TrisSort
	#(	parameter intBits = 4, parameter decimalBits = 8, parameter colorDepth = 4, parameter trisCount = 16, parameter supportBurst = 0)
	(	input clk, input reset,
		
		input signed [((intBit + decimalBits + 1)*trisCount -1):0] z_in, lambda_0_in, lambda_1_in, lambda_2_in,
		input [(trisCount - 1):0] inTris_in,
		input [(colorDepth*trisCount - 1):0] R_0_in, G_0_in, B_0_in,
		input [(colorDepth*trisCount - 1):0] R_1_in, G_1_in, B_1_in,
		input [(colorDepth*trisCount - 1):0] R_2_in, G_2_in, B_2_in,
		input inEnable,
		
		output signed [(intBit + decimalBits):0] z_out, lambda_0_out, lambda_1_out, lambda_2_out,
		output inTris_out,
		output [(colorDepth - 1):0] R_0_out, G_0_out, B_0_out,
		output [(colorDepth - 1):0] R_1_out, G_1_out, B_1_out,
		output [(colorDepth - 1):0] R_2_out, G_2_out, B_2_out,
		output outEnable);
		
		function integer logb2;
			input integer n;
			begin
				n = n-1;
			for(logb2=0; n>0; logb2=logb2 + 1)
				n = n>>1;
			end
		endfunction

		localparam numBits = intBit + decimalBits + 1;
		localparam integer defaultLengts = trisCount/4;
		localparam integer defaultLastLength = trisCount - defaultLengts*4;
		localparam integer defaultDelay = (logb2(defaultLengts) - 1)/2 + 1;
		localparam integer defaultLastDelay = (logb2(defaultLastLengt) - 1)/2 + 1;
		
		generate
		
			if(trisCount <= 4) begin : case_1_to_4_regs
				reg signed [(numBits - 1):0] z_out_reg, lambda_0_out_reg, lambda_1_out_reg, lambda_2_out_reg;
				reg inTris_out_reg;
				reg [(colorDepth - 1):0] R_0_out_reg, G_0_out_reg, B_0_out_reg;
				reg [(colorDepth - 1):0] R_1_out_reg, G_1_out_reg, B_1_out_reg;
				reg [(colorDepth - 1):0] R_2_out_reg, G_2_out_reg, B_2_out_reg;
				reg outEnable_reg;
				
				assign z_out = z_out_reg;
				assign lambda_0_out = lambda_0_out_reg;
				assign lambda_1_out = lambda_1_out_reg;
				assign lambda_2_out = lambda_2_out_reg;
				
				assign inTris_out = inTris_out_reg;
				
				assign R_0_out = R_0_out_reg;
				assign G_0_out = G_0_out_reg;
				assign B_0_out = B_0_out_reg;
				
				assign R_1_out = R_1_out_reg;
				assign G_1_out = G_1_out_reg;
				assign B_1_out = B_1_out_reg;
				
				assign R_2_out = R_2_out_reg;
				assign G_2_out = G_2_out_reg;
				assign B_2_out = B_2_out_reg;
				
				assign outEnable = outEnable_reg;
			end
		
			if(trisCount == 1) begin : case_1
				always @(posedge clk)
				begin
					if(inEnable)
					begin
						z_out_reg <= z_in;
						lambda_0_out_reg <= lambda_0_in;
						lambda_1_out_reg <= lambda_1_in;
						lambda_2_out_reg <= lambda_2_in;
						
						inTris_in_reg <= inTris_out;
						
						R_0_out_reg <= R_0_in;
						G_0_out_reg <= G_0_in;
						B_0_out_reg <= B_0_in;
						
						R_1_out_reg <= R_1_in;
						G_1_out_reg <= G_1_in;
						B_1_out_reg <= B_1_in;
						
						R_2_out_reg <= R_2_in;
						G_2_out_reg <= G_2_in;
						B_2_out_reg <= B_2_in;
						
						outEnable_reg <= 1;
					end else outEnable_reg <= 0;
				end
				
			end else if (trisCount == 2) begin : case_2
				wire expanded_z_in_0 = {~intTris[0], z_in[(numBits - 1):0]};
				wire expanded_z_in_1 = {~intTris[1], z_in[((numBits - 1) + numBits):numBits]};
				
				wire less_0_1 = expanded_z_in_0 < expanded_z_in_1;
				
				always @(posedge clk)
				begin
					if(inEnable)
					begin
						if(less_0_1)
						begin
							z_out_reg <= z_in[(numBits - 1):0];
							lambda_0_out_reg <= lambda_0_in[(numBits - 1):0];
							lambda_1_out_reg <= lambda_1_in[(numBits - 1):0];
							lambda_2_out_reg <= lambda_2_in[(numBits - 1):0];
							
							inTris_in_reg <= inTris_out[0];
							
							R_0_out_reg <= R_0_in[(colorDepth - 1):0];
							G_0_out_reg <= G_0_in[(colorDepth - 1):0];
							B_0_out_reg <= B_0_in[(colorDepth - 1):0];
							
							R_1_out_reg <= R_1_in[(colorDepth - 1):0];
							G_1_out_reg <= G_1_in[(colorDepth - 1):0];
							B_1_out_reg <= B_1_in[(colorDepth - 1):0];
							
							R_2_out_reg <= R_2_in[(colorDepth - 1):0];
							G_2_out_reg <= G_2_in[(colorDepth - 1):0];
							B_2_out_reg <= B_2_in[(colorDepth - 1):0];
							
						end else begin
							z_out_reg <= z_in[((numBits - 1) + numBits):numBits];
							lambda_0_out_reg <= lambda_0_in[((numBits - 1) + numBits):numBits];
							lambda_1_out_reg <= lambda_1_in[((numBits - 1) + numBits):numBits];
							lambda_2_out_reg <= lambda_2_in[((numBits - 1) + numBits):numBits];
							
							inTris_in_reg <= inTris_out[1];
							
							R_0_out_reg <= R_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_0_out_reg <= G_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_0_out_reg <= B_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							
							R_1_out_reg <= R_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_1_out_reg <= G_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_1_out_reg <= B_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							
							R_2_out_reg <= R_2_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_2_out_reg <= G_2_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_2_out_reg <= B_2_in[((colorDepth - 1) + colorDepth):colorDepth];
						
						end
						
						outEnable_reg <= 1;
					end else outEnable_reg <= 0;
				end
			end else if (trisCount == 3)  begin : case_3
				wire expanded_z_in_0 = {~intTris[0], z_in[(numBits - 1):0]};
				wire expanded_z_in_1 = {~intTris[1], z_in[((numBits - 1) + numBits):numBits]};
				wire expanded_z_in_2 = {~intTris[2], z_in[((numBits - 1) + numBits*2):numBits*2]};
				
				wire less_0_1 = expanded_z_in_0 < expanded_z_in_1;
				wire less_0_2 = expanded_z_in_0 < expanded_z_in_2;
				wire less_1_2 = expanded_z_in_1 < expanded_z_in_2;
				
				always @(posedge clk)
				begin
					if(inEnable)
					begin
						if(less_0_1 & less_0_2)
						begin
							z_out_reg <= z_in[(numBits - 1):0];
							lambda_0_out_reg <= lambda_0_in[(numBits - 1):0];
							lambda_1_out_reg <= lambda_1_in[(numBits - 1):0];
							lambda_2_out_reg <= lambda_2_in[(numBits - 1):0];
							
							inTris_in_reg <= inTris_out[0];
							
							R_0_out_reg <= R_0_in[(colorDepth - 1):0];
							G_0_out_reg <= G_0_in[(colorDepth - 1):0];
							B_0_out_reg <= B_0_in[(colorDepth - 1):0];
							
							R_1_out_reg <= R_1_in[(colorDepth - 1):0];
							G_1_out_reg <= G_1_in[(colorDepth - 1):0];
							B_1_out_reg <= B_1_in[(colorDepth - 1):0];
							
							R_2_out_reg <= R_2_in[(colorDepth - 1):0];
							G_2_out_reg <= G_2_in[(colorDepth - 1):0];
							B_2_out_reg <= B_2_in[(colorDepth - 1):0];
							
						end else if(less_1_2) begin
							z_out_reg <= z_in[((numBits - 1) + numBits):numBits];
							lambda_0_out_reg <= lambda_0_in[((numBits - 1) + numBits):numBits];
							lambda_1_out_reg <= lambda_1_in[((numBits - 1) + numBits):numBits];
							lambda_2_out_reg <= lambda_2_in[((numBits - 1) + numBits):numBits];
							
							inTris_in_reg <= inTris_out[1];
							
							R_0_out_reg <= R_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_0_out_reg <= G_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_0_out_reg <= B_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							
							R_1_out_reg <= R_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_1_out_reg <= G_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_1_out_reg <= B_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							
							R_2_out_reg <= R_2_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_2_out_reg <= G_2_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_2_out_reg <= B_2_in[((colorDepth - 1) + colorDepth):colorDepth];
						
						end else begin
							z_out_reg <= z_in[((numBits - 1) + numBits*2):numBits*2];
							lambda_0_out_reg <= lambda_0_in[((numBits - 1) + numBits*2):numBits*2];
							lambda_1_out_reg <= lambda_1_in[((numBits - 1) + numBits*2):numBits*2];
							lambda_2_out_reg <= lambda_2_in[((numBits - 1) + numBits*2):numBits*2];
							
							inTris_in_reg <= inTris_out[2];
							
							R_0_out_reg <= R_0_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							G_0_out_reg <= G_0_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							B_0_out_reg <= B_0_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							
							R_1_out_reg <= R_1_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							G_1_out_reg <= G_1_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							B_1_out_reg <= B_1_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							
							R_2_out_reg <= R_2_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							G_2_out_reg <= G_2_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							B_2_out_reg <= B_2_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							
						end
						
						outEnable_reg <= 1;
					end else outEnable_reg <= 0;
				end
			end else if (trisCount == 4)  begin : case_4
				wire signed expanded_z_in_0 = {~intTris[0], z_in[(numBits - 1):0]};
				wire signed expanded_z_in_1 = {~intTris[1], z_in[((numBits - 1) + numBits):numBits]};
				wire signed expanded_z_in_2 = {~intTris[2], z_in[((numBits - 1) + numBits*2):numBits*2]};
				wire signed expanded_z_in_3 = {~intTris[3], z_in[((numBits - 1) + numBits*3):numBits*3]};
				
				wire less_0_1 = expanded_z_in_0 < expanded_z_in_1;
				wire less_0_2 = expanded_z_in_0 < expanded_z_in_2;
				wire less_0_3 = expanded_z_in_0 < expanded_z_in_3;
				wire less_1_2 = expanded_z_in_1 < expanded_z_in_2;
				wire less_1_3 = expanded_z_in_1 < expanded_z_in_3;
				wire less_2_3 = expanded_z_in_2 < expanded_z_in_3;
			
				always @(posedge clk)
				begin
					if(inEnable)
					begin
						if(less_0_1 & less_0_2 & less_0_3)
						begin
							z_out_reg <= z_in[(numBits - 1):0];
							lambda_0_out_reg <= lambda_0_in[(numBits - 1):0];
							lambda_1_out_reg <= lambda_1_in[(numBits - 1):0];
							lambda_2_out_reg <= lambda_2_in[(numBits - 1):0];
							
							inTris_in_reg <= inTris_out[0];
							
							R_0_out_reg <= R_0_in[(colorDepth - 1):0];
							G_0_out_reg <= G_0_in[(colorDepth - 1):0];
							B_0_out_reg <= B_0_in[(colorDepth - 1):0];
							
							R_1_out_reg <= R_1_in[(colorDepth - 1):0];
							G_1_out_reg <= G_1_in[(colorDepth - 1):0];
							B_1_out_reg <= B_1_in[(colorDepth - 1):0];
							
							R_2_out_reg <= R_2_in[(colorDepth - 1):0];
							G_2_out_reg <= G_2_in[(colorDepth - 1):0];
							B_2_out_reg <= B_2_in[(colorDepth - 1):0];
							
						end else if(less_1_2 & less_1_3) begin
							z_out_reg <= z_in[((numBits - 1) + numBits):numBits];
							lambda_0_out_reg <= lambda_0_in[((numBits - 1) + numBits):numBits];
							lambda_1_out_reg <= lambda_1_in[((numBits - 1) + numBits):numBits];
							lambda_2_out_reg <= lambda_2_in[((numBits - 1) + numBits):numBits];
							
							inTris_in_reg <= inTris_out[1];
							
							R_0_out_reg <= R_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_0_out_reg <= G_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_0_out_reg <= B_0_in[((colorDepth - 1) + colorDepth):colorDepth];
							
							R_1_out_reg <= R_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_1_out_reg <= G_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_1_out_reg <= B_1_in[((colorDepth - 1) + colorDepth):colorDepth];
							
							R_2_out_reg <= R_2_in[((colorDepth - 1) + colorDepth):colorDepth];
							G_2_out_reg <= G_2_in[((colorDepth - 1) + colorDepth):colorDepth];
							B_2_out_reg <= B_2_in[((colorDepth - 1) + colorDepth):colorDepth];
						
						end else if(less_2_3) begin
							z_out_reg <= z_in[((numBits - 1) + numBits*2):numBits*2];
							lambda_0_out_reg <= lambda_0_in[((numBits - 1) + numBits*2):numBits*2];
							lambda_1_out_reg <= lambda_1_in[((numBits - 1) + numBits*2):numBits*2];
							lambda_2_out_reg <= lambda_2_in[((numBits - 1) + numBits*2):numBits*2];
							
							inTris_in_reg <= inTris_out[2];
							
							R_0_out_reg <= R_0_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							G_0_out_reg <= G_0_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							B_0_out_reg <= B_0_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							
							R_1_out_reg <= R_1_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							G_1_out_reg <= G_1_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							B_1_out_reg <= B_1_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							
							R_2_out_reg <= R_2_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							G_2_out_reg <= G_2_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							B_2_out_reg <= B_2_in[((colorDepth - 1) + colorDepth*2):colorDepth*2];
							
						end else begin
							z_out_reg <= z_in[((numBits - 1) + numBits*2):numBits*3];
							lambda_0_out_reg <= lambda_0_in[((numBits - 1) + numBits*3):numBits*3];
							lambda_1_out_reg <= lambda_1_in[((numBits - 1) + numBits*3):numBits*3];
							lambda_2_out_reg <= lambda_2_in[((numBits - 1) + numBits*3):numBits*3];
							
							inTris_in_reg <= inTris_out[3];
							
							R_0_out_reg <= R_0_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							G_0_out_reg <= G_0_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							B_0_out_reg <= B_0_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							
							R_1_out_reg <= R_1_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							G_1_out_reg <= G_1_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							B_1_out_reg <= B_1_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							
							R_2_out_reg <= R_2_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							G_2_out_reg <= G_2_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							B_2_out_reg <= B_2_in[((colorDepth - 1) + colorDepth*3):colorDepth*3];
							
						end
						
						outEnable_reg <= 1;
					end else outEnable_reg <= 0;
				end
			end else begin : case_default
				/* In splits */
				wire [(numBits*defaultLengts - 1):0] z_in_split_0, z_in_split_1, z_in_split_2;
				wire [(numBits*defaultLastLength - 1):0] z_in_split_3;
				
				wire [(numBits*defaultLengts - 1):0] lambda_0_in_split_0, lambda_0_in_split_1, lambda_0_in_split_2;
				wire [(numBits*defaultLastLength - 1):0] lambda_0_in_split_3;
				
				wire [(numBits*defaultLengts - 1):0] lambda_1_in_split_0, lambda_1_in_split_1, lambda_1_in_split_2;
				wire [(numBits*defaultLastLength - 1):0] lambda_1_in_split_3;
				
				wire [(numBits*defaultLengts - 1):0] lambda_2_in_split_0, lambda_2_in_split_1, lambda_2_in_split_2;
				wire [(numBits*defaultLastLength - 1):0] lambda_2_in_split_3;
				
				wire [(defaultLengts - 1):0] inTris_in_split_0, inTris_in_split_1, inTris_in_split_2;
				wire [(defaultLastLength - 1):0] inTris_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] R_0_in_split_0, R_0_in_split_1, R_0_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] R_0_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] G_0_in_split_0, G_0_in_split_1, G_0_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] G_0_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] B_0_in_split_0, B_0_in_split_1, B_0_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] B_0_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] R_1_in_split_0, R_1_in_split_1, R_1_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] R_1_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] G_1_in_split_0, G_1_in_split_1, G_1_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] G_1_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] B_1_in_split_0, B_1_in_split_1, B_1_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] B_1_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] R_2_in_split_0, R_2_in_split_1, R_2_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] R_2_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] G_2_in_split_0, G_2_in_split_1, G_2_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] G_2_in_split_3;
				
				wire [(colorDepth*defaultLengts - 1):0] B_2_in_split_0, B_2_in_split_1, B_2_in_split_2;
				wire [(colorDepth*defaultLastLength - 1):0] B_2_in_split_3;
				
				assign z_in_split_0 = z_in[(numBits*defaultLengts - 1):0];
				assign z_in_split_1 = z_in[(numBits*defaultLengts*2 - 1):numBits*defaultLengts];
				assign z_in_split_2 = z_in[(numBits*defaultLengts*3 - 1):numBits*defaultLengts*2];
				assign z_in_split_3 = z_in[(numBits*trisCount - 1):numBits*defaultLengts*3];
				
				assign lambda_0_in_split_0 = lambda_0_in[(numBits*defaultLengts - 1):0];
				assign lambda_0_in_split_1 = lambda_0_in[(numBits*defaultLengts*2 - 1):numBits*defaultLengts];
				assign lambda_0_in_split_2 = lambda_0_in[(numBits*defaultLengts*3 - 1):numBits*defaultLengts*2];
				assign lambda_0_in_split_3 = lambda_0_in[(numBits*trisCount - 1):numBits*defaultLengts*3];
				
				assign lambda_1_in_split_0 = lambda_1_in[(numBits*defaultLengts - 1):0];
				assign lambda_1_in_split_1 = lambda_1_in[(numBits*defaultLengts*2 - 1):numBits*defaultLengts];
				assign lambda_1_in_split_2 = lambda_1_in[(numBits*defaultLengts*3 - 1):numBits*defaultLengts*2];
				assign lambda_1_in_split_3 = lambda_1_in[(numBits*trisCount - 1):numBits*defaultLengts*3];
				
				assign lambda_2_in_split_0 = lambda_2_in[(numBits*defaultLengts - 1):0];
				assign lambda_2_in_split_1 = lambda_2_in[(numBits*defaultLengts*2 - 1):numBits*defaultLengts];
				assign lambda_2_in_split_2 = lambda_2_in[(numBits*defaultLengts*3 - 1):numBits*defaultLengts*2];
				assign lambda_2_in_split_3 = lambda_2_in[(numBits*trisCount - 1):numBits*defaultLengts*3];
				
				assign inTris_in_split_0 = inTris_in[(defaultLengts - 1):0];
				assign inTris_in_split_1 = inTris_in[(defaultLengts*2 - 1):defaultLengts];
				assign inTris_in_split_2 = inTris_in[(defaultLengts*3 - 1):defaultLengts*2];
				assign inTris_in_split_3 = inTris_in[(trisCount - 1):defaultLengts*3];
				
				assign R_0_in_split_0 = R_0_in[(colorDepth*defaultLengts - 1):0];
				assign R_0_in_split_1 = R_0_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign R_0_in_split_2 = R_0_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign R_0_in_split_3 = R_0_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];
				
				assign G_0_in_split_0 = G_0_in[(colorDepth*defaultLengts - 1):0];
				assign G_0_in_split_1 = G_0_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign G_0_in_split_2 = G_0_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign G_0_in_split_3 = G_0_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];
				
				assign B_0_in_split_0 = B_0_in[(colorDepth*defaultLengts - 1):0];
				assign B_0_in_split_1 = B_0_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign B_0_in_split_2 = B_0_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign B_0_in_split_3 = B_0_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];
				
				assign R_1_in_split_0 = R_1_in[(colorDepth*defaultLengts - 1):0];
				assign R_1_in_split_1 = R_1_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign R_1_in_split_2 = R_1_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign R_1_in_split_3 = R_1_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];
				
				assign G_1_in_split_0 = G_1_in[(colorDepth*defaultLengts - 1):0];
				assign G_1_in_split_1 = G_1_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign G_1_in_split_2 = G_1_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign G_1_in_split_3 = G_1_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];
				
				assign B_1_in_split_0 = B_1_in[(colorDepth*defaultLengts - 1):0];
				assign B_1_in_split_1 = B_1_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign B_1_in_split_2 = B_1_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign B_1_in_split_3 = B_1_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];
				
				assign R_2_in_split_0 = R_2_in[(colorDepth*defaultLengts - 1):0];
				assign R_2_in_split_1 = R_2_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign R_2_in_split_2 = R_2_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign R_2_in_split_3 = R_2_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];
				
				assign G_2_in_split_0 = G_2_in[(colorDepth*defaultLengts - 1):0];
				assign G_2_in_split_1 = G_2_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign G_2_in_split_2 = G_2_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign G_2_in_split_3 = G_2_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];

				assign B_2_in_split_0 = B_2_in[(colorDepth*defaultLengts - 1):0];
				assign B_2_in_split_1 = B_2_in[(colorDepth*defaultLengts*2 - 1):defaultLengts*colorDepth];
				assign B_2_in_split_2 = B_2_in[(colorDepth*defaultLengts*3 - 1):defaultLengts*colorDepth*2];
				assign B_2_in_split_3 = B_2_in[(colorDepth*trisCount - 1):defaultLengts*colorDepth*3];
				
				/* Out splits */
				wire [(numBits - 1):0] z_out_split_0, z_out_split_1, z_out_split_2, z_out_split_3;
				
				wire [(numBits - 1):0] lambda_0_out_split_0, lambda_0_out_split_1, lambda_0_out_split_2, lambda_0_out_split_3;
				wire [(numBits - 1):0] lambda_1_out_split_0, lambda_1_out_split_1, lambda_1_out_split_2, lambda_1_out_split_3;
				wire [(numBits - 1):0] lambda_2_out_split_0, lambda_2_out_split_1, lambda_2_out_split_2, lambda_2_out_split_3;
				
				wire inTris_out_split_0, outTris_out_split_1, outTris_out_split_2, outTris_out_split_3;
				
				wire [(colorDepth - 1):0] R_0_out_split_0, R_0_out_split_1, R_0_out_split_2, R_0_out_split_3;
				wire [(colorDepth - 1):0] G_0_out_split_0, G_0_out_split_1, G_0_out_split_2, G_0_out_split_3;
				wire [(colorDepth - 1):0] B_0_out_split_0, B_0_out_split_1, B_0_out_split_2, B_0_out_split_3;
				
				wire [(colorDepth - 1):0] R_1_out_split_0, R_1_out_split_1, R_1_out_split_2, R_1_out_split_3;
				wire [(colorDepth - 1):0] G_1_out_split_0, G_1_out_split_1, G_1_out_split_2, G_1_out_split_3;
				wire [(colorDepth - 1):0] B_1_out_split_0, B_1_out_split_1, B_1_out_split_2, B_1_out_split_3;
				
				wire [(colorDepth - 1):0] R_2_out_split_0, R_2_out_split_1, R_2_out_split_2, R_2_out_split_3;
				wire [(colorDepth - 1):0] G_2_out_split_0, G_2_out_split_1, G_2_out_split_2, G_2_out_split_3;
				wire [(colorDepth - 1):0] B_2_out_split_0, B_2_out_split_1, B_2_out_split_2, B_2_out_split_3;
				
				wire outEnable_split_0, outEnable_split_1, outEnable_split_2, outEnable_split_3;
				
				TrisSort #(intBits, decimalBits, colorDepth, defaultLengts, supportBurst) split_0_sort
				(
					clk, reset,
					z_in_split_0, lambda_0_in_split_0, lambda_1_in_split_0, lambda_2_in_split_0,
					inTris_in_split_0,
					R_0_in_split_0, G_0_in_split_0, B_0_in_split_0,
					R_1_in_split_0, G_1_in_split_0, B_1_in_split_0,
					R_2_in_split_0, G_2_in_split_0, B_2_in_split_0,
					inEnable,
		
					z_out_split_0, lambda_0_out_split_0, lambda_1_out_split_0, lambda_2_out_split_0,
					inTris_out_split_0,
					R_0_out_split_0, G_0_out_split_0, B_0_out_split_0,
					R_1_out_split_0, G_1_out_split_0, B_1_out_split_0,
					R_2_out_split_0, G_2_out_split_0, B_2_out_split_0,
					outEnable_split_0
				);
				
				TrisSort #(intBits, decimalBits, colorDepth, defaultLengts, supportBurst) split_1_sort
				(
					clk, reset,
					z_in_split_1, lambda_0_in_split_1, lambda_1_in_split_1, lambda_2_in_split_1,
					inTris_in_split_1,
					R_0_in_split_1, G_0_in_split_1, B_0_in_split_1,
					R_1_in_split_1, G_1_in_split_1, B_1_in_split_1,
					R_2_in_split_1, G_2_in_split_1, B_2_in_split_1,
					inEnable,
		
					z_out_split_1, lambda_0_out_split_1, lambda_1_out_split_1, lambda_2_out_split_1,
					inTris_out_split_1,
					R_0_out_split_1, G_0_out_split_1, B_0_out_split_1,
					R_1_out_split_1, G_1_out_split_1, B_1_out_split_1,
					R_2_out_split_1, G_2_out_split_1, B_2_out_split_1,
					outEnable_split_1
				);
							
				TrisSort #(intBits, decimalBits, colorDepth, defaultLengts, supportBurst) split_2_sort
				(
					clk, reset,
					z_in_split_2, lambda_0_in_split_2, lambda_1_in_split_2, lambda_2_in_split_2,
					inTris_in_split_2,
					R_0_in_split_2, G_0_in_split_2, B_0_in_split_2,
					R_1_in_split_2, G_1_in_split_2, B_1_in_split_2,
					R_2_in_split_2, G_2_in_split_2, B_2_in_split_2,
					inEnable,
		
					z_out_split_2, lambda_0_out_split_2, lambda_1_out_split_2, lambda_2_out_split_2,
					inTris_out_split_2,
					R_0_out_split_2, G_0_out_split_2, B_0_out_split_2,
					R_1_out_split_2, G_1_out_split_2, B_1_out_split_2,
					R_2_out_split_2, G_2_out_split_2, B_2_out_split_2,
					outEnable_split_2
				);
				
				TrisSort #(intBits, decimalBits, colorDepth, defaultLastLength, supportBurst) split_3_sort
				(
					clk, reset,
					z_in_split_3, lambda_0_in_split_3, lambda_1_in_split_3, lambda_2_in_split_3,
					inTris_in_split_3,
					R_0_in_split_3, G_0_in_split_3, B_0_in_split_3,
					R_1_in_split_3, G_1_in_split_3, B_1_in_split_3,
					R_2_in_split_3, G_2_in_split_3, B_2_in_split_3,
					inEnable,
		
					z_out_split_3, lambda_0_out_split_3, lambda_1_out_split_3, lambda_2_out_split_3,
					inTris_out_split_3,
					R_0_out_split_3, G_0_out_split_3, B_0_out_split_3,
					R_1_out_split_3, G_1_out_split_3, B_1_out_split_3,
					R_2_out_split_3, G_2_out_split_3, B_2_out_split_3,
					outEnable_split_3
				);
				
				/* Out join */
				wire [(numBits*4 - 1):0] z_out_join, lambda_0_out_join, lambda_1_out_join, lambda_2_out_join;
				
				wire [3:0] inTris_out_join;
				
				wire [(colorDepth*4 - 1):0] R_0_out_join, G_0_out_join, B_0_out_join;
				wire [(colorDepth*4 - 1):0] R_1_out_join, G_1_out_join, B_1_out_join;
				wire [(colorDepth*4 - 1):0] R_2_out_join, G_2_out_join, B_2_out_join;
				
				wire outEnable_join = outEnable_split_3;
				
				/* Assignment */
				if(defaultDelay == defaultLastDelay | !supportBurst) begin : syncDelays
					assign z_out_join = {z_out_split_3, z_out_split_2, z_out_split_1, z_out_split_0};
					assign lambda_0_out_join = {lambda_0_out_split_3, lambda_0_out_split_2, lambda_0_out_split_1, lambda_0_out_split_0};
					assign lambda_1_out_join = {lambda_1_out_split_3, lambda_1_out_split_2, lambda_1_out_split_1, lambda_1_out_split_0};
					assign lambda_2_out_join = {lambda_2_out_split_3, lambda_2_out_split_2, lambda_2_out_split_1, lambda_2_out_split_0};
					
					assign inTris_out = {inTris_out_split_3, inTris_out_split_2, inTris_out_split_1, inTris_out_split_0};
					
					assign R_0_out_join = {R_0_out_split_3, R_0_out_split_2, R_0_out_split_1, R_0_out_split_0};
					assign G_0_out_join = {G_0_out_split_3, G_0_out_split_2, G_0_out_split_1, G_0_out_split_0};
					assign B_0_out_join = {B_0_out_split_3, B_0_out_split_2, B_0_out_split_1, B_0_out_split_0};
					
					assign R_1_out_join = {R_1_out_split_3, R_1_out_split_2, R_1_out_split_1, R_1_out_split_0};
					assign G_1_out_join = {G_1_out_split_3, G_1_out_split_2, G_1_out_split_1, G_1_out_split_0};
					assign B_1_out_join = {B_1_out_split_3, B_1_out_split_2, B_1_out_split_1, B_1_out_split_0};
					
					assign R_2_out_join = {R_2_out_split_3, R_2_out_split_2, R_2_out_split_1, R_2_out_split_0};
					assign G_2_out_join = {G_2_out_split_3, G_2_out_split_2, G_2_out_split_1, G_2_out_split_0};
					assign B_2_out_join = {B_2_out_split_3, B_2_out_split_2, B_2_out_split_1, B_2_out_split_0};
					
				end else begin : lastExtraDelay
					reg [(numBits*3 - 1):0] z_out_join_reg, lambda_0_out_join_reg, lambda_1_out_join_reg, lambda_2_out_join_reg;
				
					reg [2:0] inTris_out_join_reg;
				
					reg [(colorDepth*3 - 1):0] R_0_out_join_reg, G_0_out_join_reg, B_0_out_join_reg;
					reg [(colorDepth*3 - 1):0] R_1_out_join_reg, G_1_out_join_reg, B_1_out_join_reg;
					reg [(colorDepth*3 - 1):0] R_2_out_join_reg, G_2_out_join_reg, B_2_out_join_reg;
					
					assign z_out_join = {z_out_split_3, z_out_join_reg};
					assign lambda_0_out_join = {lambda_0_out_split_3, lambda_0_out_join_reg};
					assign lambda_1_out_join = {lambda_1_out_split_3, lambda_1_out_join_reg};
					assign lambda_2_out_join = {lambda_2_out_split_3, lambda_2_out_join_reg};
					
					assign inTris_out = {inTris_out_split_3, inTris_out_reg};
					
					assign R_0_out_join = {R_0_out_split_3, R_0_out_join_reg};
					assign G_0_out_join = {G_0_out_split_3, G_0_out_join_reg};
					assign B_0_out_join = {B_0_out_split_3, B_0_out_join_reg};
					
					assign R_1_out_join = {R_1_out_split_3, R_1_out_join_reg};
					assign G_1_out_join = {G_1_out_split_3, G_1_out_join_reg};
					assign B_1_out_join = {B_1_out_split_3, B_1_out_join_reg};
					
					assign R_2_out_join = {R_2_out_split_3, R_2_out_join_reg};
					assign G_2_out_join = {G_2_out_split_3, G_2_out_join_reg};
					assign B_2_out_join = {B_2_out_split_3, B_2_out_join_reg};
					
					always @(posedge clk)
					begin
						z_out_join_reg <= {z_out_split_2, z_out_split_1, z_out_split_0};
						lambda_0_out_join_reg <= {lambda_0_out_split_2, lambda_0_out_split_1, lambda_0_out_split_0};
						lambda_1_out_join_reg <= {lambda_1_out_split_2, lambda_1_out_split_1, lambda_1_out_split_0};
						lambda_2_out_join_reg <= {lambda_2_out_split_2, lambda_2_out_split_1, lambda_2_out_split_0};
					
						inTris_out_reg <= {inTris_out_split_2, inTris_out_split_1, inTris_out_split_0};
					
						R_0_out_join_reg <= {R_0_out_split_2, R_0_out_split_1, R_0_out_split_0};
						G_0_out_join_reg <= {G_0_out_split_2, G_0_out_split_1, G_0_out_split_0};
						B_0_out_join_reg <= {B_0_out_split_2, B_0_out_split_1, B_0_out_split_0};
					
						R_1_out_join_reg <= {R_1_out_split_2, R_1_out_split_1, R_1_out_split_0};
						G_1_out_join_reg <= {G_1_out_split_2, G_1_out_split_1, G_1_out_split_0};
						B_1_out_join_reg <= {B_1_out_split_2, B_1_out_split_1, B_1_out_split_0};
					
						R_2_out_join_reg <= {R_2_out_split_2, R_2_out_split_1, R_2_out_split_0};
						G_2_out_join_reg <= {G_2_out_split_2, G_2_out_split_1, G_2_out_split_0};
						B_2_out_join_reg <= {B_2_out_split_2, B_2_out_split_1, B_2_out_split_0};
					end
				end
				
				/* Join results */
				TrisSort #(intBits, decimalBits, colorDepth, 4, supportBurst) final_sort
				(
					clk, reset,
					z_out_join, lambda_0_out_join, lambda_1_out_join, lambda_2_out_join,
					inTris_out,
					R_0_out_join, G_0_out_join, B_0_out_join,
					R_1_out_join, G_1_out_join, B_1_out_join,
					R_2_out_join, G_2_out_join, B_2_out_join,
					outEnable_join,
		
					z_out, lambda_0_out, lambda_1_out, lambda_2_out,
					inTris_out,
					R_0_out, G_0_out, B_0_out,
					R_1_out, G_1_out, B_1_out,
					R_2_out, G_2_out, B_2_out,
					outEnable
				);
				
			end
			
		endgenerate
		
		
endmodule
