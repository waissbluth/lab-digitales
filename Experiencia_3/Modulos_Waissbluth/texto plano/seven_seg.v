
module seven_seg(
		input [1:0] value,
		output reg [0:7] segments
	);

	//										 11		       01			          10           00				
	//assign segments = in[0] ? ( in[1] ? 7’b0000000 : 7’b1001111 ) : ( in[1] ? 7’b0010010 : ’b0000001 );

	always@(value)
		1: segments = 8'b10011111;
		2: segments = 8'b00100101;
		3: segments = 8'b00001101;
		default: segments = 8'b00000011;
	endcase

endmodule