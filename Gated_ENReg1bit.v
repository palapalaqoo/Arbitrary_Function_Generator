`timescale	1ns/1ps

module	Gated_ENReg1bit(Dout, Din, EN, Clock)	;

output	Dout	;
reg	Dout	;

input	Din	;
wire	Din	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		if ( EN == 1'b1 )
			begin
				Dout <= Din	;
			end
		else
			begin
				Dout <= 1'b0	;
			end
	end

endmodule	
