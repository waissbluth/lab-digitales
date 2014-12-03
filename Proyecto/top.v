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
	localparam gameClk = 5;
	
	localparam game_size_x = 64;
	localparam game_size_y = 32;
	localparam game_pos_x = 10;
	localparam game_pos_y = 10;
	localparam game_scale_x = 8;
	localparam game_scale_y = 8;
	
	localparam snake_color = 8'b111_111_11;
	localparam coin_color = 8'b001_111_01;
	localparam bg_box_color = 8'b100_100_10;
	localparam bg_color = 8'b010_010_01;
	
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
	
	ClockRatio #(fpgaClk, gameClk) tick_gen (mclk, reset, gameTick);
	
	/* Desde el teclado */
	wire keyboardEnable;
	assign keyboardEnable = 1;
	wire [7:0] keyboardData;
	wire keyRecieved;
	
	wire [1:0] move;

	ps2_rx keyboardCtrl(mclk, reset, PS2D, PS2C, keyboardEnable, keyRecieved, keyboardData);
	key_to_move key_to_move_i(mclk, reset, keyRecieved, keyboardData, move);
	
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
	
	wire [10:0] tmp;

	snake_game
	#(
		game_size_x, game_size_y,
		game_pos_x, game_pos_y,
		game_scale_x, game_scale_y,
		snake_color, coin_color, bg_box_color
	)
	snake_game_i
	(
		mclk, reset,
		gameTick,
		move,
		eval_x, eval_y,

		game_over,
		snake_game_color,
		snake_game_color_valid,
		tmp
	);
	
	always @(posedge mclk)
	begin
		VON <= von;
		if(VON) begin
			if(snake_game_color_valid) outColor <= snake_game_color;
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
	assign Led[7:0] =  tmp;

endmodule

