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
		input [1:0] move,
		input [(logb2(H*V)-1):0] length,
		input shift,
		
		output [(logb2(H)-1):0] x,
		output [(logb2(V)-1):0] y,
		output exists,
		output reg self_col,
		output end_shift,
		output reg [(logb2(H) + logb2(V)):0] last_head
    );
	 
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
	
	wire [(xBits + yBits):0] dina, doutb;
	
	assign dina = {write_x, write_y, write_active};

	wire [(xBits-1):0] read_x = doutb[(xBits + yBits):(yBits + 1)];
	wire [(yBits-1):0] read_y = doutb[yBits:1];
	wire read_active = doutb[0];
	
	assign x = read_x;
	assign y = read_y;
	assign exists = read_active;
	
	reg [0:0] wea;
	
	wire [(addrBits-1):0] addr_snake;
	reg [(addrBits-1):0] addra;
	reg [(addrBits-1):0] addrb;
	
	always @(posedge clk)
	begin
		addrb <= addr_snake;
		addra <= addrb;
		
	end

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
	wire [(addrBits-1):0] addr_snake_count;
	assign addr_snake = addr_snake_count;
	
	StaticCounter #(H*V-1) snake_body_count (clk, body_count_enable, reset | body_overflow, addr_snake_count, body_overflow);
	
	assign end_shift = body_overflow;
	
	//Recorremos la serpiente
	always @(posedge clk) begin
		if(reset | body_overflow)
			body_count_enable <= 0;
		else if(shift)
			body_count_enable <= 1;	
	end	
	
	reg [(xBits + yBits):0] last_data;
	
	wire [(xBits-1):0] read_x_p1, read_x_m1;
	wire [(yBits-1):0] read_y_p1, read_y_m1;
	
	assign read_x_p1 = read_x + 1;
	assign read_x_m1 = read_x - 1;
	assign read_y_p1 = read_y + 1;
	assign read_y_m1 = read_y - 1;
	
	reg applyReset;
	reg next_wea;
	reg [(xBits-1):0] next_write_x;
	reg [(yBits-1):0] next_write_y;
	reg next_write_active;
	reg previous_body_count_enable;
	
	// Movemos la serpiente
	always @(posedge clk) begin
		if(reset) begin
			self_col <= 0;
			last_data <= {halfX, halfY, 1'b1};
			applyReset <= 1;
			next_wea <= 0;
			
		end else if(body_count_enable) begin	
			if(~body_overflow)
			begin
				next_write_x <= last_data[(xBits + yBits):(yBits + 1)];
				next_write_y <= last_data[yBits:1];
				next_write_active <= addra < length;
				next_wea <= 1;
				last_data <= doutb;
			end
			
			if(last_head == last_data) self_col <= 1;
			
			applyReset <= 0;
			
		end else if(~applyReset) begin
			case(move)
				default: last_data <= {read_x, read_y_p1, 1'b1 };
				right: last_data <= {read_x_p1, read_y, 1'b1 };
				down: last_data <= {read_x, read_y_m1, 1'b1 };
				left: last_data <= {read_x_m1, read_y, 1'b1 };
			
			endcase
			
			last_head <= {read_x, read_y, 1'b1};
			next_wea <= 0;
		end
		
		previous_body_count_enable <= body_count_enable;
		wea <= next_wea;
		write_x <= next_write_x;
		write_y <= next_write_y;
		write_active <= next_write_active;
		
	end	

endmodule
