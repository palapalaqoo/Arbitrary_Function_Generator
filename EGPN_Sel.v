`timescale	1ns/1ps

module	EGPN_Sel(Sout, Sin, PN_Sel, Clock, Reset)	;

output	Sout	;
reg	Sout	;

input	Sin	;
wire	Sin	;

input	PN_Sel	;
wire	PN_Sel	;

input	Clock, Reset	;
wire	Clock, Reset	;



reg	PS_Temp, NS_Temp	;

always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				PS_Temp <= 1'b0	;
				NS_Temp <= 1'b0	;
			end
		else
			begin
				PS_Temp <= Sin	;
				NS_Temp <= ~Sin	;
			end
	end

always	@(posedge	Clock)
	begin
		if ( PN_Sel == 1'b0 )
			begin
				Sout <= PS_Temp	;
			end
		else
			begin
				Sout <= NS_Temp	;
			end
	end

endmodule
