`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:22 10/17/2014 
// Design Name: 
// Module Name:    PianoKeys 
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

/* Colores salida:
	0 - nada
	1 - tecla blanca up
	2 - tecla blanca down
	3 - tecla negra up
	4 - tecla negra down */
module PianoKeys
	#( parameter posBits = 10, parameter dimBits = 10, parameter octaves = 2)
	(	input clk,
		input [(dimBits - 1):0] keyWidth, keyHeight, keySpace,
		input [(posBits - 1):0] posX, posY, evalX, evalY,
		input [(12 * octaves - 1):0] pressed,
		
		output reg [2:0] color );

		parameter empty = 0;
		parameter wUp = 1;
		parameter wDown = 2;
		parameter bUp = 3;
		parameter bDown = 4;

		/* Dimensiones teclas */
		wire [(dimBits - 1):0] blackHeight, blackWidth, maskHeight, maskWidth;
		IntMult #((dimBits - 3), 3) blackHeightMult({0, keyHeight[(dimBits - 1):4]}, 3'b111, blackHeight);
		IntMult #((dimBits - 2), 2) blackWidthMult({0, keyWidth[(dimBits - 1):3]}, 3'b11, blackWidth);
		
		assign maskHeight = blackHeight + keySpace * 2;
		assign maskWidth = blackWidth + keySpace * 2;
		
		/* Posiciones en Y */
		wire [(posBits - 1):0] whitePosY, blackPosY;
		assign whitePosY = posY + (keyHeight>>1);
		assign blackPosY = (posY + keyHeight) - (blackHeight>>1) - {{(posBits - 1){1'b0}}, !keyHeight[0]};
		
		/* Posiciones Blancas X */
		wire [(dimBits - 1):0] whiteOffset, octaveOffset;
		assign whiteOffset = keyWidth + keySpace;
		
		IntMult #((dimBits - 3), 3) offsetCalc({whiteOffset[(dimBits - 4):0]}, 3'b111, octaveOffset);
		wire [((dimBits + 3)*octaves - 1):0] octavesOffset;
		
		genvar ii;
		generate
			for(ii = 0; ii < octaves; ii = ii + 1) begin : octavesGen
				IntMult #(dimBits, 3) offsetMult(octaveOffset[(dimBits - 1):0], ii, octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))]);
			end
		endgenerate
		
		wire [(posBits*octaves - 1):0] wDoPosX, wRePosX, wMiPosX, wFaPosX, wSolPosX, wLaPosX, wSiPosX;
		
		generate
			for(ii = 0; ii < octaves; ii = ii + 1) begin : whitePosX
				assign wDoPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + keyWidth/2 + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign wRePosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + keyWidth/2 + whiteOffset + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign wMiPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + keyWidth/2 + whiteOffset*2 + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign wFaPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + keyWidth/2 + whiteOffset*2 + whiteOffset + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign wSolPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + keyWidth/2 + whiteOffset*4 + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign wLaPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + keyWidth/2 + whiteOffset*4 + whiteOffset + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign wSiPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + keyWidth/2 + whiteOffset*4 + whiteOffset*2 + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
			end
		endgenerate

		/* Posiciones Negras X */
		wire [(posBits*octaves - 1):0] bDoPosX, bRePosX, bFaPosX, bSolPosX, bLaPosX;

		generate
			for(ii = 0; ii < octaves; ii = ii + 1) begin : blackPosX
				assign bDoPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + whiteOffset - keyWidth/8 + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign bRePosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + whiteOffset*2 + keyWidth/8 + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];

				assign bFaPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + whiteOffset*4 - keyWidth/8 + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign bSolPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + whiteOffset*4 + whiteOffset + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
				assign bLaPosX[(posBits - 1 + ii*posBits):(ii*posBits)] = posX + whiteOffset*4 + whiteOffset*2 + keyWidth/8 + octavesOffset[(dimBits - 1 + ii*(dimBits + 3)):(ii*(dimBits + 3))];
			end
		endgenerate
		
		/* Colisiones blancas */
		wire doCollision[(octaves - 1):0];
		wire reCollision[(octaves - 1):0];
		wire miCollision[(octaves - 1):0];
		wire faCollision[(octaves - 1):0];
		wire solCollision[(octaves - 1):0];
		wire laCollision[(octaves - 1):0];
		wire siCollision[(octaves - 1):0];
		
		
		/* Colisiones mascaras * /
		wire doSMCollision[(octaves - 1):0];
		wire reSMCollision[(octaves - 1):0];
		wire faSMCollision[(octaves - 1):0];
		wire solSMCollision[(octaves - 1):0];
		wire laSMCollision[(octaves - 1):0];
		/**/
		
		/* Colisiones negras */
		wire doSCollision[(octaves - 1):0];
		wire reSCollision[(octaves - 1):0];
		wire faSCollision[(octaves - 1):0];
		wire solSCollision[(octaves - 1):0];
		wire laSCollision[(octaves - 1):0];
		
		generate
			for(ii = 0; ii < octaves; ii = ii + 1) begin : collisionModules //TODO polish
		
				/*** Layer: White ***/
				IsInIntRect #(posBits, dimBits) wDo(keyWidth, keyHeight, wDoPosX[(posBits - 1 + ii*posBits):(ii*posBits)], whitePosY, evalX, evalY, doCollision[ii]);	
				IsInIntRect #(posBits, dimBits) wRe(keyWidth, keyHeight, wRePosX[(posBits - 1 + ii*posBits):(ii*posBits)], whitePosY, evalX, evalY, reCollision[ii]);	
				IsInIntRect #(posBits, dimBits) wMi(keyWidth, keyHeight, wMiPosX[(posBits - 1 + ii*posBits):(ii*posBits)], whitePosY, evalX, evalY, miCollision[ii]);	
				IsInIntRect #(posBits, dimBits) wFa(keyWidth, keyHeight, wFaPosX[(posBits - 1 + ii*posBits):(ii*posBits)], whitePosY, evalX, evalY, faCollision[ii]);	
				IsInIntRect #(posBits, dimBits) wSol(keyWidth, keyHeight, wSolPosX[(posBits - 1 + ii*posBits):(ii*posBits)], whitePosY, evalX, evalY, solCollision[ii]);	
				IsInIntRect #(posBits, dimBits) wLa(keyWidth, keyHeight, wLaPosX[(posBits - 1 + ii*posBits):(ii*posBits)], whitePosY, evalX, evalY, laCollision[ii]);	
				IsInIntRect #(posBits, dimBits) wSi(keyWidth, keyHeight, wSiPosX[(posBits - 1 + ii*posBits):(ii*posBits)], whitePosY, evalX, evalY, siCollision[ii]);	

				/*** Layer: Mask 
				IsInIntRect #(posBits, dimBits) bDoMask(maskWidth, maskHeight, bDoPosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, doSMCollision[ii]);
				IsInIntRect #(posBits, dimBits) bReMask(maskWidth, maskHeight, bRePosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, reSMCollision[ii]);
				IsInIntRect #(posBits, dimBits) bFaMask(maskWidth, maskHeight, bFaPosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, faSMCollision[ii]);		
				IsInIntRect #(posBits, dimBits) bSolMask(maskWidth, maskHeight, bSolPosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, solSMCollision[ii]);
				IsInIntRect #(posBits, dimBits) bLaMask(maskWidth, maskHeight, bLaPosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, laSMCollision[ii]);
				***/
				
				/*** Layer Black ***/
				IsInIntRect #(posBits, dimBits) bDo(blackWidth, blackHeight, bDoPosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, doSCollision[ii]);
				IsInIntRect #(posBits, dimBits) bRe(blackWidth, blackHeight, bRePosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, reSCollision[ii]);
				IsInIntRect #(posBits, dimBits) bFa(blackWidth, blackHeight, bFaPosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, faSCollision[ii]);
				IsInIntRect #(posBits, dimBits) bSol(blackWidth, blackHeight, bSolPosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, solSCollision[ii]);
				IsInIntRect #(posBits, dimBits) bLa(blackWidth, blackHeight, bLaPosX[(posBits - 1 + ii*posBits):(ii*posBits)], blackPosY, evalX, evalY, laSCollision[ii]);
			end
		endgenerate
		
		reg [(3*octaves - 1):0] octaveColor;
		wire [(octaves - 1):0] octaveCollision;
		
		reg [(octaves - 1):0] color0, color1, color2;
		
		generate
			for(ii = 0; ii < octaves; ii = ii + 1) begin : colorGen
		
				assign octaveCollision[ii] =	doSCollision[ii] |
														reSCollision[ii] |
														faSCollision[ii] |
														solSCollision[ii] |
														laSCollision[ii] |
														//doSMCollision[ii] |
														//reSMCollision[ii] |
														//faSMCollision[ii] |
														//solSMCollision[ii] |
														//laSMCollision[ii] |
														doCollision[ii] |
														reCollision[ii] |
														miCollision[ii] |
														faCollision[ii] |
														solCollision[ii] |
														laCollision[ii] |
														siCollision[ii] ;
		
				always @(posedge clk)
				begin
					/* Blacks */
					if(doSCollision[ii] & pressed[1 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bDown;
					else if(doSCollision[ii] & !pressed[1 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bUp;
					
					else if(reSCollision[ii] & pressed[3 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bDown;
					else if(reSCollision[ii] & !pressed[3 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bUp;
					
					else if(faSCollision[ii] & pressed[6 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bDown;
					else if(faSCollision[ii] & !pressed[6 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bUp;
					
					else if(solSCollision[ii] & pressed[8 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bDown;
					else if(solSCollision[ii] & !pressed[8 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bUp;
					
					else if(laSCollision[ii] & pressed[10 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bDown;
					else if(laSCollision[ii] & !pressed[10 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= bUp;
					
					/* Masks 
					else if(doSMCollision[ii]) octaveColor[(ii*3 + 2):(ii*3)] <= empty;
					else if(reSMCollision[ii]) octaveColor[(ii*3 + 2):(ii*3)] <= empty;
					else if(faSMCollision[ii]) octaveColor[(ii*3 + 2):(ii*3)] <= empty;
					else if(solSMCollision[ii]) octaveColor[(ii*3 + 2):(ii*3)] <= empty;
					else if(laSMCollision[ii]) octaveColor[(ii*3 + 2):(ii*3)] <= empty;
					*/
					
					/* Whites */
					else if(doCollision[ii] & pressed[0 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wDown;
					else if(doCollision[ii] & !pressed[0 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wUp;
					
					else if(reCollision[ii] & pressed[2 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wDown;
					else if(reCollision[ii] & !pressed[2 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wUp;
					
					else if(miCollision[ii] & pressed[4 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wDown;
					else if(miCollision[ii] & !pressed[4 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wUp;
					
					else if(faCollision[ii] & pressed[5 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wDown;
					else if(faCollision[ii] & !pressed[5 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wUp;
					
					else if(solCollision[ii] & pressed[7 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wDown;
					else if(solCollision[ii] & !pressed[7 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wUp;
					
					else if(laCollision[ii] & pressed[9 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wDown;
					else if(laCollision[ii] & !pressed[9 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wUp;
					
					else if(siCollision[ii] & pressed[11 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wDown;
					else if(siCollision[ii] & !pressed[11 + ii*12]) octaveColor[(ii*3 + 2):(ii*3)] <= wUp;
					
					else octaveColor[(ii*3 + 2):(ii*3)] <= empty;
					
					color0[ii] = octaveColor[(ii*3)] & octaveCollision[ii];
					color1[ii] = octaveColor[(ii*3 + 1)] & octaveCollision[ii];
					color2[ii] = octaveColor[(ii*3 + 2)] & octaveCollision[ii];
				end
			end
			
		endgenerate
		
		always@(*)
		begin
			color[0] = |(color0);
			color[1] = |(color1);
			color[2] = |(color2);
		end

endmodule
