`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: John Debouncy
// Engineer: Juan Andrés Bozzo
// 
// Create Date: 09/11/2014 11:49:19 PM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder
	(	input a, b, c_in,
      output y, c_out );
                  
    wire t0, t1, t2;
    
    assign t0 = a ^ b;
    assign t1 = a & b;
    assign t2 = t0 & c_in;
    
    assign c_out = t1 | t2;
    assign y = t0 ^ c_in;
      
endmodule
