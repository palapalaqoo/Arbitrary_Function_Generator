`timescale	1ns/1ps

module	BufReg34B(Dout, Din, Clock)	;

output	[33:0]	Dout	;
reg	[33:0]	Dout	;

input	[33:0]	Din	;
wire	[33:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end


endmodule

