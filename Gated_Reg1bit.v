`timescale	1ns/1ps

module	Gated_Reg1bit(Dout, Din, Clock, Reset)	;

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
				Dout <= 1'b0	;
			end
		else
			begin
				Dout <= Din	;
			end
	end

endmodule

