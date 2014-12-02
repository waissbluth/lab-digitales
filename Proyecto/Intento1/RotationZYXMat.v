`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:09:44 11/15/2014 
// Design Name: 
// Module Name:    RotationZYXMat 
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
module RotationZYXMat
	#(	parameter decimalBits = 8)
	(	input clk, reset,
		input signed [(decimalBits + 2):0] rot_x, rot_y, rot_z,
		input inputEnable,
		output reg signed [(decimalBits + 1):0] m_00, m_01, m_02,
		output reg signed [(decimalBits + 1):0] m_10, m_11, m_12,
		output reg signed [(decimalBits + 1):0] m_20, m_21, m_22,
		output reg outputEnable);
		
		/* OUTPUT Matrix = [rot Z][rot Y][rot X] =
		
			CyCz		SxSyCz - CxSz		CxSyCz + SxSz
			CySz		SxSySz + CxCz		CxSySz - SxCz
			-Sy		SxCy					CxCy
		*/
		
		/* STEPS (counter):
		* 0	- inputEnable -> 1	+ rot to regs				+ activeRot -> rot_x		+ work -> 1
		* 1	- Save Cx, Sx			+ activeRot -> rot_y
		* 2	- Save Cy, Sy			+ activeRot -> rot_z
		* 3	- Save Cz, Sz			+ calculate SxSy
		* 4	- Save SxSy				+ calculate SxCy
		* 5	- Save SxCy				+ calculate SxSz
		* 6	- Save SxSz				+ calculate SxCz
		* 7	- Save SxCz				+ calculate CxSy
		* 8	- Save CxSy				+ calculate CxSz
		* 9	- Save CxSz				+ calculate CxCy
		* 10	- Save CxCy				+ calculate CxCz
		* 11	- Save CxCz				+ calculate CySz
		* 12	- Save CySz				+ calculate CyCz
		* 13	- Save CyCz				+ calculate SxSySz
		* 14	- Save SxSySz			+ calculate SxSyCz
		* 15	- Save SxSyCz			+ calculate CxSySz
		* 16	- Save CxSySz			+ calculate CxSyCz
		* 17	- Use CxSyCz			+ Assign values			+ outputEnable -> 1
		* 18	- outputEnable -> 0
		*/

		reg signed [(decimalBits + 2):0] rot_active, rot_y_reg, rot_z_reg;
		reg signed [(decimalBits + 1):0] Cx, Sx, Cy, Sy, Cz, Sz;
		reg signed [(decimalBits + 1):0] SxSy, SxCy, SxSz, SxCz, CxSy, CxSz, CxCy, CxCz, CySz, CyCz;
		reg signed [(decimalBits + 1):0] SxSySz, SxSyCz, CxSySz;
		wire signed [(decimalBits + 1):0] Cactive, Sactive;
		
		Cosine #(2, decimalBits) cosineCalc(rot_active, Cactive);
		Sine #(2, decimalBits) sineCalc(rot_active, Sactive);
		
		reg signed [(decimalBits + 1):0] a_active, b_active;
		wire signed [(decimalBits + 1):0] mult_active;
		wire signed [(decimalBits*2 + 3):0] pre_mult_active;
		
		BoothsMult #(decimalBits + 1, decimalBits + 1) multCalc(a_active, b_active, pre_mult_active);
		assign mult_active = pre_mult_active[(decimalBits*2 + 1):decimalBits];
		
		reg work;
		wire [4:0] state;
		wire stateOverflow;
		
		StaticCounter #(19) stateCounter(clk, work, inputEnable, state, stateOverflow);

		always @(posedge clk)
		begin
			if(reset)
			begin
				work <= 0;
				outputEnable <= 0;
			end else begin
			
				case(state)
					0: begin
						rot_active <= rot_x;
						rot_y_reg <= rot_y;
						rot_z_reg <= rot_z;
						work <= 1;
					end 1: begin
						Cx <= Cactive;
						Sx <= Sactive;
						rot_active <= rot_y_reg;
					end 2: begin
						Cy <= Cactive;
						Sy <= Sactive;
						rot_active <= rot_z_reg;
					end 3: begin
						Cz <= Cactive;
						Sz <= Sactive;
						a_active <= Sx;
						b_active <= Sy;
					end 4: begin
						SxSy <= mult_active;
						a_active <= Sx;
						b_active <= Cy;
					end 5: begin
						SxCy <= mult_active;
						a_active <= Sx;
						b_active <= Sz;
					end 6: begin
						SxSz <= mult_active;
						a_active <= Sx;
						b_active <= Cz;
					end 7: begin
						SxCz <= mult_active;
						a_active <= Cx;
						b_active <= Sy;
					end 8: begin
						CxSy <= mult_active;
						a_active <= Cx;
						b_active <= Cy;
					end 9: begin
						CxCy <= mult_active;
						a_active <= Cx;
						b_active <= Sz;
					end 10: begin
						CxSz <= mult_active;
						a_active <= Cx;
						b_active <= Cz;
					end 11: begin
						CxCz <= mult_active;
						a_active <= Cy;
						b_active <= Sz;
					end 12: begin
						CySz <= mult_active;
						a_active <= Cy;
						b_active <= Cz;
					end 13: begin
						CyCz <= mult_active;
						a_active <= SxSy;
						b_active <= Sz;
					end 14: begin
						SxSySz <= mult_active;
						a_active <= SxSy;
						b_active <= Cz;
					end 15: begin
						SxSyCz <= mult_active;
						a_active <= CxSy;
						b_active <= Sz;
					end 16: begin
						CxSySz <= mult_active;
						a_active <= CxSy;
						b_active <= Cz;
					end 17: begin
						m_00 <= CyCz;
						m_01 <= SxSyCz - CxSz;
						m_02 <= mult_active + SxSz;
						
						m_10 <= CySz;
						m_11 <= SxSySz + CxCz;
						m_12 <= CxSySz - SxCz;
						
						m_20 <= -Sy;
						m_21 <= SxCy;
						m_22 <= CxCy;
						
						outputEnable <= 1;
					end default: begin
						outputEnable <= 0;
						work <= 0;
					end
				endcase
			end
		end

endmodule
