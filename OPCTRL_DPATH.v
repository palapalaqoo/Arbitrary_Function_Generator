`timescale	1ns/1ps

module	OPCTRL_DPATH(Dout, Din, Clock)	;
	
output	[31:0]	Dout	;
wire	[31:0]	Dout	;

input	[31:0]	Din	;
wire	[31:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[31:0]	OPC_PATHT00, OPC_PATHT01	;


BufReg32B		OPC_P00(.Dout(OPC_PATHT00), .Din(Din), .Clock(Clock))	;
BufReg32B		OPC_P01(.Dout(OPC_PATHT01), .Din(OPC_PATHT00), .Clock(Clock))	;
BufReg32B		OPC_P02(.Dout(Dout), .Din(OPC_PATHT01), .Clock(Clock))	;


endmodule
