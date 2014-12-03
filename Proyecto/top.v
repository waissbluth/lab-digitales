`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:17 12/02/2014 
// Design Name: 
// Module Name:    top 
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
module top
	(
		input mclk,
		input [7:0] sw, 			// Switches
		input [3:0] btn,			// Buttons
		input PS2C, PS2D,
		
		/*output [6:0] seg,			// Display
		output dp,
		output [3:0] an,*/
		
		output [7:0] Led,
		output reg HSYNC, VSYNC,
		output [2:0] OutRed, OutGreen, OutBlue
	);
	
	localparam right = 0, up = 1, left = 2, down = 3;
	
	localparam fpgaClk = 50000000;
	localparam gameClk = 1;
	
	localparam game_size_x = 32;
	localparam game_size_y = 32;
	localparam game_pos_x = 10;
	localparam game_pos_y = 10;
	localparam game_scale_x = 2;
	localparam game_scale_y = 2;
	
	localparam snake_color = 7'b111_111_11;
	localparam coin_color = 7'b111_111_00;
	localparam bg_color = 7'b100_100_10;
	
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	wire reset = sw[0];
	wire gameTick;
	ClockRatio #(fpgaClk, gameClk) tick_gen (mclk, gameTick);
	
	/* Calculo move */
	reg [1:0] move;
	
	always @(posedge mclk) begin
		if(btn < 2)
			move <= right;
		else if(btn < 4)
			move <= left;
		else if(btn < 8)
			move <= up;
		else
			move <= down;
	end
	
	/* Driver pantalla */
	wire [9:0] eval_x, eval_y, tmp_y;
	wire hsync, vsync, von, refresh;
	
	reg vgaClk, VON;
	always @(posedge mclk) vgaClk = ~vgaClk;
	
	Sync vgaDriver(vgaClk, 1'b0, eval_x, tmp_y, hsync, vsync, von, refresh);
	assign eval_y = 479 - tmp_y;
	reg [6:0] outColor;
	
	assign OutRed = outColor[6:4];
	assign OutGreen = outColor[3:2];
	assign OutBlue[2:1] = outColor[1:0];
	assign OutBlue[0] = 0;
	
	/* Instancia zona de juego */
	wire game_over;
	wire [6:0] snake_game_color;
	wire snake_game_color_valid;

	snake_game
	#(
		game_size_x, game_size_y,
		game_pos_x, game_pos_y,
		game_scale_x, game_scale_y,
		snake_color, coin_color, bg_color
	)
	snake_game_i
	(
		mclk, reset,
		gameTick,
		move_enable, move,
		eval_x, eval_y,

		game_over,
		snake_game_color,
		snake_game_color_valid
	);
	
	always @(posedge mclk)
	begin
		VON <= von;
		if(VON) outColor <= snake_game_color;
		else outColor <= 0;
	end
	
	always @(posedge mclk)
	begin
		HSYNC <= hsync;
		VSYNC <= vsync;
	end

	assign Led[1] = game_over;
	assign Led[0] = reset;
	assign Led[7:2] = 0;

endmodule

