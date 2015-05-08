`timescale	1ns/1ps

module	OPN_Sel(Sout_EXT, Sin, Sel_H, Sel_L, Clock)	;

output	Sout_EXT	;
reg	Sout_EXT	;

input	Sin	;
wire	Sin	;

input	Sel_H, Sel_L	;
wire	Sel_H, Sel_L	;

input	Clock	;
wire	Clock	;



always	@(posedge	Clock)
	begin
		if ( {Sel_H, Sel_L} == 2'b00 )
			begin
				Sout_EXT <= 1'b0	;
			end
		else if ( {Sel_H, Sel_L} == 2'b01 )
			begin
				Sout_EXT <= Sin	;
			end
		else if ( {Sel_H, Sel_L} == 2'b10 )
			begin
				Sout_EXT <= ~Sin	;
			end
		else if ( {Sel_H, Sel_L} == 2'b11 )
			begin
				Sout_EXT <= 1'b0	;
			end
	end

endmodule
