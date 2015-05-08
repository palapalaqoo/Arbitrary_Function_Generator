`timescale	1ns/1ps

module	Central_Freq_path(Dout, Din, Clock)	;

output	[47:0]	Dout	;
wire	[47:0]	Dout	;

input	[47:0]	Din	;
wire	[47:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[47:0]	Central_Freq_VUT00	;

BufReg48B					CF_VT00(.Dout(Central_Freq_VUT00), .Din(Din), .Clock(Clock))	;
BufReg48B					CF_VT01(.Dout(Dout), .Din(Central_Freq_VUT00), .Clock(Clock))	;


endmodule	
