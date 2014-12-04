`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:52 12/03/2014 
// Design Name: 
// Module Name:    score_print 
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
module score_print #(
		parameter H = 32,
		parameter V = 32,
		parameter size = 2,
		parameter spacing = 2
)(		
		input clk,
		input [(logb2(H*V)-1):0] score,
		input [9:0] evalX,
		input [9:0] evalY,
		input [9:0] posX,
		input [9:0] posY,
		output collision
    );
	 
	 localparam score_bits = logb2(H*V);
	 
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	wire [2:0] subsX;
	wire [3:0] subsY;
	
	assign subsX = (evalX - posX)/size;
	assign subsY = (evalY - posY)/size;
	
	// A dígitos decimales.
	wire [3:0] a3, a2, a1, a0;
	wire signed [(score_bits+1):0] signed_score = {2'b00, score};
		
	wire signed [(score_bits+1):0] signed_a3;
	wire signed [score_bits:0] signed_remainder_a3;
	BoothsDiv #(score_bits+1) a3div (signed_score, 1000, signed_a3, signed_remainder_a3);
	
	wire signed [(score_bits+1):0] signed_a2;
	wire signed [score_bits:0] signed_remainder_a2;
	BoothsDiv #(score_bits+1) a2div ({1'b0, signed_remainder_a3}, 100, signed_a2, signed_remainder_a2);
	
	wire signed [(score_bits+1):0] signed_a1;
	wire signed [score_bits:0] signed_remainder_a1;
	BoothsDiv #(score_bits+1) a1div ({1'b0, signed_remainder_a2}, 10, signed_a1, signed_remainder_a1);
	
	assign a3 = signed_a3[3:0];
	assign a2 = signed_a2[3:0];
	assign a1 = signed_a1[3:0];
	assign a0 = signed_remainder_a1[3:0];

	reg [6:0] char;
	
	reg [9:0] posXChar;
	
	FontPrint #(10) FontPrintI(clk, char, posXChar, 0, subsX, subsY, collision);


	always @(posedge clk) begin
		if(subsX < 8 + spacing) begin
			char <= 83;
			posXChar <= 0;
		end
	end

endmodule
