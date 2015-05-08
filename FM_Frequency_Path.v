`timescale	1ns/1ps

module	FM_Frequency_Path(Dout, Din, Clock)	;

output	[47:0]	Dout	;
wire	[47:0]	Dout	;

input	[47:0]	Din	;
wire	[47:0]	Din	;

input	Clock	;
wire	Clock	;

wire	[47:0]	FMRate_VT00	;


BufReg48B		FM_Rate_VT00(.Dout(FMRate_VT00), .Din(Din), .Clock(Clock))	;
BufReg48B		FM_Rate_VT01(.Dout(Dout), .Din(FMRate_VT00), .Clock(Clock))	;

endmodule
