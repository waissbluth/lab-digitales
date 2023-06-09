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
	
	localparam fpgaClk = 50_000_000;
	//localparam gameClk = 10;
	
	localparam game_size_x = 64;
	localparam game_size_y = 32;
	localparam game_pos_x = 64;
	localparam game_pos_y = 64;
	localparam game_scale_x = 8;
	localparam game_scale_y = 8;
	
	localparam snake_head_color = 8'b111_000_11;
	localparam snake_color = 8'b111_111_11;
	localparam coin_color = 8'b001_111_01;
	localparam bg_box_color = 8'b100_100_10;
	localparam bg_color = 8'b010_010_01;
	localparam bg_color_paused = 8'b010_010_11;
	localparam score_color = 8'b110_000_01;
	
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	wire reset = sw[7];
	wire gameTick;
	
	reg [(logb2(fpgaClk)-1):0] gameClk;
	
	
	ClockRatio #(fpgaClk) tick_gen (mclk, reset, gameClk, gameTick);
	
	/* Desde el teclado */
	wire keyboardEnable;
	assign keyboardEnable = 1;
	wire [7:0] keyboardData;
	wire keyRecieved;
	
	wire [1:0] move;

	ps2_rx keyboardCtrl(mclk, reset, PS2D, PS2C, keyboardEnable, keyRecieved, keyboardData);
	key_to_move key_to_move_i(mclk, reset, keyRecieved, keyboardData, gameTick, move, move_enable);
	
	/* Play + Pause */
	reg playing;
	
	always @(posedge mclk) begin
		if(reset | (keyboardData == 8'b0010_1001 & keyRecieved))
			playing <= 0;
		else if(move_enable)
			playing <= 1;
	end
	
	/* Driver pantalla */
	wire [9:0] eval_x, eval_y, tmp_y;
	wire hsync, vsync, von, refresh;
	
	reg vgaClk, VON;
	always @(posedge mclk) vgaClk = ~vgaClk;
	
	Sync vgaDriver(vgaClk, 1'b0, eval_x, tmp_y, hsync, vsync, von, refresh);
	assign eval_y = 479 - tmp_y;
	reg [7:0] outColor;
	
	assign OutRed = outColor[7:5];
	assign OutGreen = outColor[4:2];
	assign OutBlue[2:1] = outColor[1:0];
	assign OutBlue[0] = 0;
	
	/* Instancia zona de juego */
	wire game_over;
	wire [7:0] snake_game_color;
	wire snake_game_color_valid;
	
	wire [(logb2(game_size_x*game_size_y)-1):0] score;

	snake_game
	#(
		game_size_x, game_size_y,
		game_pos_x, game_pos_y,
		game_scale_x, game_scale_y,
		snake_head_color, snake_color, coin_color, bg_box_color
	)
	snake_game_i
	(
		mclk, reset | ((keyboardData == 8'b0010_1001 & keyRecieved) & game_over),
		gameTick & ~game_over & playing,
		move,
		eval_x, eval_y,

		game_over,
		snake_game_color,
		snake_game_color_valid,
		score
	);
	

	/* Score */
	wire score_color_valid;
	
	reg [(logb2(game_size_x*game_size_y)-1):0] score_display;
	
		always @(posedge mclk) begin
		gameClk <= 10 + score_display/4;
	end
	
	always @(posedge mclk)
		if(score < 3)
			score_display <= 0;
		else 
			score_display <= score - 3;
	

	score_print #(game_size_x, game_size_y, 4, 1) score_print_i (mclk, score_display, game_over, eval_x, eval_y, 68, 352, score_color_valid);
	
	always @(posedge mclk)
	begin
		VON <= von;
		if(VON) begin
			if(game_over & score_color_valid) outColor <= score_color;
			else if(score_color_valid) outColor <= ~score_color;
			else if(snake_game_color_valid) outColor <= snake_game_color;
			else if (~game_over & ~playing) outColor <= bg_color_paused;
			else outColor <= bg_color;
		end
		else outColor <= 0;
	end
	
	always @(posedge mclk)
	begin
		HSYNC <= hsync;
		VSYNC <= vsync;
	end
	

	//assign Led[1] = game_over;
	//assign Led[0] = reset;
	//assign Led[1] = ticked;
	//assign Led[3:2] = max_steel;
	//assign Led[7:0] = snake_game_color;
	assign Led[7:0] = keyboardData;

endmodule

