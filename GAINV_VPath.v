`timescale	1ns/1ps

module	GAINV_VPath(Dout, Din, EN, Clock)	;

output	[11:0]	Dout	;
wire	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


wire	[11:0]	GAINV_VPath_VU00, GAINV_VPath_VU01	;



Analog_Vol_Reg11B						GAINV_VPath_VT00(.Dout(GAINV_VPath_VU00), .Din(Din), .Clock(Clock))	;
Analog_Vol_Reg11B						GAINV_VPath_VT01(.Dout(GAINV_VPath_VU01), .Din(GAINV_VPath_VU00), .Clock(Clock))	;

LREG_D11B								GAINV_VPath_VT02(.Dout(Dout), .Din(GAINV_VPath_VU01), .EN(EN), .Clock(Clock))	;


			

endmodule
