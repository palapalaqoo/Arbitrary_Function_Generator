`timescale	1ns/1ps

module	BufReg14B(Dout, Din, Clock)	;

output	[13:0]	Dout	;
reg	[13:0]	Dout	;

input	[13:0]	Din	;
wire	[13:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule
