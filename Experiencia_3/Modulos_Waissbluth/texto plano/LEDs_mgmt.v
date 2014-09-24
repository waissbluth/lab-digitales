
module LEDs_mgmt(
		input wire [7:0] in,
		output reg [7:0] out
	);

	wire [0:2] temp;

	always@(*)

	// Reduce la resolución en 5 bits, de 8 a 3.
	temp = in / 6b'10000; //funciona?
	
	case(temp)
		3'b000: out = 8’b00000001;
		3'b001: out = 8’b00000011;
		3'b010: out = 8’b00000111;
		3'b011: out = 8’b00001111;
		3'b100: out = 8’b00011111;
		3'b101: out = 8’b00111111;
		3'b110: out = 8’b01111111;
		2'b111: out = 8’b11111111;
	endcase

endmodule