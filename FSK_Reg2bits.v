`timescale	1ns/1ps

module	FSK_Reg2bits(D_out, D_in, Clock)	;

output	[1:0]	D_out	;
reg	[1:0]	D_out	;

input	[1:0]	D_in	;
wire	[1:0]	D_in	;

input	Clock	;
wire	Clock	;

always	@(posedge	Clock)
	begin
		D_out <= D_in	;
	end

endmodule
