`timescale	1ns/1ps

module	FM_Sweep_Reg48B(Dout, Din, Clock)	;

output	[47:0]	Dout	;
reg	[47:0]	Dout	;

input	[47:0]	Din	;
wire	[47:0]	Din	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		Dout <= Din	;
	end

endmodule

