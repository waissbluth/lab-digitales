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
module Proyecto(
		input mclk,
		input [7:0] sw, 			// Switches
		input [3:0] btn,			// Buttons
		//input PS2C, PS2D,
		
		/*output [6:0] seg,			// Display
		output dp,
		output [3:0] an,*/
		
		output [7:0] Led,
		output HSYNC, VSYNC,
		output [2:0] OutRed, OutGreen, OutBlue
    );
	 
	// Parametros
	parameter evalBits = 7;
	parameter intBits = 7;
	parameter decimalBits = evalBits - 1;
	
	parameter fpgaClk = 50000;
	parameter numberOfTris = 4;
	
	wire reset;
	// Logica VGA
	reg vgaClk;
	always @(posedge mclk) vgaClk <= ~vgaClk;
	/*wire vgaCount, vgaClk;
	StaticCounter #(1) vgaClockGen(mclk, 1'b1, reset, vgaCount, vgaClk);*/
	
	wire [(10 - 1):0] x_pixel, y_pixel, y_tmp;
	wire vOn, refresh;
	
	Sync vgaDriver(vgaClk, reset, x_pixel, y_tmp, HSYNC, VSYNC, vOn, refresh);
	assign y_pixel = 479 - y_tmp;
	
	wire [(evalBits - 1):0] evalX, evalY;
	assign evalX = x_pixel[(10 - 1):(10 - evalBits)];
	assign evalY = y_pixel[(10 - 1):(10 - evalBits)];
	
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
	assign colorId7 = 8'b000_111_00;
	
	// Calculo triangulo
	wire signed [intBits:0] x_0 [1:0];
	wire signed [intBits:0] y_0 [1:0];
	wire signed [intBits:0] z_0 [1:0];
	wire signed [intBits:0] x_1 [1:0];
	wire signed [intBits:0] y_1 [1:0];
	wire signed [intBits:0] z_1 [1:0];
	wire signed [intBits:0] x_2 [1:0];
	wire signed [intBits:0] y_2 [1:0];
	wire signed [intBits:0] z_2 [1:0];
	
	assign x_0[0] = 10;
	assign y_0[0] = 10;
	assign z_0[0] = 1;
	
	assign x_1[0] = 60;
	assign y_1[0] = 10;
	assign z_1[0] = 3;
	
	assign x_2[0] = 10;
	assign y_2[0] = 36;
	assign z_2[0] = 4;
	
	assign x_0[1] = 25;
	assign y_0[1] = 25;
	assign z_0[1] = 4;
	
	assign x_1[1] = 150;
	assign y_1[1] = 50;
	assign z_1[1] = 2;
	
	assign x_2[1] = 50;
	assign y_2[1] = 85;
	assign z_2[1] = 1;
	
	wire signed [intBits:0] px_0 [1:0];
	wire signed [intBits:0] py_0 [1:0];
	wire signed [intBits:0] px_1 [1:0];
	wire signed [intBits:0] py_1 [1:0];
	wire signed [intBits:0] px_2 [1:0];
	wire signed [intBits:0] py_2 [1:0];
	
	genvar ii;
	generate
		for(ii = 0; ii < 2; ii = ii + 1) begin : perspProyection
			PerspDivSimple #(intBits, decimalBits) vert0Proy
			(	{1'b0, x_0[ii], {(decimalBits){1'b0}}},
				{1'b0, y_0[ii], {(decimalBits){1'b0}}},
				{1'b0, z_0[ii], {(decimalBits){1'b0}}},
				px_0[ii], py_0[ii]);
				
		PerspDivSimple #(intBits, decimalBits) vert1Proy
			(	{1'b0, x_1[ii], {(decimalBits){1'b0}}},
				{1'b0, y_1[ii], {(decimalBits){1'b0}}},
				{1'b0, z_1[ii], {(decimalBits){1'b0}}},
				px_1[ii], py_1[ii]);
				
		PerspDivSimple #(intBits, decimalBits) vert2Proy
			(	{1'b0, x_2[ii], {(decimalBits){1'b0}}},
				{1'b0, y_2[ii], {(decimalBits){1'b0}}},
				{1'b0, z_2[ii], {(decimalBits){1'b0}}},
				px_2[ii], py_2[ii]);
		end
	endgenerate
	
	wire signed [intBits:0] cx_0, cy_0, cx_1, cy_1, cx_2, cy_2;
	wire signed [(intBits + decimalBits):0]  lambda_0, lambda_1, lambda_2;
	wire inTris;
	
	assign cx_0 = x_0[0];
	assign cy_0 = y_0[0];
	assign cx_1 = x_1[0];
	assign cy_1 = y_1[0];
	assign cx_2 = x_2[0];
	assign cy_2 = y_2[0];
	
	BaricentricCoords #(evalBits, intBits, decimalBits) tris(cx_0, cy_0, cx_1, cy_1, cx_2, cy_2, evalX, evalY, lambda_0, lambda_1, lambda_2, inTris);
	
	assign colorIndex = {2'b00, inTris};
	reg [2:0] colorIndexStable;
	
	// Proceso por pixel
	reg [7:0] outColor;
	assign OutRed = outColor[7:5];
	assign OutGreen = outColor[4:2];
	assign OutBlue[2:1] = outColor[1:0];
	assign OutBlue[0] = 0;
	
	always @(posedge mclk)
	begin
	
		colorIndexStable <= colorIndex;
		if(vOn)
		begin
			case(colorIndexStable)
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
	//assign Led = sw;
	assign reset = btn[0];
	
	// Test
	reg testReset, testStart, testRunning;
	wire [21:0] haltClockCount;
	reg [21:0] lastClockCount;
	wire haltClockCountOverflow;
	StaticCounter #(fpgaClk*1000) testCount(mclk, 1'b1, testReset | testStart, haltClockCount, haltClockCountOverflow);
	
	
	always@(posedge mclk)
	begin
		if(x_pixel == 0 & y_pixel == 5)
		begin
			lastClockCount <= haltClockCount; 
			testReset <= 1;
			testRunning <= 0;
		end else testReset <= 0;
		if(x_pixel == 639 & y_pixel == 4 & ~testRunning)
		begin
			testRunning <= 1;
			testStart <= 1;
		end
		else testStart <= 0;
	end
	
	assign Led = {|lastClockCount[21:14] ,lastClockCount[13:7]};
	
	
endmodule
