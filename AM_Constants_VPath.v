`timescale	1ns/1ps

module	AM_Constants_VPath(Dout, Din, Clock)	;

output	[15:0]	Dout	;
wire	[15:0]	Dout	;

input	[15:0]	Din	;
wire	[15:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[15:0]	AM_Constants_VU00	;



Data_Reg16B						AM_Constants_VT00(.Dout(AM_Constants_VU00), .Din(Din), .Clock(Clock))	;
Data_Reg16B						AM_Constants_VT01(.Dout(Dout), .Din(AM_Constants_VU00), .Clock(Clock))	;

			

endmodule
