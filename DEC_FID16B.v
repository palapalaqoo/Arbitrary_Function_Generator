`timescale	1ns/1ps

module	DEC_FID16B(Dout, Din, Clock)	;

output	[15:0]	Dout	;
reg	[15:0]	Dout	;

input	[15:0]	Din	;
wire	[15:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule
