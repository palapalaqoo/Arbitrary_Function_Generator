`timescale	1ns/1ps

module	ARB_DDS_OSEL(Dout, Din1, Din2, SEL, Clock)	;

output	[15:0]	Dout	;
//reg	[15:0]	Dout	;

input	[15:0]	Din1, Din2	;
wire	[15:0]	Din1, Din2	;

input	SEL	;
wire	SEL	;

input	Clock	;
wire	Clock	;
wire [15:0]	Dout;
assign Dout=(SEL == 1'b1)? Din2:Din1;
/*
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
*/
endmodule

