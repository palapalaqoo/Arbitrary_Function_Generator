`timescale	1ns/1ps

module	CVG_DAC7821_CSbar_DPATH(Dout, Din, Clock, Reset)	;

output	Dout	;
reg	Dout	;

input	Din	;
wire	Din	;

input	Clock, Reset	;
wire	Clock, Reset	;


always	@(posedge	Clock)
	begin
		if ( Reset == 1'b1 )
			begin
				Dout <= Din	;
			end
		else
			begin
				Dout <= 1'b0	;
			end
	end

endmodule
