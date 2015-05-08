`timescale	1ns/1ps

module	DCOFFSET_VPath(Dout, Din, EN, Clock)	;

output	[11:0]	Dout	;
wire	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	Clock	;
wire	Clock	;

input	EN	;
wire	EN	;

wire	[11:0]	DCOFFSET_VU00, DCOFFSET_VU01	;



Analog_Vol_Reg11B						DCOFFSET_VT00(.Dout(DCOFFSET_VU00), .Din(Din), .Clock(Clock))	;
Analog_Vol_Reg11B						DCOFFSET_VT01(.Dout(DCOFFSET_VU01), .Din(DCOFFSET_VU00), .Clock(Clock))	;

LREG_D11B								DCOFFSET_VT02(.Dout(Dout), .Din(DCOFFSET_VU01), .EN(EN), .Clock(Clock))	;

endmodule
