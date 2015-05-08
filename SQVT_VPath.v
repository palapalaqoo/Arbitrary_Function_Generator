`timescale	1ns/1ps

module	SQVT_VPath(Dout, Din, EN, Clock)	;

output	[11:0]	Dout	;
wire	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


wire	[11:0]	SQVT_VPath_VU00, SQVT_VPath_VU01	;



Analog_Vol_Reg11B						SQVT_VPath_VT00(.Dout(SQVT_VPath_VU00), .Din(Din), .Clock(Clock))	;
Analog_Vol_Reg11B						SQVT_VPath_VT01(.Dout(SQVT_VPath_VU01), .Din(SQVT_VPath_VU00), .Clock(Clock))	;

LREG_D11B								SQVT_VPath_VT02(.Dout(Dout), .Din(SQVT_VPath_VU01), .EN(EN), .Clock(Clock))	;

			

endmodule
