`timescale	1ns/1ps

module	BufReg14RB(Dout, Din, Clock, Reset)	;

output	[13:0]	Dout	;
reg	[13:0]	Dout	;

input	[13:0]	Din	;
wire	[13:0]	Din	;

input	Clock, Reset	;
wire	Clock, Reset	;


always	@(posedge	Clock)
	begin
		if ( Reset == 1'b1 )
			begin
				Dout <= Din	;
			end
		else
			begin
				Dout <= 14'b00_0000_0000_0000	;
			end
	end

endmodule
