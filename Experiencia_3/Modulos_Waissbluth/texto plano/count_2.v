module count_2(
	    input wire clk,
		input wire enable,
	    output reg [0:1] q
    );

	initial q = 8'b01;

	always @(posedge clk)
	begin
	if( enable )
		if( q == 8'b11 )
			q <= 8'b01;
		else
			q <= q+1;
	else
		q <= q;
	end
endmodule
