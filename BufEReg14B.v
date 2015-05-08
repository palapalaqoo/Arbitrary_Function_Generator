`timescale	1ns/1ps

module	BufEReg14B(Dout, Din1, Din2, EN, Clock)	;

output	[13:0]	Dout	;
reg	[13:0]	Dout	;

input	[13:0]	Din1, Din2	;
wire	[13:0]	Din1, Din2	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		if ( EN == 1'b1 )
			begin
				Dout <= Din1	;
			end
		else
			begin
				Dout <= Din2	;
			end
	end

endmodule

