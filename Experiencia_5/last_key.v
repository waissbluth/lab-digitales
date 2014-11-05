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
		output press
    );
	 
	 reg [num_keys-1:0] prev;
	 
	 assign press = |keys;
	 
	 genvar i;
	 generate
		 for(i=0; i<num_keys; i = i+1) begin: juanito
			 always @(posedge clk) begin
				if(~prev[i] & keys[i])
					key <= i; 
			 end
		  end
	  endgenerate
	  
	  always @(posedge clk)
			prev <= keys;
		
endmodule
