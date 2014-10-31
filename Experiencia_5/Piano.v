`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:34 10/17/2014 
// Design Name: 
// Module Name:    Piano 
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
module Piano(
		input mclk,
		input [7:0] sw, 			// Switches
		input [3:0] btn,			// Buttons
		input PS2C, PS2D,
		
		output [6:0] seg,			// Display
		output dp,
		output [3:0] an,
		
		output [7:0] Led,
		output HSYNC, VSYNC,
		output [2:0] OutRed, OutGreen, OutBlue
    );
	 
	// Parametros
	parameter bitsPosicion = 10;
	parameter bitsDimension = 10;
	
	parameter octaves = 2;
	parameter keyWidth = 40;
	parameter keyHeight = 240;
	parameter keySpace = 2;
	
	parameter keyboardPosX = 20;
	parameter keyboardPosY = 20;
	 
	// CLKs
	wire vgaClk, halverCount;
	Counter #(1) clockHalver(mclk, 1'b1, 0, halverCount, vgaClk);
	
	// Logica VGA
	wire [(bitsPosicion - 1):0] x_pixel, y_pixel, y_tmp;
	wire vOn, refresh;
	
	Sync vgaDriver(vgaClk, 1'b0, x_pixel, y_tmp, HSYNC, VSYNC, vOn, refresh);
	assign y_pixel = 480 - y_tmp;
	
	// Logica colores
	wire [2:0] colorIndex;
	wire [7:0] colorId0, colorId1, colorId2, colorId3, colorId4, colorId5, colorId6, colorId7;
	assign colorId0 = 8'b000_001_01;
	assign colorId1 = 8'b110_110_10;
	assign colorId2 = 8'b111_111_11;
	assign colorId3 = 8'b101_101_10;
	assign colorId4 = 8'b000_000_00;
	assign colorId5 = 8'b000_111_00;
	assign colorId6 = 8'b000_111_00;
	assign colorId6 = 8'b000_111_00;
	
	// Un bit por cada tecla del piano
	wire[(12*octaves - 1):0] keys;

	// Lectura teclado
	wire keyboardEnable;
	wire [7:0] keyboardData;
	reg [7:0] lastData, previousData;
	
	wire [2:0] indexCount;
	Ps2Signals keyboardCtrl(mclk, PS2C, PS2D, keyboardEnable, keyboardData, indexCount);
	
	// Dibujo piano
	PianoKeys #(bitsPosicion, bitsDimension, octaves) graphicKeys(mclk, keyWidth, keyHeight, keySpace, keyboardPosX, keyboardPosY, x_pixel, y_pixel, keys, colorIndex);

	// Segment display
	SegmentCycler display(mclk, 4'b1111, previousData[7:4], previousData[3:0], lastData[7:4], lastData[3:0], 4'b0000, seg, dp, an);

	// Proceso por pixel
	reg [7:0] outColor;
	assign OutRed = outColor[7:5];
	assign OutGreen = outColor[4:2];
	assign OutBlue[2:1] = outColor[1:0];
	assign OutBlue[0] = 0;
	
	always @(posedge mclk)
	begin
		if(vOn)
		begin
			case(colorIndex)
				1:			outColor <= colorId1;
				2:			outColor <= colorId2;
				3:			outColor <= colorId3;
				4:			outColor <= colorId4;
				5:			outColor <= colorId5;
				6:			outColor <= colorId6;
				7:			outColor <= colorId7;
				default	outColor <= colorId0;
			endcase
		end else outColor <= 0;
	end
	
	// Tests / Not finished
	assign keys[(octaves*12 - 1):8] = 0;
	assign keys[7:0] = {sw[0], sw[1], sw[2], sw[3], sw[4], sw[5], sw[6], sw[7]};
	assign Led[2:0] = indexCount;
	assign Led[7:3] = 0;
	
	always @(posedge mclk)
	begin
		if(keyboardEnable)
			previousData <= lastData;
			lastData <= keyboardData;
	end
	
endmodule
