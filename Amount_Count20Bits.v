`timescale	1ns/1ps

module	Burst_Amount_Count20Bits(SUM_OUT, EN, Clock, Reset)	;

output	[19:0]	SUM_OUT	;
wire	[19:0]	SUM_OUT	;

input	EN	;
wire	EN	;

input	Clock, Reset	;
wire	Clock, Reset	;


reg	[19:0]	SUM_Temp	;

Amount_Reg20B		AMR20B00(.Dout(SUM_OUT), .Din(SUM_Temp), .Clock(Clock))	;

always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				SUM_Temp <= 20'b0000_0000_0000_0000_0000	;
			end
		else if ( EN == 1'b1 )
			begin
				SUM_Temp <= SUM_Temp + 1'b1	;
			end
		else if ( EN == 1'b0 )
			begin
				SUM_Temp <= SUM_Temp	;
			end
	end

endmodule
