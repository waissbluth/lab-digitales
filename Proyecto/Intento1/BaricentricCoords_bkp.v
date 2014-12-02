`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:36:42 11/09/2014 
// Design Name: 
// Module Name:    BaricentricCoords 
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
module BaricentricCoords
	#(parameter evalBits = 8, parameter intBits = 4, parameter decimalBits = 8)
	( 	input signed [(intBits + decimalBits):0] x_0, y_0, x_1, y_1, x_2, y_2,
		input [(evalBits - 1):0] evalX, evalY,
		output signed [(intBits + decimalBits):0] lambda_0, lambda_1, lambda_2,
		output inTris);
		
	wire signed [(intBits + decimalBits):0] A, B, C, D;
	assign A = y_1 - y_2;
	assign B = x_2 - x_1;
	assign C = y_2 - y_0;
	assign D = x_0 - x_2;
	
	wire signed [(intBits + decimalBits):0] signedX; 
	wire signed [(intBits + decimalBits):0] signedY;
	
	generate
		if(intBits >= evalBits) begin : normalEval
			assign signedX = {{(1 + intBits - evalBits){1'b0}}, evalX, {(decimalBits){1'b0}}};
			assign signedY = {{(1 + intBits - evalBits){1'b0}}, evalY, {(decimalBits){1'b0}}};
		end else begin : truncatedEval
			assign signedX = {1'b0, evalX[(intBits - 1):0], {(decimalBits){1'b0}}};
			assign signedY = {1'b0, evalY[(intBits - 1):0], {(decimalBits){1'b0}}};
		end
	endgenerate
	
	wire signed [(intBits + decimalBits):0] x_x2 = signedX - x_2;
	wire signed [(intBits + decimalBits):0] y_y2 = signedY - y_2;
	
	wire signed [(2*(intBits + decimalBits) + 1):0] preAD, preBC;
	wire signed [(intBits + decimalBits):0] AD, BC;
	
	BoothsMult #(intBits + decimalBits, intBits + decimalBits) adCalc(A, D, preAD);
	BoothsMult #(intBits + decimalBits, intBits + decimalBits) bcCalc(B, C, preBC);
	
	assign AD = preAD[(intBits + 2*decimalBits):decimalBits];
	assign BC = preBC[(intBits + 2*decimalBits):decimalBits];
	
	wire signed [(intBits + decimalBits):0] detT = AD - BC;
	
	wire signed [(2*(intBits + decimalBits) + 1):0] preAx_x2, preBy_y2, preCx_x2, preDy_y2;
	
	BoothsMult #(intBits + decimalBits, intBits + decimalBits) Ax_x2Calc(A, x_x2, preAx_x2);
	BoothsMult #(intBits + decimalBits, intBits + decimalBits) By_y2Calc(B, y_y2, preBy_y2);
	BoothsMult #(intBits + decimalBits, intBits + decimalBits) Cx_x2Calc(C, x_x2, preCx_x2);
	BoothsMult #(intBits + decimalBits, intBits + decimalBits) Dy_y2Calc(D, y_y2, preDy_y2);
	
	wire signed [(intBits + 2*decimalBits):0] preLambda_0_unscaled, preLambda_1_unscaled;
	assign preLambda_0_unscaled = preAx_x2[(intBits + 2*decimalBits):0] + preBy_y2[(intBits + 2*decimalBits):0];
	assign preLambda_1_unscaled = preCx_x2[(intBits + 2*decimalBits):0] + preDy_y2[(intBits + 2*decimalBits):0];
	
	wire signed [(intBits + 2*decimalBits):0] extendedLambda_0, extendedLambda_1;
	wire signed [(intBits + 2*decimalBits - 1):0] extendedLambda_0_rem, extendedLambda_1_rem;
	wire signed [(intBits + 2*decimalBits - 1):0] extendedDetT = {{(decimalBits - 1){detT[intBits + decimalBits]}}, detT};
	
	BoothsDiv #(intBits + 2*decimalBits) lambda_0Calc(preLambda_0_unscaled, extendedDetT, extendedLambda_0, extendedLambda_0_rem);
	BoothsDiv #(intBits + 2*decimalBits) lambda_1Calc(preLambda_1_unscaled, extendedDetT, extendedLambda_1, extendedLambda_1_rem);
	
	wire signed [(intBits + decimalBits):0] one;
	assign one[(decimalBits - 1):0] = 0;
	assign one[decimalBits] = 1;
	assign one[(intBits + decimalBits):(decimalBits + 1)] = 0;
	
	assign lambda_0 = extendedLambda_0[(intBits + decimalBits):0];
	assign lambda_1 = extendedLambda_1[(intBits + decimalBits):0];
	assign lambda_2 = one - lambda_1 - lambda_0;
	
	assign inTris = !(|lambda_0[(intBits + decimalBits):decimalBits] |
							|lambda_1[(intBits + decimalBits):decimalBits] |
							|lambda_2[(intBits + decimalBits):decimalBits]);
	

endmodule
