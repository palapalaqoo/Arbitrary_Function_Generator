`timescale	1ns/1ps

module	SW_Marker_DPath(Dout, Din, Clock)	;

output	[11:0]	Dout	;
wire	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[11:0]	SWMDP_Wire00, SWMDP_Wire01	;

BufReg12B		SWMK_DPT00(.Dout(SWMDP_Wire00), .Din(Din), .Clock(Clock))	;
BufReg12B		SWMK_DPT01(.Dout(SWMDP_Wire01), .Din(SWMDP_Wire00), .Clock(Clock))	;
BufReg12B		SWMK_DPT02(.Dout(Dout), .Din(SWMDP_Wire01), .Clock(Clock))	;

endmodule
