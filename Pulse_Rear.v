`timescale	1ns/1ps

module	Pulse_Rear(PR_out, PR_in, Clock)	;

output	PR_out	;
wire	PR_out	;

input	PR_in	;
wire	PR_in	;

input	Clock	;
wire	Clock	;


wire	PRD1_Temp	;
wire	PRAND_Temp	;

assign	PRAND_Temp = (~PR_in) & PRD1_Temp	;

DFF	PRD1(.Dout(PRD1_Temp), .Din(PR_in), .Clock(Clock))	;
DFF	PRD2(.Dout(PR_out), .Din(PRAND_Temp), .Clock(Clock))	;

endmodule
