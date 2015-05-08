`timescale	1ns/1ps

module	acc_2bits(out_c, cout, in_a, cin, Clock, nrst)	;

output	[1:0]	out_c	;
reg	[1:0]	out_c	;

output	cout	;
reg	cout	;

input	[1:0]	in_a	;
wire	[1:0]	in_a	;

input	cin	;
wire	cin	;

input	Clock, nrst	;
wire	Clock, nrst	;

wire	[1:0]	B	;
assign	B = out_c	;

wire	[1:0]	Stemp	;
wire	Ctemp	;

assign	{Ctemp, Stemp} = in_a + B + cin	;

always	@(posedge	Clock)
	begin
		if (nrst == 1'b0)
			begin
				{cout,out_c} <= 3'b0	;
			end
		else
			begin
				{cout, out_c} <= {Ctemp, Stemp}	;
			end
	end

endmodule

