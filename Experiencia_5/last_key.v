`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:43 11/05/2014 
// Design Name: 
// Module Name:    last_key 
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
module last_key
		#(parameter num_keys = 24)(
		input clk,
		input [num_keys - 1:0] keys,
		output reg [4:0] key,
		output reg press,
		output reg [num_keys - 1:0] display
    );
	 
	 reg [num_keys-1:0] prev;
	
/*	 genvar i;
	 generate
		 for(i=0; i<num_keys; i = i+1) begin: juanito
			 always @(posedge clk) begin
				if(~prev[i] & keys[i])
					key <= i; 
			 end
		  end
	  endgenerate*/
		always @(posedge clk) begin
		  if(~prev[0] & keys[0]) key <= 0;
		  if(~prev[1] & keys[1]) key <= 1;
		  if(~prev[2] & keys[2]) key <= 2;
		  if(~prev[3] & keys[3]) key <= 3;
		  if(~prev[4] & keys[4]) key <= 4;
		  if(~prev[5] & keys[5]) key <= 5;
		  if(~prev[6] & keys[6]) key <= 6;
		  if(~prev[7] & keys[7]) key <= 7;
		  if(~prev[8] & keys[8]) key <= 8;
		  if(~prev[9] & keys[9]) key <= 9;
		  if(~prev[10] & keys[10]) key <= 10;
		  if(~prev[11] & keys[11]) key <= 11;
		  if(~prev[12] & keys[12]) key <= 12;
		  if(~prev[13] & keys[13]) key <= 13;
		  if(~prev[14] & keys[14]) key <= 14;
		  if(~prev[15] & keys[15]) key <= 15;
		  if(~prev[16] & keys[16]) key <= 16;
		  if(~prev[17] & keys[17]) key <= 17;
		  if(~prev[18] & keys[18]) key <= 18;
		  if(~prev[19] & keys[19]) key <= 19;
		  if(~prev[20] & keys[20]) key <= 20;
		  if(~prev[21] & keys[21]) key <= 21;
		  if(~prev[22] & keys[22]) key <= 22;
		  if(~prev[23] & keys[23]) key <= 23;
		  
		  case(key)
				0:  display <= 24'b000000_000000_000000_000001;
				1:  display <= 24'b000000_000000_000000_000010;
				2:  display <= 24'b000000_000000_000000_000100;
				3:  display <= 24'b000000_000000_000000_001000;
				4:  display <= 24'b000000_000000_000000_010000;
				5:  display <= 24'b000000_000000_000000_100000;
				6:  display <= 24'b000000_000000_000001_000000;
				7:  display <= 24'b000000_000000_000010_000000;
				8:  display <= 24'b000000_000000_000100_000000;
				9:  display <= 24'b000000_000000_001000_000000;
				10: display <= 24'b000000_000000_010000_000000;
				11: display <= 24'b000000_000000_100000_000000;
				12: display <= 24'b000000_000001_000000_000000;
				13: display <= 24'b000000_000010_000000_000000;
				14: display <= 24'b000000_000100_000000_000000;
				15: display <= 24'b000000_001000_000000_000000;
				16: display <= 24'b000000_010000_000000_000000;
				17: display <= 24'b000000_100000_000000_000000;
				18: display <= 24'b000001_000000_000000_000000;
				19: display <= 24'b000010_000000_000000_000000;
				20: display <= 24'b000100_000000_000000_000000;
				21: display <= 24'b001000_000000_000000_000000;
				22: display <= 24'b010000_000000_000000_000000;
				23: display <= 24'b100000_000000_000000_000000;
				default: display <= 24'b000000_000000_000000_000000;
			endcase
			
			case(key)
				0:  press <= keys[0];
				1:  press <= keys[1];
				2:  press <= keys[2];
				3:  press <= keys[3];
				4:  press <= keys[4];
				5:  press <= keys[5];
				6:  press <= keys[6];
				7:  press <= keys[7];
				8:  press <= keys[8];
				9:  press <= keys[9];
				10: press <= keys[10];
				11: press <= keys[11];
				12: press <= keys[12];
				13: press <= keys[13];
				14: press <= keys[14];
				15: press <= keys[15];
				16: press <= keys[16];
				17: press <= keys[17];
				18: press <= keys[18];
				19: press <= keys[19];
				20: press <= keys[20];
				21: press <= keys[21];
				22: press <= keys[22];
				23: press <= keys[23];
				default: display <= 24'b000000_000000_000000_000000;
			endcase
			if(~press) display <= 24'b000000_000000_000000_000000;
	
			prev <= keys;
		end
		
endmodule
