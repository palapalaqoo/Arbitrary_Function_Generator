`timescale	1ns/1ps

module	FSK_acc_2bits(out_c, cout, in_a, cin, EN, Clock, Reset)	;

output	[1:0]	out_c	;
reg	[1:0]	out_c	;

output	cout	;
reg	cout	;

input	[1:0]	in_a	;
wire	[1:0]	in_a	;

input	cin	;
wire	cin	;

input	Clock, Reset	;
wire	Clock, Reset	;

input	EN	;
wire	EN	;

wire	[1:0]	B	;
assign	B = out_c	;

wire	[1:0]	Stemp	;
wire	Ctemp	;

assign	{Ctemp, Stemp} = in_a + B + cin	;

always	@(posedge	Clock)
	begin
		if (Reset == 1'b0)
			begin
				{cout,out_c} <= 3'b0	;
			end
		else if ( Reset == 1'b1 )
			begin
				if ( EN == 1'b0 )
					begin
						{cout, out_c} <= 3'b0	;
					end
				else if ( EN == 1'b1 )
					begin
						{cout, out_c} <= {Ctemp, Stemp}	;
					end
			end
	end

endmodule

