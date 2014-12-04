`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:52 12/02/2014 
// Design Name: 
// Module Name:    snake_game 
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
module snake_game
	#(
		parameter H = 32,
		parameter V = 32,
		parameter pos_x = 10,
		parameter pos_y = 10,
		parameter scale_x = 2,
		parameter scale_y = 2,
		parameter snake_head_color = 8'b111_000_11,
		parameter snake_color = 8'b111_111_11,
		parameter coin_color = 8'b111_111_00,
		parameter bg_color = 8'b000_000_00
	)
	(
		input clk, reset,
		input gameTickIn,
		input [1:0] move,
		input [9:0] eval_x, eval_y,

		output game_over,
		output [7:0] out_color,
		output reg color_valid,
		output [(logb2(H*V)-1):0] score
	);
	 
	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	localparam xBits = logb2(H);
	localparam yBits = logb2(V);
	localparam addrBits = logb2(H*V);
	
	localparam bg_index = 0;
	localparam snake_index = 1;
	localparam coin_index = 2;
	localparam snake_head_index = 3;
	
	/* Posicion, movimiento y colisión serpiente */
	wire [(xBits-1):0] x_snake;
	wire [(yBits-1):0] y_snake;
	wire exists_snake, end_shift_snake;
	wire [(xBits + yBits):0] snake_head;
	reg snake_shift;
	
	reg [(addrBits-1):0] length;

	snake #(H, V) snake_position
	(
		clk, reset,
		move,
		length,
		snake_shift,
		x_snake, y_snake, exists_snake,
		game_over, end_shift_snake,
		snake_head
	);
	
	/* Clear pantalla. */
	reg clear_count_enable;
	wire clear_overflow;
	wire [(addrBits - 1):0] screen_clear_count;
	
	StaticCounter #(H*V-1) screen_clear_counter (clk, clear_count_enable, reset | clear_overflow, screen_clear_count, clear_overflow);
	
	/* Memoria pantalla */
	wire wea;
	wire [(addrBits - 1):0] addra, addrb;
	wire [1:0] dina, doutb;
	
	screen_mem_i snake_screen_mem
	(
	  .clka(clk), // input clka
	  .wea(wea), // input [0 : 0] wea
	  .addra(addra), // input [9 : 0] addra
	  .dina(dina), // input [1 : 0] dina
	  .clkb(clk), // input clkb
	  .addrb(addrb), // input [9 : 0] addrb
	  .doutb(doutb) // output [1 : 0] doutb
	);
	
	reg screen_write_enable;
	assign wea = screen_write_enable;
	
	reg [(addrBits - 1):0] screen_write_address;
	wire [(addrBits - 1):0] screen_read_address;
	assign addra = screen_write_address;
	assign addrb = screen_read_address;
	
	reg [1:0] screen_write_data;
	wire [1:0] screen_read_data;
	
	assign dina = screen_write_data;
	assign screen_read_data = doutb;
	
	/* Calculo address_read */
	wire [9:0] local_x = (eval_x - pos_x)/scale_x;
	wire [9:0] local_y = (eval_y - pos_y)/scale_y;
	assign screen_read_address = local_y[(yBits - 1):0]*H + local_x[(xBits - 1):0];
	
	/*  TAIL! */
	
	reg [(logb2(H)-1):0] snake_tail_x;
	reg [(logb2(V)-1):0] snake_tail_y;
	
	/* COIN! */
	
	wire [(logb2(H)-1):0] coin_x;
	wire [(logb2(V)-1):0] coin_y;
	wire coin_exists;
	wire point;
	coin #(H, V) coin_i(
		clk, reset, x_snake, y_snake, exists_snake, snake_shift,
		snake_tail_x, snake_tail_y,
		snake_head[(xBits + yBits):(yBits+1)], snake_head[yBits:1],
		coin_x, coin_y, coin_exists, point
		);
	always @(posedge clk) begin
		if(reset)
			length <= 3;
		else if(point)
			length <= length + 1;
	end
	
   /* Crece pa 'elante */
	wire gameTick = point | gameTickIn;
	
	/* Calculo color_valid */
	always @(posedge clk) begin
		if(reset) color_valid <= 0;
		
		else begin
			color_valid <= eval_x >= pos_x &
								eval_x < scale_x*H + pos_x &
								eval_y >= pos_y &
								eval_y < scale_y*V + pos_y;
			
		end
	end
	
	/* Estado 0: Wait */
	
	/* Estado 1: Clear pantalla */
	always @(posedge clk) begin
		if(reset | clear_overflow)
			clear_count_enable <= 0;
		
		else if(gameTick) begin
			clear_count_enable <= 1;
			
		end
	end	
	
	/* Estado 2: Dibujar serpiente */
	always @(posedge clk) begin
		snake_shift <= clear_overflow;
	end
	
	/* Estado 3: Dibujar moneda(s) */
	
	/* Maquina de estados */
	reg [2:0] state;
	reg previous_exist_tail;
	
	/* Test counter*/
	reg [1:0] test_counter;
	
	always @(posedge clk) begin
		if(reset) begin
			state <= 0;
			
		end else begin
			if(gameTick) state <= 1;
			else if(clear_overflow) state <= 2;
			else if(end_shift_snake) state <= 3;
			else if(state == 3) state <= 4;
			else if(state == 4) state <= 0;
			
			case (state)
				default:
					screen_write_enable <= 0;
					
				1: begin
					screen_write_enable <= 1;
					screen_write_data <= bg_index;
					screen_write_address <= screen_clear_count;
					test_counter <= snake_index; //*
				
				end 2: begin
					screen_write_enable <= exists_snake;
					screen_write_data <= snake_index; //*
					//screen_write_data <= test_counter;
					screen_write_address <= y_snake*H + x_snake;
					if(previous_exist_tail && ~exists_snake) begin
						snake_tail_x <= x_snake;
						snake_tail_y <= y_snake;
					end
					test_counter <= test_counter + 1;
				
				end 3: begin
					screen_write_enable <= coin_exists;
					screen_write_data <= coin_index;
					screen_write_address <= coin_y*H + coin_x;
				end 4: begin
					screen_write_enable <= 1;
					screen_write_data <= snake_head_index;
					screen_write_address <=  snake_head[yBits:1]*H + snake_head[yBits + xBits:yBits+1];
				end
			endcase
			previous_exist_tail <= exists_snake;
		end
	end
	
	/* Calculo color salida */
	wire [1:0] curr_index = screen_read_data;
	assign out_color = 	{(8){curr_index == bg_index}} & bg_color |
								{(8){curr_index == coin_index}} & coin_color |
								{(8){curr_index == snake_head_index}} & snake_head_color |
								{(8){curr_index == snake_index}} & snake_color;
						
	// TODO t
	assign score = length;
	

endmodule
