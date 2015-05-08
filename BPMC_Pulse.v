`timescale	1ns/1ps

module	BPMC_Pulse(Dout, DIN_1, DIN_2, Clock)	;

output	Dout	;
wire	Dout	;

input	DIN_1, DIN_2	;
wire	DIN_1, DIN_2	;

input	Clock	;
wire	Clock	;



wire	PF_Temp, PR_Temp	;
wire	BP_ORTemp	;
assign	BP_ORTemp = PF_Temp | PR_Temp	;


Pulse_Front		BP_PF(.PF_out(PF_Temp), .PF_in(DIN_1), .Clock(Clock))	;
Pulse_Rear		BP_PR(.PR_out(PR_Temp), .PR_in(DIN_2), .Clock(Clock))	;
DFF				BP_DFF(.Dout(Dout), .Din(BP_ORTemp), .Clock(Clock))	;

endmodule
