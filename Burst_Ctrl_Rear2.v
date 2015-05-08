`timescale	1ns/1ps

module	Burst_Ctrl_Rear2(Pulse_Reset, Pulse_EN, BAC_Reset_out, CP_Sum_in, BPI_Sout_in, BPE_Sout_in,
									IE_Sel_in, Gated_Sel_in, BAC_Action_EN_in, Gated_Trig_Sel, EXT_Trig_Sel,
									Trig_Sout, Pulse_CTRL, EN_INF, EN_MAN, Delay_Value, Clock, Reset, Clock107)	;

output	Pulse_Reset, Pulse_EN, BAC_Reset_out	;
wire	Pulse_Reset, Pulse_EN, BAC_Reset_out	;

output	Trig_Sout	;
wire	Trig_Sout	;

input	CP_Sum_in, BPI_Sout_in, BPE_Sout_in	;
wire	CP_Sum_in, BPI_Sout_in, BPE_Sout_in	;

input	IE_Sel_in, BAC_Action_EN_in, Gated_Sel_in	;
wire	IE_Sel_in, BAC_Action_EN_in, Gated_Sel_in	;

input	Gated_Trig_Sel, EXT_Trig_Sel	;
wire	Gated_Trig_Sel, EXT_Trig_Sel	;

input	Clock, Reset, Clock107	;
wire	Clock, Reset, Clock107	;

input	Pulse_CTRL, EN_INF, EN_MAN	;
wire	Pulse_CTRL, EN_INF, EN_MAN	;

input	[33:0]	Delay_Value	;
wire	[33:0]	Delay_Value	;



wire	Mux2to1_temp, BIESel_temp, GSIG_temp, BGS_temp	;
wire	BPE_Sout_in_Temp, GSIG_T	;

wire	CSOtoPin	;


BPMC_Mux2to1			BPMC_Mux2_1(.M_out(Mux2to1_temp), .Din_1(BIESel_temp), .Sel_in(CP_Sum_in), .Clock(Clock), .Reset(Reset))	;
Burst_Gated_Sel		BG_SEL(.Mux_out(BGS_temp), .Min1(Mux2to1_temp), .Min2(GSIG_temp), .Gate_Sel(Gated_Sel_in), .Clock(Clock), .Reset(Reset))	;

EGPN_Sel					EGPN_Sel_EXT(.Sout(BPE_Sout_in_Temp), .Sin(BPE_Sout_in), .PN_Sel(EXT_Trig_Sel), .Clock(Clock), .Reset(Reset))	;
Burst_IE_Sel			BIE_SEL(.IE_out(BIESel_temp), .Int_in(BPI_Sout_in), .Ext_in(BPE_Sout_in_Temp), .IE_Sel(IE_Sel_in), .Clock(Clock))	;


GatedPN_Sel				GPN_Sel_Gated(.Sout(GSIG_T), .Sin(BPE_Sout_in), .PN_Sel(Gated_Trig_Sel), .Clock(Clock))	;
Gated_SIG				BG_SIN(.GES_OUT(GSIG_temp), .GES_IN(GSIG_T), .BA_Carry_in(BAC_Action_EN_in), .Clock(Clock))	;

Infinite_merge_Manual		INFmMNL(.Ctrl_Sig_Out(CSOtoPin), .Trig_Sig_Out(Trig_Sout), .Normal_Sig_In(BGS_temp), .PSWR_IN(Pulse_CTRL), .End_Sig_In(CP_Sum_in), .DelayVin(Delay_Value), .EN_Manual(EN_MAN), .EN_Infinite(EN_INF), .CLK_Fast(Clock107), .CLK_Slow(Clock107))	;

Pulse_wave				BPW_Gen(.Pulse_out(Pulse_Reset), .EN_out(Pulse_EN), .Reset_BAC(BAC_Reset_out), .Pin(CSOtoPin), .Clock(Clock107))	;

endmodule
