`timescale	1ns/1ps

module	PSWR_Path(Dout, Din, Clock)	;

output	Dout	;
wire	Dout	;

input	Din	;
wire	Din	;

input	Clock	;
wire	Clock	;


wire	wire00, wire01	;


BufReg1B		INFIN_Buf00(.Dout(wire00), .Din(Din), .Clock(Clock))	;
BufReg1B		INFIN_Buf01(.Dout(wire01), .Din(wire00), .Clock(Clock))	;
BufReg1B		INFIN_Buf02(.Dout(Dout), .Din(wire01), .Clock(Clock))	;


endmodule
