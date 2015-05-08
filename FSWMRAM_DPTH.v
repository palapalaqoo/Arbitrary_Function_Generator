`timescale	1ns/1ps

module	FSWMRAM_DPTH(Dout, Aout, Wout, Win, Ain, Din, Clock)	;

output	[11:0]	Dout, Aout	;
wire	[11:0]	Dout, Aout	;

output	Wout	;
wire	Wout	;

input	[11:0]	Ain, Din	;
wire	[11:0]	Ain, Din	;

input	Win	;
wire	Win	;


input	Clock	;
wire	Clock	;


wire	[11:0]	Aout00, Dout00	;


BufReg1B				FSWMRAM_WBR00(.Dout(Wout), .Din(Win), .Clock(Clock))	;

BufReg12B			FSWMRAM_ABR00(.Dout(Aout00), .Din(Ain), .Clock(Clock))	;
BufReg12B			FSWMRAM_ABR01(.Dout(Aout), .Din(Aout00), .Clock(Clock))	;


BufReg12B			FSWMRAM_DBR00(.Dout(Dout00), .Din(Din), .Clock(Clock))	;
BufReg12B			FSWMRAM_DBR01(.Dout(Dout), .Din(Dout00), .Clock(Clock))	;


endmodule

