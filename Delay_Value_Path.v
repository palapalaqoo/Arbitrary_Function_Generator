`timescale	1ns/1ps

module	Delay_Value_Path(VDout, VDin, Clock)	;

output	[33:0]	VDout	;
wire	[33:0]	VDout	;

input	[33:0]	VDin	;
wire	[33:0]	VDin	;

input	Clock	;
wire	Clock	;

wire	[33:0]	VDTemp00, VDTemp01, VDTemp02, VDTemp03	; 


BufReg34B		DV_BR00(.Dout(VDTemp00), .Din(VDin), .Clock(Clock))	;
BufReg34B		DV_BR01(.Dout(VDTemp01), .Din(VDTemp00), .Clock(Clock))	;
BufReg34B		DV_BR02(.Dout(VDTemp02), .Din(VDTemp01), .Clock(Clock))	;
BufReg34B		DV_BR03(.Dout(VDTemp03), .Din(VDTemp02), .Clock(Clock))	;
BufReg34B		DV_BR04(.Dout(VDout), .Din(VDTemp03), .Clock(Clock))	;


endmodule
