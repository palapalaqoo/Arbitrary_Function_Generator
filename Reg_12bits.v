`timescale	1ns/1ps

module	Reg_12bits(Dout, Din, Clock, Reset)	;

output	[11:0]	Dout	;
reg	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	Clock, Reset	;
wire	Clock, Reset	;


always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Dout <= 12'b0000_0000_0000	;
			end
		else
			begin
				Dout <= Din	;
			end
	end

endmodule
