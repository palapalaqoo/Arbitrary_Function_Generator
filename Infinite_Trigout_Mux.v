`timescale	1ns/1ps

module	Infinite_Trigout_Mux(Dout, Din1, Din2, Sel, EN, Clock)	;

output	Dout	;
reg	Dout	;

input	Din1, Din2	;
wire	Din1, Din2	;

input	Sel	;
wire	Sel	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


//assign	Dout = Sel ? Din2 : Din1	;


always	@(posedge	Clock)
	begin
		if ( EN == 1'b1 )
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
		else
			begin
				Dout <= 1'b0	;
			end
	end


endmodule

