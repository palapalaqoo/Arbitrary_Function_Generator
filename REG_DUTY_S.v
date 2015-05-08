`timescale	1ns/1ps

module	REG_DUTY_S(Dout, Din, EN, Clock, Reset)	;

output	[11:0]	Dout	;
reg	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	EN	;
wire	EN	;

input	Clock, Reset	;
wire	Clock, Reset	;


always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Dout <= 12'b0000_0000_0000	;
			end
		else if ( EN == 1'b1 )
			begin
				Dout <= Din	;
			end
		else
			begin
				Dout <= Dout	;
			end
	end

endmodule
