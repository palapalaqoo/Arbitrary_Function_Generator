`timescale	1ns/1ps

module	Phase_Mux14B(Dout, Din1, Din2, Sel, Clock)	;

output	[13:0]	Dout	;
reg	[13:0]	Dout	;

input	[13:0]	Din1, Din2	;
wire	[13:0]	Din1, Din2	;

input	Sel	;
wire	Sel	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		if ( Sel == 1'b1 )
			begin
				Dout <= Din2	;
			end
		else
			begin
				Dout <= Din1	;
			end
	end

endmodule



