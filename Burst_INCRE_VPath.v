`timescale	1ns/1ps

module	Burst_INCRE_VPath(Dout, Din, Clock)	;

output	[15:0]	Dout	;
wire	[15:0]	Dout	;

input	[15:0]	Din	;
wire	[15:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[15:0]	Burst_INCRE_VU00, Burst_INCRE_VU01, Burst_INCRE_VU02	;



Data_Reg16B						Burst_INCRE_VT00(.Dout(Burst_INCRE_VU00), .Din(Din), .Clock(Clock))	;
Data_Reg16B						Burst_INCRE_VT01(.Dout(Burst_INCRE_VU01), .Din(Burst_INCRE_VU00), .Clock(Clock))	;
Data_Reg16B						Burst_INCRE_VT02(.Dout(Burst_INCRE_VU02), .Din(Burst_INCRE_VU01), .Clock(Clock))	;
Data_Reg16B						Burst_INCRE_VT03(.Dout(Dout), .Din(Burst_INCRE_VU02), .Clock(Clock))	;
			

endmodule
