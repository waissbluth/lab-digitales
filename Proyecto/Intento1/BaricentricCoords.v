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
	( 	input signed [intBits:0] x_0, y_0, x_1, y_1, x_2, y_2,
		input [(evalBits - 1):0] evalX, evalY,
		output signed [(intBits + decimalBits):0] lambda_0, lambda_1, lambda_2,
		output inTris);
		
	wire signed [intBits:0] A, B, C, D;
	assign A = y_1 - y_2;
	assign B = x_2 - x_1;
	assign C = y_2 - y_0;
	assign D = x_0 - x_2;
	
	wire signed [intBits:0] signedX; 
	wire signed [intBits:0] signedY;
	
	generate
		if(intBits >= evalBits) begin : normalEval
			assign signedX = {{(1 + intBits - evalBits){1'b0}}, evalX};
			assign signedY = {{(1 + intBits - evalBits){1'b0}}, evalY};
		end else begin : truncatedEval
			assign signedX = {1'b0, evalX[(intBits - 1):0]};
			assign signedY = {1'b0, evalY[(intBits - 1):0]};
		end
	endgenerate
	
	wire signed [intBits:0] x_x2 = signedX - x_2;
	wire signed [intBits:0] y_y2 = signedY - y_2;
	
	wire signed [(2*intBits + 1):0] AD, BC;
	
	BoothsMult #(intBits, intBits) adCalc(A, D, AD);
	BoothsMult #(intBits, intBits) bcCalc(B, C, BC);
	
	wire signed [(2*intBits + 1):0] detT = AD - BC;
	
	wire signed [(2*intBits + 1):0] Ax_x2, By_y2, Cx_x2, Dy_y2;
	
	BoothsMult #(intBits, intBits) Ax_x2Calc(x_x2, A[intBits:0], Ax_x2);
	BoothsMult #(intBits, intBits) By_y2Calc(y_y2, B[intBits:0], By_y2);
	BoothsMult #(intBits, intBits) Cx_x2Calc(x_x2, C[intBits:0], Cx_x2);
	BoothsMult #(intBits, intBits) Dy_y2Calc(y_y2, D[intBits:0], Dy_y2);
	
	wire signed [2*intBits:0] lambda_0_unscaled, lambda_1_unscaled;
	assign lambda_0_unscaled = Ax_x2[2*intBits:0] + By_y2[2*intBits:0];
	assign lambda_1_unscaled = Cx_x2[2*intBits:0] + Dy_y2[2*intBits:0];
	
	wire signed [(2*intBits - 1):0] postDetT = {{(decimalBits - 1){detT[(2*intBits + 1)]}}, detT[2*intBits:decimalBits]};
	wire signed [2*intBits:0] extendedLambda_0, extendedLambda_1;
	wire signed [(2*intBits - 1):0] extendedLambda_0_rem, extendedLambda_1_rem;
	
	BoothsDiv #(2*intBits) lambda_0Calc(lambda_0_unscaled, postDetT, extendedLambda_0, extendedLambda_0_rem);
	BoothsDiv #(2*intBits) lambda_1Calc(lambda_1_unscaled, postDetT, extendedLambda_1, extendedLambda_1_rem);
	
	wire signed [(intBits + decimalBits):0] one;
	assign one[(decimalBits - 1):0] = 0;
	assign one[decimalBits] = 1;
	assign one[(intBits + decimalBits):(decimalBits + 1)] = 0;
	
	assign lambda_0 = {extendedLambda_0[2*intBits], extendedLambda_0[(intBits + decimalBits - 1):0]};
	assign lambda_1 = {extendedLambda_1[2*intBits], extendedLambda_1[(intBits + decimalBits - 1):0]};
	assign lambda_2 = one - lambda_1 - lambda_0;
	
	assign inTris = !(lambda_0[(intBits + decimalBits)] | lambda_1[(intBits + decimalBits)] | lambda_2[(intBits + decimalBits)]);
	

endmodule
