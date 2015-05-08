`timescale	1ns/1ps

module	BPMC_Ctrl(M_OUT, CP_SUM_IN, IE_IN, Clock, Reset)	;

output	M_OUT	;
wire	M_OUT	;

input	CP_SUM_IN, IE_IN	;
wire	CP_SUM_IN, IE_IN	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	BPMC_CP_Temp	;


BPMC_Pulse		BPMC_CP(.Dout(BPMC_CP_Temp), .DIN_1(IE_IN), .DIN_2(CP_SUM_IN), .Clock(Clock))	;
Pulse_Trig		BPMC_PT(.Dout(M_OUT), .PT_EN(BPMC_CP_Temp), .Clock(Clock), .Reset(Reset))	;


endmodule
