`timescale	1ns/1ps

module	BFS_Trigout_SEL(Dout, Din1, Din2, Sel, Clock)	;

output	Dout	;
reg	Dout	;

input	Din1, Din2	;
wire	Din1, Din2	;

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


