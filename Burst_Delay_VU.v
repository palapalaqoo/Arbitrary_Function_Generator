`timescale	1ns/1ps

module	Burst_Delay_VU(Dout, Din, EN, Clock, Reset)	;

output	[33:0]	Dout	;
reg	[33:0]	Dout	;

input	[33:0]	Din	;
wire	[33:0]	Din	;

input	EN	;
wire	EN	;

input	Clock, Reset	;
wire	Clock, Reset	;


always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Dout <= 34'b00_0000_0000_0000_0000_0000_0000_0000_0000	;
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

