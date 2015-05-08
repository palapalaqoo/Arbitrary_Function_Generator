`timescale	1ns/1ps

module	Sweep_SweepTime_Path(Dout, Din, Clock)	;

output	[47:0]	Dout	;
wire	[47:0]	Dout	;

input	[47:0]	Din	;
wire	[47:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[47:0]	SweepTime_VT00	;


BufReg48B		SW_SweepTime_VT00(.Dout(SweepTime_VT00), .Din(Din), .Clock(Clock))	;
BufReg48B		SW_SweepTime_VT01(.Dout(Dout), .Din(SweepTime_VT00), .Clock(Clock))	;

endmodule
