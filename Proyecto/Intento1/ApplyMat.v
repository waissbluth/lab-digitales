`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:40:23 11/15/2014 
// Design Name: 
// Module Name:    ApplyMat 
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
module ApplyMat
	#(parameter intBits = 8,	parameter decimalBits = 8)
	(	input clk, reset,
		
		input signed [(intBits + decimalBits):0] inVec_x, inVec_y, inVec_z,
		input signed [(intBits + decimalBits):0] m_00, m_01, m_02,
		input signed [(intBits + decimalBits):0] m_10, m_11, m_12,
		input signed [(intBits + decimalBits):0] m_20, m_21, m_22,
		input inputEnable,
		
		output reg signed [(intBits + decimalBits):0] outVec_x, outVec_y, outVec_z,
		output reg outputEnable);
	 
		reg signed [(intBits + decimalBits):0] inVec_x_reg, inVec_y_reg, inVec_z_reg;
		reg signed [(intBits + decimalBits):0] m_01_reg, m_02_reg;
		reg signed [(intBits + decimalBits):0] m_10_reg, m_11_reg, m_12_reg;
		reg signed [(intBits + decimalBits):0] m_20_reg, m_21_reg, m_22_reg;
		
		reg signed [(intBits + decimalBits):0] a_active, b_active;
		wire signed [(intBits + decimalBits):0] mult_active;
		wire signed [((intBits + decimalBits)*2 + 1):0] pre_mult_active;
		
		BoothsMult #(intBits + decimalBits, intBits + decimalBits) multCalc(a_active, b_active, pre_mult_active);
		assign mult_active = pre_mult_active[(intBits + decimalBits*2):decimalBits];
		
		reg work;
		wire [3:0] state;
		wire stateOverflow;
		
		StaticCounter #(11) stateCounter(clk, work, inputEnable, state, stateOverflow);
		
		always @(posedge clk)
		begin
			if(reset)
			begin
				work <= 0;
				outputEnable <= 0;
			end else begin
			
				case(state)
					0: begin
						outVec_x <= 0;
						outVec_y <= 0;
						outVec_z <= 0;
						
						inVec_x_reg <= inVec_x;
						inVec_y_reg <= inVec_y;
						inVec_z_reg <= inVec_z;
						
						m_01_reg <= m_01;
						m_02_reg <= m_02;
						
						m_10_reg <= m_10;
						m_11_reg <= m_11;
						m_12_reg <= m_12;
						
						m_20_reg <= m_20;
						m_21_reg <= m_21;
						m_22_reg <= m_22;
						
						a_active <= inVec_x;
						b_active <= m_00;
						
						work <= 1;
					end 1: begin
						outVec_x <= mult_active;
						a_active <= inVec_y_reg;
						b_active <= m_01_reg;
					end 2: begin
						outVec_x <= outVec_x + mult_active;
						a_active <= inVec_z_reg;
						b_active <= m_02_reg;
					end 3: begin
						outVec_x <= outVec_x + mult_active;
						a_active <= inVec_x_reg;
						b_active <= m_10_reg;
					end 4: begin
						outVec_y <= mult_active;
						a_active <= inVec_y_reg;
						b_active <= m_11_reg;
					end 5: begin
						outVec_y <= outVec_y + mult_active;
						a_active <= inVec_z_reg;
						b_active <= m_12_reg;
					end 6: begin
						outVec_y <= outVec_y + mult_active;
						a_active <= inVec_x_reg;
						b_active <= m_20_reg;
					end 7: begin
						outVec_z <= mult_active;
						a_active <= inVec_y_reg;
						b_active <= m_21_reg;
					end 8: begin
						outVec_z <= outVec_z + mult_active;
						a_active <= inVec_z_reg;
						b_active <= m_22_reg;
					end 9: begin
						outVec_z <= outVec_z + mult_active;
						outputEnable <= 1;
					end default: begin
						outputEnable <= 0;
						work <= 0;
					end
				endcase
				
			end
			
		end
		

endmodule
