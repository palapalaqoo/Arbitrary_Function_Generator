`timescale	1ns/1ps

module	BPMC_Mux2to1(M_out, Din_1, Sel_in, Clock, Reset)	;

output	M_out	;
wire	M_out	;

input	Din_1	;
wire	Din_1	;

input	Sel_in	;
wire	Sel_in	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	Mout_temp00, Mout_temp01, Mout_temp02, Mout_temp03	;
wire	CT_OUT, MTemp	;

assign	MTemp = CT_OUT & Mout_temp03	;

BPMC_Mux				BPMC_M21(.Mout(Mout_temp00), .Min_1(Sel_in), .Min_2(Din_1), .Sel_in(Sel_in))	;
BPMC_Reg1bits		BPMC_R1b00(.Dout(Mout_temp01), .Din(Mout_temp00), .Clock(Clock), .Reset(Reset))	;
BPMC_Reg1bits		BPMC_R1b01(.Dout(Mout_temp02), .Din(Mout_temp01), .Clock(Clock), .Reset(Reset))	;
BPMC_Reg1bits		BPMC_R1b02(.Dout(Mout_temp03), .Din(Mout_temp02), .Clock(Clock), .Reset(Reset))	;

BPMC_Ctrl			BPMC_CT(.M_OUT(CT_OUT), .CP_SUM_IN(Sel_in), .IE_IN(Din_1), .Clock(Clock), .Reset(Reset))	;
BPMC_Reg1bits		BPMC_R1b03(.Dout(M_out), .Din(MTemp), .Clock(Clock), .Reset(Reset))	;


endmodule
