`timescale	1ns/1ps

module	Addition_2bits(out_c, cout, in_a, in_b, cin, Clock, Reset)	;

output	[1:0]	out_c	;
reg	[1:0]	out_c	;

output	cout	;
reg	cout	;

input	[1:0]	in_a, in_b	;
wire	[1:0]	in_a, in_b	;

input	cin	;
wire	cin	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	[1:0]	Stemp	;
wire	Ctemp	;

assign	{Ctemp, Stemp} = in_a + in_b + cin	;

always	@(posedge	Clock)
	begin
		if (Reset == 1'b0)
			begin
				{cout,out_c} <= 3'b0	;
			end
		else
			begin
				{cout, out_c} <= {Ctemp, Stemp}	;
			end
	end

endmodule

