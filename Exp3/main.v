`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:36 09/22/2014 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:  s
//
//////////////////////////////////////////////////////////////////////////////////
module main(
	input [0:7] sw,
	input [0:4] btn,
	output wire [0:7] Led
    );

mux_2 mux(8'b0000_0000, 8'b0000_0001, 8'b0000_0010, 8'b0000_0011, sw[0:1], Led);

endmodule
