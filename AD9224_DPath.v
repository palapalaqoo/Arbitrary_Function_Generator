`timescale	1ns/1ps

module	AD9224_DataPath(Dout, Din, Clock)	;

output	[11:0]	Dout	;
wire	[11:0]	Dout	;

input	[11:0]	Din	;
wire	[11:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[11:0]	path_w00, path_w01, path_w02	;

BufReg12B	RB00(.Dout(path_w00), .Din(Din), .Clock(Clock))	;
BufReg12B	RB01(.Dout(path_w01), .Din(path_w00), .Clock(Clock))	;
BufReg12B	RB02(.Dout(path_w02), .Din(path_w01), .Clock(Clock))	;
BufReg12B	RB03(.Dout(Dout), .Din(path_w02), .Clock(Clock))	;


endmodule
