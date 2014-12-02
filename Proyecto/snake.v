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
(		input clk,
		input reset,
		input move_enable,
		input shift,
		input [1:0] move,
		output [(logb2(H)-1):0] x,
		output [(logb2(V)-1):0] y,
		output exists,
		output reg self_col
    );

	localparam xBits = logb2(H);
	localparam yBits = logb2(V);
	localparam addrBits = logb2(H*V);
	
	localparam right = 0, up = 1, left = 2, down = 3;

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
	
	wire [(xBits + yBits):0] dina, doutb;
	
	wire [(addrBits-1):0] addra_snake, addrb_snake;
	
	assign dina = {write_x, write_y, write_active};

	wire [(xBits-1):0] read_x = doutb[(addrBits-1):(addrBits-xBits)];
	wire [(yBits-1):0] read_y = doutb[(addrBits-1-xBits):(addrBits-xBits-yBits)];
	wire read_active = doutb[0];
	
	assign x = read_x;
	assign y = read_y;
	assign exists = read_active;
	
	snake_mem snake_mem_i (
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
	//Recorremos la serpiente
	always @(posedge clk) begin
		if(reset | body_overflow)
			body_count_enable <= 0;
		else 
			body_count_enable <= 1;	
	end	
	
	reg [(xBits + yBits):0] last_data, last_head;
	
	// Calculo de la velocidad en base a botones
	
	reg [1:0] last_move;
	always @(posedge clk) begin
		if(move_enable)
			last_move <= move;
	end
	
	// Movemos la serpiente
	always @(posedge clk) begin
		if(reset) begin
			self_col <= 0;
			write_x <= H/2;
			write_y <= V/2;
			write_active <= 1;
		end else if(body_count_enable) begin
			{write_x, write_y, write_active} <= last_data;
			last_data <= doutb;
			if(last_head == doutb)
				self_col <= 1;
		end else begin
			case(last_move)
				right: last_data <= {read_x + 1, read_y, 1 };
				up: last_data <= {read_x, read_y + 1, 1 };
				left: last_data <= {read_x - 1, read_y, 1 };
				down: last_data <= {read_x, read_y - 1, 1 };
				default: last_data <= {read_x, read_y, 1 };
			endcase
			last_head <= last_data;
		end
	end	

endmodule
