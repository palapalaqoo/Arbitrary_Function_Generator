`timescale	1ns/1ps

module	BufReg10B(Dout, Din, Clock)	;

output	[9:0]	Dout	;
reg	[9:0]	Dout	;

input	[9:0]	Din	;
wire	[9:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule
