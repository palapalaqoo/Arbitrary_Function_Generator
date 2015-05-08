`timescale	1ns/1ps

module	Comp_Reg20bits(Dout, Din, Clock, Reset)	;

output	[19:0]	Dout	;
reg	[19:0]	Dout	;

input	[19:0]	Din	;
wire	[19:0]	Din	;

input	Clock, Reset	;
wire	Clock, Reset	;

always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Dout <= 20'b0000_0000_0000_0000_0000	;
			end
		else
			begin
				Dout <= Din	;
			end
	end

endmodule
