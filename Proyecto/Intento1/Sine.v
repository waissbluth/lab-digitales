`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:10 11/07/2014 
// Design Name: 
// Module Name:    Sine 
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
module Sine
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
	localparam integer signed fact3_param = 6;
	localparam integer signed fact5_param = 120;
	localparam integer signed fact7_param = 5040;
	localparam integer signed fact9_param = 362880;
	
	localparam integer sizeFact3 = logb2(fact3_param);
	localparam integer sizeFact5 = logb2(fact5_param);
	localparam integer sizeFact7 = logb2(fact7_param);
	localparam integer sizeFact9 = logb2(fact9_param);
	
	/* Bits integer de (pi/2)**N */
	localparam integer intSize1 = 1;
	localparam integer intSize2 = 2;
	localparam integer intSize3 = 2;
	localparam integer intSize5 = 4;
	localparam integer intSize7 = 5;
	localparam integer intSize9 = 6;
	
	/* Division lenghts */
	localparam integer x3divSize = max(sizeFact3 + 1, intSize3 + decimalBits);
	localparam integer x5divSize = max(sizeFact5 + 1, intSize5 + decimalBits);
	localparam integer x7divSize = max(sizeFact7 + 1, intSize7 + decimalBits);
	localparam integer x9divSize = max(sizeFact9 + 1, intSize9 + decimalBits);
	
	/* Lengthened params */
	localparam [(x3divSize - 1):0] fact3 = fact3_param[(x3divSize - 1):0];
	localparam [(x5divSize - 1):0] fact5 = fact5_param[(x5divSize - 1):0];
	localparam [(x7divSize - 1):0] fact7 = fact7_param[(x7divSize - 1):0];
	localparam [(x9divSize - 1):0] fact9 = fact9_param[(x9divSize - 1):0];
	
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
	
	/* x**2 */
	wire signed [(2*decimalBits + 2*intSize1 + 1):0] preX2;
	wire signed [(decimalBits + intSize2):0] x2;
	
	BoothsMult #(decimalBits + intSize1, decimalBits + intSize1) x2Calc(modX, modX, preX2);

	assign x2 = preX2[(2*decimalBits + intSize2):decimalBits];
	wire signed [(1 + decimalBits):0] signLessY;
	
	/* Polinomial */
	generate
		
		/* ... - x**3/3! */
		wire signed [(2*decimalBits + intSize1 + intSize2 + 1):0] preX3;
		wire signed [(decimalBits + intSize3):0] x3;
		
		BoothsMult #(decimalBits + intSize1, decimalBits + intSize2) x3Calc(modX, x2, preX3);

		assign x3 = preX3[(2*decimalBits + intSize3):decimalBits];
		
		wire signed [(x3divSize):0] x3_3;
		wire signed [(x3divSize - 1):0] x3_3_rem;
		
		wire signed [x3divSize:0] re_x3;
		if(x3divSize <= decimalBits + intSize3) begin : x3_normalSize
			assign re_x3 = x3[x3divSize:0];
		end else begin : x3_reSize
			assign re_x3 = {{(x3divSize - (decimalBits + intSize3)){x3[decimalBits + intSize3]}}, x3[(decimalBits + intSize3):0]};
		end
		BoothsDiv #(x3divSize) div3Calc (re_x3, fact3, x3_3, x3_3_rem);
		
		wire signed [(1 + decimalBits):0] poly_1_Value = modX - x3_3[(1 + decimalBits):0];
		
		/* ... + x**5/5! */
		if(decimalBits > 3) begin : poly_2
			
			wire signed [(2*decimalBits + intSize2 + intSize3 + 1):0] preX5;
			wire signed [(decimalBits + intSize5):0] x5;
			
			BoothsMult #(decimalBits + intSize2, decimalBits + intSize3) x5Calc(x2, x3, preX5);

			assign x5 = preX5[(2*decimalBits + intSize5):decimalBits];
			
			wire signed [(x5divSize):0] x5_5;
			wire signed [(x5divSize - 1):0] x5_5_rem;
			
			wire signed [x5divSize:0] re_x5;
			if(x5divSize <= decimalBits + intSize5) begin : x5_normalSize
				 assign re_x5 = x5[x5divSize:0];
			end else begin : x5_reSize
				assign re_x5 = {{(x5divSize - (decimalBits + intSize5)){x5[decimalBits + intSize5]}}, x5[(decimalBits + intSize5):0]};
			end
			BoothsDiv #(x5divSize) div5Calc (re_x5, fact5, x5_5, x5_5_rem);
			
			wire signed [(1 + decimalBits):0] poly_2_Value = poly_1_Value + x5_5[(1 + decimalBits):0];
			
			/* ... - x**7/7! */
			if(decimalBits > 7) begin : poly_3
			
				wire signed [(2*decimalBits + intSize2 + intSize5 + 1):0] preX7;
				wire signed [(decimalBits + intSize7):0] x7;
				
				BoothsMult #(decimalBits + intSize2, decimalBits + intSize5) x7Calc(x2, x5, preX7);

				assign x7 = preX7[(2*decimalBits + intSize7):decimalBits];
				
				wire signed [(x7divSize):0] x7_7;
				wire signed [(x7divSize - 1):0] x7_7_rem;
				
				wire signed [x7divSize:0] re_x7;
				if(x7divSize <= decimalBits + intSize7) begin : x7_normalSize
					assign re_x7 = x7[x7divSize:0];
				end else begin : x7_reSize
					assign re_x7 = {{(x7divSize - (decimalBits + intSize7)){x7[decimalBits + intSize7]}}, x7[(decimalBits + intSize7):0]};
				end
				BoothsDiv #(x7divSize) div7Calc (re_x7, fact7, x7_7, x7_7_rem);
				
				wire signed [(1 + decimalBits):0] poly_3_Value = poly_2_Value - x7_7[(1 + decimalBits):0];
				
				/* ... + x**9/9! */
				if(decimalBits > 12) begin : poly_4
				
					wire signed [(2*decimalBits + intSize2 + intSize7 + 1):0] preX9;
					wire signed [(decimalBits + intSize9):0] x9;
					
					BoothsMult #(decimalBits + intSize2, decimalBits + intSize7) x9Calc(x2, x7, preX9);

					assign x9 = preX9[(2*decimalBits + intSize9):decimalBits];
					
					wire signed [(x9divSize):0] x9_9;
					wire signed [(x9divSize - 1):0] x9_9_rem;
					
					wire signed [x9divSize:0] re_x9;
					if(x9divSize <= decimalBits + intSize9) begin : x9_normalSize
						assign re_x9 = x9[x9divSize:0];
					end else begin : x9_reSize
						assign re_x9 = {{(x9divSize - (decimalBits + intSize9)){x9[decimalBits + intSize5]}}, x9[(decimalBits + intSize9):0]};
					end
					BoothsDiv #(x9divSize) div9Calc (re_x9, fact9, x9_9, x9_9_rem);
					
					wire signed [(1 + decimalBits):0] poly_4_Value = poly_3_Value + x9_9[(1 + decimalBits):0];
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
	
	
	wire invertSign = pi_2_overflows[1] ^ x[intBits + decimalBits];
	assign y = 	signLessY & {(intBits + decimalBits + 1){~invertSign}} |
					-signLessY & {(intBits + decimalBits + 1){invertSign}};


endmodule
