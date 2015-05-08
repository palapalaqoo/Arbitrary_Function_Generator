`timescale	1ns/1ps

module	Pulse_Front(PF_out, PF_in, Clock)	;

output	PF_out	;
wire	PF_out	;

input	PF_in	;
wire	PF_in	;

input	Clock	;
wire	Clock	;


wire	PFD1_Temp	;
wire	PFAND_Temp	;

assign	PFAND_Temp = PF_in & (~PFD1_Temp)	;

DFF	PFD1(.Dout(PFD1_Temp), .Din(PF_in), .Clock(Clock))	;
DFF	PFD2(.Dout(PF_out), .Din(PFAND_Temp), .Clock(Clock))	;

endmodule
