`timescale	1ns/1ps

module	BufReg32B(Dout, Din, Clock)	;

output	[31:0]	Dout	;
reg	[31:0]	Dout	;

input	[31:0]	Din	;
wire	[31:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule


