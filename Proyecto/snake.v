`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:01 12/02/2014 
// Design Name: 
// Module Name:    snake 
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
module snake
	#(parameter H = 32, parameter V = 32)
	(	
		input clk,
		input reset,
		input move_enable,
		input [1:0] move,
		input shift,
		
		output [(logb2(H)-1):0] x,
		output [(logb2(V)-1):0] y,
		output exists,
		output reg self_col,
		output end_shift,
		output [(logb2(H) + logb2(V)):0] doutb
    );
	 reg [(logb2(H) + logb2(V)):0] last_head;
	 

	localparam xBits = logb2(H);
	localparam yBits = logb2(V);
	localparam addrBits = logb2(H*V);
	
	localparam right = 0, up = 1, left = 2, down = 3;

	wire [(xBits-1):0] halfX;
	wire [(yBits-1):0] halfY;
	assign halfX = H/2;
	assign halfY = V/2;

	function integer logb2;
		input integer n;
		begin
			n = n-1;
		for(logb2=0; n>0; logb2=logb2 + 1)
			n = n>>1;
		end
	endfunction
	
	reg [(xBits-1):0] write_x;
	reg [(yBits-1):0] write_y;
	reg write_active;
	
	//wire [(xBits + yBits):0] dina, doutb;
	wire [(xBits + yBits):0] d;
	
	wire [(addrBits-1):0] addra_snake;
	
	assign dina = {write_x, write_y, write_active};

	wire [(xBits-1):0] read_x = doutb[(addrBits-1):(addrBits-xBits)];
	wire [(yBits-1):0] read_y = doutb[(addrBits-1-xBits):(addrBits-xBits-yBits)];
	wire read_active = doutb[0];
	
	assign x = read_x;
	assign y = read_y;
	assign exists = read_active;
	
	reg wea;
	
	wire [(addrBits-1):0] addra = addra_snake;
	wire [(addrBits-1):0] addrb = addra_snake;

	snake_mem snake_mem_i
	(
	  .clka(clk), // input clka
	  .wea(wea), // input [0 : 0] wea
	  .addra(addra), // input [9 : 0] addra
	  .dina(dina), // input [10 : 0] dina
	  .clkb(clk), // input clkb
	  .addrb(addrb), // input [9 : 0] addrb
	  .doutb(doutb) // output [10 : 0] doutb
	);

	reg body_count_enable;
	wire body_overflow;
	
	StaticCounter #(H*V-1) snake_body_count (clk, body_count_enable, reset | body_overflow, addra_snake, body_overflow);
	
	assign end_shift = body_overflow;
	
	//Recorremos la serpiente
	always @(posedge clk) begin
		if(reset | body_overflow)
			body_count_enable <= 0;
		else if(shift)
			body_count_enable <= 1;	
	end	
	
	reg [(xBits + yBits):0] last_data;
	
	// Calculo de la velocidad en base a botones
	
	reg [1:0] last_move;
	always @(posedge clk) begin
		if(move_enable)
			last_move <= move;
	end
	
	wire [(xBits-1):0] read_x_p1, read_x_m1;
	wire [(yBits-1):0] read_y_p1, read_y_m1;
	
	assign read_x_p1 = read_x + 1;
	assign read_x_m1 = read_x - 1;
	assign read_y_p1 = read_y + 1;
	assign read_y_m1 = read_y - 1;
	
	// Movemos la serpiente
	always @(posedge clk) begin
		if(reset) begin
			self_col <= 0;
			last_data <= {halfX, halfY, 1};
			wea <= 1;
		end else if(body_count_enable) begin
			write_x <= last_data[(xBits + yBits):(yBits + 1)];
			write_y <= last_data[yBits:1];
			write_active <= last_data[0];
			last_data <= doutb;
			wea <= 1;
			if(last_head == doutb)
				self_col <= 1;
		end else begin
			case(last_move)
				right: last_data <= {read_x_p1, read_y, 1 };
				up: last_data <= {read_x, read_y_p1, 1 };
				left: last_data <= {read_x_m1, read_y, 1 };
				down: last_data <= {read_x, read_y_m1, 1 };
				default: last_data <= {read_x, read_y, 1 };
			endcase
			last_head <= last_data;
			wea <= 0;
		end
	end	

endmodule
