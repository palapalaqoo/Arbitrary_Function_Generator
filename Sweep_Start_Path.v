`timescale	1ns/1ps

module	Sweep_Start_Path(Dout, Din, Clock)	;

output	[47:0]	Dout	;
wire	[47:0]	Dout	;

input	[47:0]	Din	;
wire	[47:0]	Din	;

input	Clock	;
wire	Clock	;

wire	[47:0]	SWStart_VT00	;


BufReg48B		SW_Start_VT00(.Dout(SWStart_VT00), .Din(Din), .Clock(Clock))	;
BufReg48B		SW_Start_VT01(.Dout(Dout), .Din(SWStart_VT00), .Clock(Clock))	;

endmodule
