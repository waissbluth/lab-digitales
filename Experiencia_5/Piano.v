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
		
		/*output [6:0] seg,			// Display
		output dp,
		output [3:0] an,*/
		
		output [7:0] Led,
		output HSYNC, VSYNC,
		output [2:0] OutRed, OutGreen, OutBlue,
		output salida_pwm
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
	
	parameter fpgaClk = 50000;
	parameter slowClk = 4;
	parameter pwmClk = 512 * 4;
	 
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
	wire[(12*octaves - 1):0] keys_display;

	// Lectura teclado
	wire keyboardEnable;
	assign keyboardEnable = 1;
	
	wire [7:0] keyboardData;
	wire keyRecieved;
	wire reset;
	
	ps2_rx keyboardCtrl(mclk, reset, PS2D, PS2C, keyboardEnable, keyRecieved, keyboardData);
	KeyToTermometer keyboardKeys(	mclk, reset, keyRecieved, keyboardData, keys);

	wire [4:0] note;
	wire press;
	
	// Cálculo de tecla
	last_key last_key_i(mclk, keys, note, press, keys_display);
	
	//Genérame un seno
	wire [8:0] amplitude;
	wire clk4;	
	ClockRatio #(fpgaClk, slowClk) slowClkGen(mclk, clk4);
	sound sound_i(clk4, note, amplitude);
	
	//PWM generation
	wire pwm_out;
	wire clk512;
	ClockRatio #(fpgaClk, pwmClk) pwmClkGen(mclk, clk512);
	pwm pwm_i(clk512, amplitude, pwm_out);
	
	// Dibujo piano
	PianoKeys #(bitsPosicion, bitsDimension, octaves) graphicKeys(mclk, keyWidth, keyHeight, keySpace, keyboardPosX, keyboardPosY, x_pixel, y_pixel, keys_display, colorIndex);

	// Segment display
	//SegmentCycler display(mclk, 4'b1111, previousData[7:4], previousData[3:0], lastData[7:4], lastData[3:0], 4'b0000, seg, dp, an);

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
	
	// Union FPGA
	assign Led = keys[23:16];
	assign salida_pwm = pwm_out & press;
	assign reset = btn[0];
	
endmodule
