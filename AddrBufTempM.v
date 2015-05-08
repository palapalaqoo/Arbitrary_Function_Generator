`timescale	1ns/1ps

module	AddrBufTempM(Dout, Din, Clock)	;

output	[13:0]	Dout	;
wire	[13:0]	Dout	;

input	[13:0]	Din	;
wire	[13:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[13:0]	ABT_Wire00, ABT_Wire01	;

BufReg14B				BUFTEMP00(.Dout(ABT_Wire00), .Din(Din), .Clock(Clock))	;
BufReg14B				BUFTEMP01(.Dout(ABT_Wire01), .Din(ABT_Wire00), .Clock(Clock))	;
BufReg14B				BUFTEMP02(.Dout(Dout), .Din(ABT_Wire01), .Clock(Clock))	;

endmodule

