`timescale	1ns/1ps

module	ARB_DDS_SNC_SEL(Dout, Din1, Din2, SEL, Clock)	;

output	Dout	;
reg	Dout	;

input	Din1, Din2	;
wire	Din1, Din2	;

input	SEL	;
wire	SEL	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		if ( SEL == 1'b1 )
			begin
				Dout <= Din2	;
			end
		else 
			begin
				Dout <= Din1	;
			end
	end

endmodule

