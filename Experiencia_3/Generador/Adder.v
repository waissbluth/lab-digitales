`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: John Debouncy
// Engineer: Juan Andrés Bozzo
// 
// Create Date: 09/11/2014 11:59:42 PM
// Design Name: 
// Module Name: Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder
	#(parameter bits = 8)
	(	input [(bits-1):0] a, b,
		output [(bits-1):0] y, output c_out );
    
    wire [bits-1:0] carry_in;
    wire [bits-1:0] carry_out;
    
    assign carry_in[0] = 0;
    
    genvar ii;
    
    generate
        for(ii = 1; ii < bits; ii = ii + 1) begin:forloop
            assign carry_in[ii] = carry_out[ii - 1];
        end
    endgenerate
    
    FullAdder adders [bits-1:0] (a, b, carry_in, y, carry_out);
    
    assign c_out = carry_out[bits - 1];
    
endmodule
