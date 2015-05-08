`timescale	1ns/1ps

module	EXTSIN_DPATH(Dout, Din, Clock)	;

output	Dout	;
wire	Dout	;

input	Din	;
wire	Din	;

input	Clock	;
wire	Clock	;

wire	DPATHT00	;

EXTSIN_REG1B		EXTSIN_REG1B00(.Dout(DPATHT00), .Din(Din), .Clock(Clock))	;
EXTSIN_REG1B		EXTSIN_REG1B01(.Dout(Dout), .Din(DPATHT00), .Clock(Clock))	;

endmodule	

