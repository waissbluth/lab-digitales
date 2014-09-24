module count_1(
	    input wire clk,
		input wire enable,
	    output reg [0:7] q
    );

	initial q = 0;

	always @(posedge clk)
	begin
	if( enable )
		if( q == 8'b11111111 )
			q <= 8'b00000000;
		else
			q <= q+1;
	else
		q <= q;
	end
endmodule
