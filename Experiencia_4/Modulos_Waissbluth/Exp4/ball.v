`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:07 10/09/2014 
// Design Name: 
// Module Name:    ball 
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
module ball(
		input clk,
		input reset,
		input [9:0] bar_1_y,
		input [9:0] bar_2_y,
		output reg [10:0] x,
		output reg [9:0] y,
		output reg point_1,
		output reg point_2
    );
	  
	 parameter Vv = 1; 
	 parameter Vh = 1;
	  
	 // 1 es velocidad positiva, 0 es negativa
	 reg Vx;
	 reg Vy;
	 
	 // 1 es en movimiento, 0 en reposo
	 reg mov_x;
	 reg mov_y;
	 
	 reg [10:0] x_new;
	 reg [9:0] y_new;
	  
	 always@(posedge clk)
	 begin
		// Estado inicial
		if(reset || point_1 || point_2) begin
			x_new <= 310;
			y_new <= 180;
			point_1 <= 0;
			point_2 <= 0;
			mov_x <= 1;
			mov_y <= 1;
			Vy <= 0;
			Vx <= 1;
		// Aplicar velocidad a la pelota
		end else begin
			x_new <= mov_x ? (Vx ? x + Vv : x - Vv) : x;
			y_new <= mov_y ? (Vy ? y + Vh : y - Vh) : y;
		end
		
		// Cálculo de puntaje
		if(x_new > 615)
			point_1 <= 1;
		else if(x_new < 4)
			point_2 <= 1;
		else
			x <= x_new;	
			
		// Cálculo de rebote vertical
		if(y_new > 355) begin
			y_new <= 355;
			Vy <= 0;
		end else if(y_new < 4) begin
			y_new <= 4;
			Vy <= 1;
		end else
			y <= y_new;	
			
		// Cálculo de choque con barras
		
			
	 end


endmodule
