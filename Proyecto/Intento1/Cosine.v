`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:10 11/07/2014 
// Design Name: 
// Module Name:    Cosine 
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
module Cosine
	#(	parameter intBits = 2, parameter decimalBits = 8)
	(input signed [(intBits + decimalBits):0] x, output signed [(1 + decimalBits):0] y);
	
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	function integer max;
	  input integer a;
	  input integer b;
	  begin
		 if(a > b) max = a;
		 else max = b;
	  end
	endfunction
	
	/* Factorial and sizes */
	localparam integer signed fact2_param = 2;
	localparam integer signed fact4_param = 24;
	localparam integer signed fact6_param = 720;
	localparam integer signed fact8_param = 40320;
	
	localparam integer sizeFact2 = logb2(fact2_param);
	localparam integer sizeFact4 = logb2(fact4_param);
	localparam integer sizeFact6 = logb2(fact6_param);
	localparam integer sizeFact8 = logb2(fact8_param);
	
	/* Bits integer de (pi/2)**N */
	localparam integer intSize1 = 1;
	localparam integer intSize2 = 2;
	localparam integer intSize4 = 3;
	localparam integer intSize6 = 4;
	localparam integer intSize8 = 6;
	
	/* Division lenghts */
	localparam integer x2divSize = max(sizeFact2 + 1, intSize2 + decimalBits);
	localparam integer x4divSize = max(sizeFact4 + 1, intSize4 + decimalBits);
	localparam integer x6divSize = max(sizeFact6 + 1, intSize6 + decimalBits);
	localparam integer x8divSize = max(sizeFact8 + 1, intSize8 + decimalBits);
	
	/* Lengthened params */
	localparam [(x2divSize - 1):0] fact2 = fact2_param[(x2divSize - 1):0];
	localparam [(x4divSize - 1):0] fact4 = fact4_param[(x4divSize - 1):0];
	localparam [(x6divSize - 1):0] fact6 = fact6_param[(x6divSize - 1):0];
	localparam [(x8divSize - 1):0] fact8 = fact8_param[(x8divSize - 1):0];
	
	/* x mod pi_2 */
	localparam integer pi_2_param = 3.1415926535897932384626433832795028841971693993751 * 0.5 * 2**decimalBits;
	localparam integer pi_2_size = logb2(pi_2_param);
	
	wire signed [(intBits + decimalBits):0] unsignedX;
	assign unsignedX = 	x & {(intBits + decimalBits + 1){~x[intBits + decimalBits]}} |
								-x & {(intBits + decimalBits + 1){x[intBits + decimalBits]}};
	
	wire signed [(decimalBits + intBits - 1):0] pi_2 = pi_2_param;
	wire signed [(decimalBits + intSize1):0] pi_2_short = pi_2[(decimalBits + intSize1):0];
	
	wire signed [(decimalBits + intBits):0] pi_2_overflows;
	wire signed [(decimalBits + intBits - 1):0] preModX;
	wire signed [(decimalBits + intSize1):0] modX;
	
	BoothsDiv #(decimalBits + intBits) modCalc (unsignedX, pi_2, pi_2_overflows, preModX);
	
	wire [(decimalBits + intSize1):0] preModX_rez = {preModX[decimalBits + intBits - 1], preModX[(decimalBits + intSize1 - 1):0]};
	assign modX = 	preModX_rez & {(decimalBits + intSize1 + 1){~pi_2_overflows[0]}} |
						(pi_2_short - preModX_rez) & {(decimalBits + intSize1 + 1){pi_2_overflows[0]}};
	
	wire signed [(1 + decimalBits):0] signLessY;
	
	/* Polinomial */
	generate
		
		/* ... - x**2/2! */
		wire signed [(2*decimalBits + 2*intSize1 + 1):0] preX2;
		wire signed [(decimalBits + intSize2):0] x2;
		
		BoothsMult #(decimalBits + intSize1, decimalBits + intSize1) x2Calc(modX, modX, preX2);

		assign x2 = preX2[(2*decimalBits + intSize2):decimalBits];
		
		wire signed [(x2divSize):0] x2_2;
		wire signed [(x2divSize - 1):0] x2_2_rem;
		
		wire signed [x2divSize:0] re_x2;
		if(x2divSize <= decimalBits + intSize2) begin : x2_normalSize
			assign re_x2 = x2[x2divSize:0];
		end else begin : x2_reSize
			assign re_x2 = {{(x2divSize - (decimalBits + intSize2)){x2[decimalBits + intSize2]}}, x2[(decimalBits + intSize2):0]};
		end
		BoothsDiv #(x2divSize) div2Calc (re_x2, fact2, x2_2, x2_2_rem);
		
		wire signed [(1 + decimalBits):0] one;
		assign one[(decimalBits - 1):0] = 0;
		assign one[decimalBits] = 1;
		assign one[decimalBits + 1] = 0;
		
		wire signed [(1 + decimalBits):0] poly_1_Value = one - x2_2[(1 + decimalBits):0];
		
		/* ... + x**4/4! */
		if(decimalBits > 3) begin : poly_2
			
			wire signed [(2*decimalBits + intSize2 + intSize2 + 1):0] preX4;
			wire signed [(decimalBits + intSize4):0] x4;
			
			BoothsMult #(decimalBits + intSize2, decimalBits + intSize2) x4Calc(x2, x2, preX4);

			assign x4 = preX4[(2*decimalBits + intSize4):decimalBits];
			
			wire signed [(x4divSize):0] x4_4;
			wire signed [(x4divSize - 1):0] x4_4_rem;
			
			wire signed [x4divSize:0] re_x4;
			if(x4divSize <= decimalBits + intSize4) begin : x4_normalSize
				assign re_x4 = x4[x4divSize:0];
			end else begin : x4_reSize
				assign re_x4 = {{(x4divSize - (decimalBits + intSize4)){x4[decimalBits + intSize4]}}, x4[(decimalBits + intSize4):0]};
			end
			BoothsDiv #(x4divSize) div4Calc (re_x4, fact4, x4_4, x4_4_rem);
			
			wire signed [(1 + decimalBits):0] poly_2_Value = poly_1_Value + x4_4[(1 + decimalBits):0];
			
			/* ... - x**6/6! */
			if(decimalBits > 7) begin : poly_3
			
				wire signed [(2*decimalBits + intSize2 + intSize4 + 1):0] preX6;
				wire signed [(decimalBits + intSize6):0] x6;
				
				BoothsMult #(decimalBits + intSize2, decimalBits + intSize4) x6Calc(x2, x4, preX6);

				assign x6 = preX6[(2*decimalBits + intSize6):decimalBits];
				
				wire signed [(x6divSize):0] x6_6;
				wire signed [(x6divSize - 1):0] x6_6_rem;
				
				wire signed [x6divSize:0] re_x6;
				if(x6divSize <= decimalBits + intSize6) begin : x6_normalSize
					assign re_x6 = x6[x6divSize:0];
				end else begin : x6_reSize
					assign re_x6 = {{(x6divSize - (decimalBits + intSize6)){x6[decimalBits + intSize6]}}, x6[(decimalBits + intSize6):0]};
				end
				BoothsDiv #(x6divSize) div6Calc (re_x6, fact6, x6_6, x6_6_rem);
				
				wire signed [(1 + decimalBits):0] poly_3_Value = poly_2_Value - x6_6[(1 + decimalBits):0];
				
				/* ... + x**8/8! */
				if(decimalBits > 12) begin : poly_4
				
					wire signed [(2*decimalBits + intSize2 + intSize6 + 1):0] preX8;
					wire signed [(decimalBits + intSize8):0] x8;
					
					BoothsMult #(decimalBits + intSize2, decimalBits + intSize6) x8Calc(x2, x6, preX8);

					assign x8 = preX8[(2*decimalBits + intSize8):decimalBits];
					
					wire signed [(x8divSize):0] x8_8;
					wire signed [(x8divSize - 1):0] x8_8_rem;
					
					if(x8divSize <= decimalBits + intSize8) begin : x8_normalSize
						wire signed [x8divSize:0] re_x8 = x8[x8divSize:0];
					end else begin : x8_reSize
						wire signed [x8divSize:0] re_x8 = {{(x8divSize - (decimalBits + intSize8)){x8[decimalBits + intSize8]}}, x8[(decimalBits + intSize8):0]};
					end
					BoothsDiv #(x8divSize) div8Calc (re_x8, fact8, x8_8, x8_8_rem);
					
					wire signed [(1 + decimalBits):0] poly_4_Value = poly_3_Value + x8_8[(1 + decimalBits):0];
					assign signLessY = poly_4_Value;
					
				end else begin : poly_3_apply
					assign signLessY = poly_3_Value;
				end
				
			end else begin : poly_2_apply
				assign signLessY = poly_2_Value;
			end
			
		end else begin : poly_1_apply
			assign signLessY = poly_1_Value;
		end
		
		
	endgenerate
	
	
	wire invertSign = pi_2_overflows[0] ^ pi_2_overflows[1];
	assign y = 	signLessY & {(intBits + decimalBits + 1){~invertSign}} |
					-signLessY & {(intBits + decimalBits + 1){invertSign}};


endmodule
