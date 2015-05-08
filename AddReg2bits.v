`timescale	1ns/1ps

module	AddReg2bits(D_out, D_in, Clock, Reset)	;

output	[1:0]	D_out	;
reg	[1:0]	D_out	;

input	[1:0]	D_in	;
wire	[1:0]	D_in	;

input	Clock, Reset	;
wire	Clock, Reset	;

always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				D_out <= 2'b00	;
			end
		else
			begin
				D_out <= D_in	;
			end
	end

endmodule
