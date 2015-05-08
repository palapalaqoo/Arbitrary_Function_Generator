`timescale	1ns/1ps

module	KeyData_LD16B(Dout, Din, EN, Clock, Reset)	;

output	[15:0]	Dout	;
reg	[15:0]	Dout	;

input	[15:0]	Din	;
wire	[15:0]	Din	;

input	EN	;
wire	EN	;

input	Clock, Reset	;
wire	Clock, Reset	;

always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Dout <= 16'b00_0000_0000_0000	;
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

