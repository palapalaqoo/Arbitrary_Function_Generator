`timescale	1ns/1ps

module	DEC_DReg17B(Dout, Din, Clock)	;

output	[16:0]	Dout	;
reg	[16:0]	Dout	;

input	[16:0]	Din	;
wire	[16:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule
