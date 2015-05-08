`timescale	1ns/1ps

module	FM_Deviation_Path(Dout, Din, Clock)	;

output	[47:0]	Dout	;
wire	[47:0]	Dout	;

input	[47:0]	Din	;
wire	[47:0]	Din	;

input	Clock	;
wire	Clock	;

wire	[47:0]	DEV_VT00	;


BufReg48B		FM_DEV_VT00(.Dout(DEV_VT00), .Din(Din), .Clock(Clock))	;
BufReg48B		FM_DEV_VT01(.Dout(Dout), .Din(DEV_VT00), .Clock(Clock))	;

endmodule
