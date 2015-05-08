`timescale	1ns/1ps

module	Analog_Vol_Reg11B(Dout, Din, Clock)	;

output	[11:0]	Dout	;
reg	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule
