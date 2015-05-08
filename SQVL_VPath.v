`timescale	1ns/1ps

module	SQVL_VPath(Dout, Din, EN, Clock)	;

output	[11:0]	Dout	;
wire	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


wire	[11:0]	SQVL_VPath_VU00, SQVL_VPath_VU01	;



Analog_Vol_Reg11B						SQVL_VPath_VT00(.Dout(SQVL_VPath_VU00), .Din(Din), .Clock(Clock))	;
Analog_Vol_Reg11B						SQVL_VPath_VT01(.Dout(SQVL_VPath_VU01), .Din(SQVL_VPath_VU00), .Clock(Clock))	;

LREG_D11B								SQVL_VPath_VT02(.Dout(Dout), .Din(SQVL_VPath_VU01), .EN(EN), .Clock(Clock))	;

endmodule
