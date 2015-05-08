`timescale	1ns/1ps

module	BufReg42B(Dout, Din, Clock)	;

output	[41:0]	Dout	;
reg	[41:0]	Dout	;

input	[41:0]	Din	;
wire	[41:0]	Din	;


input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule


