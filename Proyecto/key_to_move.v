`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:41 12/03/2014 
// Design Name: 
// Module Name:    key_to_move 
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
module key_to_move(
		input clk, reset,
		input newKey,
		input [7:0] keyCode,
		output reg [1:0] move
	);
	
	 localparam right = 0, up = 1, left = 2, down = 3;
	 
	 reg [1:0] next_move;
	 
	 always @(posedge clk) begin
		if(newKey) begin
			case(keyCode)
				8'b01110100: begin //To Right
					if(move != left) next_move <= right;
				end 8'b01110010: begin // To Down
					if(move != up) next_move <= down;
				end 8'b01110101: begin // To Up
					if(move != down) next_move <= up;
				end 8'b01101011: begin // To Left
					if(move != right) next_move <= left;
				end 
			endcase	
			
			move <=  next_move;
		end
	 end


endmodule
