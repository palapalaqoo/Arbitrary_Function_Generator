`timescale	1ns/1ps

module	FSK_IPeriod_LD42B(Dout, Din, EN, Clock, Reset)	;

output	[41:0]	Dout	;
reg	[41:0]	Dout	;

input	[41:0]	Din	;
wire	[41:0]	Din	;

input	EN	;
wire	EN	;

input	Clock, Reset	;
wire	Clock, Reset	;

always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Dout <= 42'b00_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000	;
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

