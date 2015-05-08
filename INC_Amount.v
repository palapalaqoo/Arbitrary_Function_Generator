`timescale	1ns/1ps

module	INC_Amount(Dout, Din, Clock, Reset)	;

output	Dout	;
wire	Dout	;

input	Din	;
wire	Din	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	Temp_OR	;
wire	Temp_Buf	;

assign	Temp_OR = Temp_Buf | Din	;

Amount_Reg1B		AR1B_00(.Dout(Temp_Buf), .Din(Din), .Clock(Clock), .Reset(Reset))	;
Amount_Reg1B		AR1B_01(.Dout(Dout), .Din(Temp_OR), .Clock(Clock), .Reset(Reset))	;

endmodule
