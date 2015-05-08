`timescale	1ns/1ps

module	Pulse_Trig(Dout, PT_EN, Clock, Reset)	;

output	Dout	;
reg	Dout	;

input	PT_EN	;
wire	PT_EN	;

input	Clock, Reset	;
wire	Clock, Reset	;


always	@(posedge	Clock)
	begin
		if( Reset == 1'b0 )
			begin
				Dout <= 1'b1	;
			end
		else if (  PT_EN == 1'b1 )
			begin
				Dout <= ~Dout	;
			end
		else
			begin
				Dout <= Dout	;
			end
	end

endmodule
