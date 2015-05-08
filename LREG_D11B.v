`timescale	1ns/1ps

module	LREG_D11B(Dout, Din, EN, Clock)	;

output	[11:0]	Dout	;
reg	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		if ( EN == 1'b1 )
			begin
				Dout <= Din	;
			end
		else if (EN == 1'b0 )
			begin
				Dout <= Dout	;
			end
	end

endmodule
