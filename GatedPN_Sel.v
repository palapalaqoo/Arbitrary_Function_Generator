`timescale	1ns/1ps

module	GatedPN_Sel(Sout, Sin, PN_Sel, Clock)	;

output	Sout	;
reg	Sout	;

input	Sin	;
wire	Sin	;

input	PN_Sel	;
wire	PN_Sel	;

input	Clock	;
wire	Clock	;



always	@(posedge	Clock)
	begin
		if ( PN_Sel == 1'b0 )
			begin
				Sout <= Sin	;
			end
		else
			begin
				Sout <= ~Sin	;
			end
	end

endmodule
