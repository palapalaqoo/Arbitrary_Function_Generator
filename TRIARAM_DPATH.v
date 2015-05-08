`timescale	1ns/1ps

module	TRIARAM_DPATH(Dout, Aout, ENout, Ain, Din, ENin, Clock, Clock2)	;

output	[15:0]	Dout	;
wire	[15:0]	Dout	;

output	[9:0]	Aout	;
wire	[9:0]	Aout	;

output	ENout	;
wire	ENout	;

input	[15:0]	Din	;
wire	[15:0]	Din	;

input	[9:0]	Ain	;
wire	[9:0]	Ain	;

input	ENin	;
wire	ENin	;

input	Clock, Clock2;
wire	Clock, Clock2	;


wire	ENin00, ENin01	;
wire	[15:0]	Data16Temp00, Data16Temp01	;
wire	[9:0]		Addr10Temp00	;


BufReg1B				ENBR00(.Dout(ENin00), .Din(ENin), .Clock(Clock2))	;
BufReg1B				ENBR01(.Dout(ENin01), .Din(ENin00), .Clock(Clock2))	;
BufReg1B				ENBR02(.Dout(ENout), .Din(ENin01), .Clock(Clock2))	;


BufReg16B			DataBR00(.Dout(Data16Temp00), .Din(Din), .Clock(Clock))	;
BufReg16B			DataBR01(.Dout(Data16Temp01), .Din(Data16Temp00), .Clock(Clock))	;
BufReg16B			DataBR02(.Dout(Dout), .Din(Data16Temp01), .Clock(Clock))	;


BufReg10B			AddrBR00(.Dout(Addr10Temp00), .Din(Ain), .Clock(Clock))	;
BufReg10B			AddrBR01(.Dout(Aout), .Din(Addr10Temp00), .Clock(Clock))	;


endmodule

