`timescale	1ns/1ps

module	Burst_Count_LD20B(Dout, Din, EN, Clock, Reset)	;

output	[19:0]	Dout	;
reg	[19:0]	Dout	;

input	[19:0]	Din	;
wire	[19:0]	Din	;

input	EN	;
wire	EN	;

input	Clock, Reset	;
wire	Clock, Reset	;

always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Dout <= 20'b0000_0000_0000_0000_0000	;
			end
		else if ( EN == 1'b1 )
			begin
				Dout <= Din	;
			end
		else
			begin
				Dout <= Dout	;
			end
	end

endmodule

