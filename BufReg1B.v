`timescale	1ns/1ps

module	BufReg1B(Dout, Din, Clock)	;

output	Dout	;
reg	Dout	;

input	Din	;
wire	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule
