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
		parameter spacing = 1
)(		
		input clk,
		input [(logb2(H*V)-1):0] score,
		input game_over,
		input [9:0] evalX,
		input [9:0] evalY,
		input [9:0] posX,
		input [9:0] posY,
		output collision
    );
	 
	 localparam score_bits = logb2(H*V);
	 localparam width = 8;
	 
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	wire [9:0] subsX;
	wire [9:0] subsY;
	
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
		if(game_over) begin
			if(subsX < 1*width) begin //G
				char <= 71;
				posXChar <= 0;
			end else if(subsX >= 1*(width + spacing) && subsX < 2*(width + spacing) - spacing) begin //A
				char <= 65;
				posXChar <= 1*(width + spacing);
			end else if(subsX >= 2*(width + spacing) && subsX < 3*(width + spacing) - spacing) begin //M
				char <= 77;
				posXChar <= 2*(width + spacing);
			end else if(subsX >= 3*(width + spacing) && subsX < 4*(width + spacing) - spacing) begin //E
				char <= 69;
				posXChar <= 3*(width + spacing);
			end else if(subsX >= 4*(width + spacing) && subsX < 5*(width + spacing) - spacing) begin // ' '
				char <= 32;
				posXChar <= 4*(width + spacing);
			end else if(subsX >= 5*(width + spacing) && subsX < 6*(width + spacing) - spacing) begin // O
				char <= 79;
				posXChar <= 5*(width + spacing);
			end else if(subsX >= 6*(width + spacing) && subsX < 7*(width + spacing) - spacing) begin // V
				char <= 86;
				posXChar <= 6*(width + spacing);
			end else if(subsX >= 7*(width + spacing) && subsX < 8*(width + spacing) - spacing) begin // E
				char <= 69;
				posXChar <= 7*(width + spacing);
			end else if(subsX >= 8*(width + spacing) && subsX < 9*(width + spacing) - spacing) begin // R
				char <= 82;
				posXChar <= 8*(width + spacing);
			end else if(subsX >= 9*(width + spacing) && subsX < 10*(width + spacing) - spacing) begin // :
				char <= 58;
				posXChar <= 9*(width + spacing);
			end else if(subsX >= 10*(width + spacing) && subsX < 11*(width + spacing) - spacing) begin // a3
				char <= 48 + a3;
				posXChar <= 10*(width + spacing);
			end else if(subsX >= 11*(width + spacing) && subsX < 12*(width + spacing) - spacing) begin // a2
				char <= 48 + a2;
				posXChar <= 11*(width + spacing);
			end else if(subsX >= 12*(width + spacing) && subsX < 13*(width + spacing) - spacing) begin // a1
				char <= 48 + a1;
				posXChar <= 12*(width + spacing);
			end else if(subsX >= 13*(width + spacing) && subsX < 14*(width + spacing) - spacing) begin // a0
				char <= 48 + a0;
				posXChar <= 13*(width + spacing);
			end else
				char <= 0;

		end else begin
			if(subsX < 1*width) begin //S
				char <= 83;
				posXChar <= 0;
			end else if(subsX >= 1*(width + spacing) && subsX < 2*(width + spacing) - spacing) begin //C
				char <= 67;
				posXChar <= 1*(width + spacing);
			end else if(subsX >= 2*(width + spacing) && subsX < 3*(width + spacing) - spacing) begin //O
				char <= 79;
				posXChar <= 2*(width + spacing);
			end else if(subsX >= 3*(width + spacing) && subsX < 4*(width + spacing) - spacing) begin //R
				char <= 82;
				posXChar <= 3*(width + spacing);
			end else if(subsX >= 4*(width + spacing) && subsX < 5*(width + spacing) - spacing) begin //E
				char <= 69;
				posXChar <= 4*(width + spacing);
			end else if(subsX >= 5*(width + spacing) && subsX < 6*(width + spacing) - spacing) begin //:
				char <= 58;
				posXChar <= 5*(width + spacing);
			end else if(subsX >= 6*(width + spacing) && subsX < 7*(width + spacing) - spacing) begin // ' '
				char <= 32;
				posXChar <= 6*(width + spacing);
			end else if(subsX >= 7*(width + spacing) && subsX < 8*(width + spacing) - spacing) begin // a3
				char <= 48 + a3;
				posXChar <= 7*(width + spacing);
			end else if(subsX >= 8*(width + spacing) && subsX < 9*(width + spacing) - spacing) begin // a2
				char <= 48 + a2;
				posXChar <= 8*(width + spacing);
			end else if(subsX >= 9*(width + spacing) && subsX < 10*(width + spacing) - spacing) begin // a1
				char <= 48 + a1;
				posXChar <= 9*(width + spacing);
			end else if(subsX >= 10*(width + spacing) && subsX < 11*(width + spacing) - spacing) begin // a0
				char <= 48 + a0;
				posXChar <= 10*(width + spacing);
			end else
				char <= 0;
		end
		
	end

endmodule
