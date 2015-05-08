`timescale	1ns/1ps

module	Reg_Buf3bits(Dout, Din, Clock, Reset)	;

output	[2:0]	Dout	;
reg	[2:0]	Dout	;

input	[2:0]	Din	;
wire	[2:0]	Din	;

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
				Dout <= 3'b000	;
			end
	end

endmodule

