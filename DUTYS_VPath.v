`timescale	1ns/1ps

module	DUTYS_VPath(Dout, Din, EN, Clock)	;

output	[11:0]	Dout	;
wire	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


wire	[11:0]	DUTYS_VPath_VU00, DUTYS_VPath_VU01	;



Analog_Vol_Reg11B						DUTYS_VPath_VT00(.Dout(DUTYS_VPath_VU00), .Din(Din), .Clock(Clock))	;
Analog_Vol_Reg11B						DUTYS_VPath_VT01(.Dout(DUTYS_VPath_VU01), .Din(DUTYS_VPath_VU00), .Clock(Clock))	;

LREG_D11B								DUTYS_VPath_VT02(.Dout(Dout), .Din(DUTYS_VPath_VU01), .EN(EN), .Clock(Clock))	;

endmodule
