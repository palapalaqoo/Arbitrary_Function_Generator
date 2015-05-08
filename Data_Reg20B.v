`timescale	1ns/1ps

module	Data_Reg20B(Dout, Din, Clock)	;

output	[19:0]	Dout	;
reg	[19:0]	Dout	;

input	[19:0]	Din	;
wire	[19:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule
