`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:08 10/19/2014 
// Design Name: 
// Module Name:    Ps2Signals 
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
module Ps2Signals
	( input clk,
	  input ps2c, ps2d,
	  
	  output reg dataEnable,
	  output reg [7:0] data,
	  output [2:0] indexCount);
	
	parameter debouncerBits = 1;
	
	reg debouncing;
	reg lastPs2c, lastPs2d;
	
	wire [(debouncerBits - 1):0] debouncerCount;
	reg resetDebouncer, firstDebouncerLoop;
	wire debouncerOverflow;
	
	Counter #(debouncerBits) debouncer(clk, debouncing, resetDebouncer, debouncerCount, debouncerOverflow);
	
	// wire [2:0] indexCount;
	reg indexerReset, indexerEnable, waitForStartBit;
	wire indexerOverflow;
	
	Counter #(3) indexer(clk, indexerEnable, indexerReset | waitForStartBit, indexCount, indexerOverflow);
	
	initial
	begin
		debouncing <= 0;
		resetDebouncer <= 1;
		indexerReset <= 1;
		firstDebouncerLoop <= 1;
		waitForStartBit <= 1;
		dataEnable <= 0;
	end
	
	always @(posedge clk)
	begin
		
		if(lastPs2c & !ps2c) //negedge ps2c
		begin
			lastPs2d <= ps2d;
			resetDebouncer <= 1'b1;
			firstDebouncerLoop <= 1'b1;
		end
		else resetDebouncer <= 1'b0;
		
		dataEnable <= 1'b0;
		indexerReset <= 1'b0;
		indexerEnable <= 1'b0;	
		debouncing <= (debouncing | resetDebouncer) & (!ps2c | !waitForStartBit);
		
		if(debouncerOverflow & firstDebouncerLoop)
		begin
			if(waitForStartBit & lastPs2d == 1'b0)
				waitForStartBit <= 0;
			else
			begin
		
				if(indexerOverflow)
				begin
					indexerReset <= 1'b1;
					dataEnable <= lastPs2d ^ ( ^data );
					waitForStartBit <= 1;
				end
				else
				begin
					data[0] <= data[1];
					data[1] <= data[2];
					data[2] <= data[3];
					data[3] <= data[4];
					data[4] <= data[5];
					data[5] <= data[6];
					data[6] <= data[7];
					data[7] <= lastPs2d;
					
					indexerEnable <= 1'b1;
				end
			end
			
			firstDebouncerLoop <= 1'b0;
		end
		
		lastPs2c <= ps2c;
	end


endmodule
