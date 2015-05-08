`timescale	1ns/1ps

module	Burst_Ctrl_Integrate(EN_Ctrl, Reset_Ctrl, INT_TR_out, Amount_Value_in, Internal_Period_Value, BurstEN, EN_BAC_in,
										INT_TR_Sel, Gated_TR_Sel, EXT_TR_Sel, External_Signal, Gated_Sel, Period_Sel, DelayValues, 
										ManualEN, InfiniteEN, Ctrl_Pulse, Clock, Reset, Clock107M)	;

output	EN_Ctrl, Reset_Ctrl, INT_TR_out	;
wire	EN_Ctrl, Reset_Ctrl, INT_TR_out	;

input	[19:0]	Amount_Value_in	;
wire	[19:0]	Amount_Value_in	;

input	[47:0]	Internal_Period_Value	;
wire	[47:0]	Internal_Period_Value	;

input BurstEN, Gated_Sel, Period_Sel, External_Signal, Gated_TR_Sel, EXT_TR_Sel	;
wire	BurstEN, Gated_Sel, Period_Sel, External_Signal, Gated_TR_Sel, EXT_TR_Sel	;

input	[1:0]	INT_TR_Sel	;
wire	[1:0]	INT_TR_Sel	;

input	EN_BAC_in	;
wire	EN_BAC_in	;

input	Clock, Reset, Clock107M	;
wire	Clock, Reset, Clock107M	;

input	[33:0]	DelayValues	;
wire	[33:0]	DelayValues	;

input	ManualEN, InfiniteEN, Ctrl_Pulse	;
wire	ManualEN, InfiniteEN, Ctrl_Pulse	;



wire	Comp_Stemp, BPE_Stemp, BPI_Stemp	;
wire	BAC_Reset_temp	;

wire	IM_Trigout	;

Burst_Ctrl_Rear1		BC_Rear1(.Comp_Sum(Comp_Stemp), .BPIT_Sout(BPI_Stemp), .BPE_Sout(BPE_Stemp), .BAC_Action_EN(EN_BAC_in), .Amount_IN(Amount_Value_in), .BPI_Value_In(Internal_Period_Value),
										.INT_Trig_out(INT_TR_out), .INT_Trig_Sel(INT_TR_Sel), .BPE_Sin(External_Signal), .Burst_EN(BurstEN), .BAC_Reset(BAC_Reset_temp), .IM_Trig_Sin(IM_Trigout), 
										.Delay_ValueIN(DelayValues), .EN_Manual(ManualEN), .Clock(Clock), .Reset(Reset), .Clock107(Clock107M))	;

Burst_Ctrl_Rear2		BC_Rear2(.Pulse_Reset(Reset_Ctrl), .Pulse_EN(EN_Ctrl), .BAC_Reset_out(BAC_Reset_temp), .CP_Sum_in(Comp_Stemp), .BPI_Sout_in(BPI_Stemp), .BPE_Sout_in(BPE_Stemp),
										.Gated_Trig_Sel(Gated_TR_Sel), .EXT_Trig_Sel(EXT_TR_Sel), .IE_Sel_in(Period_Sel), .Gated_Sel_in(Gated_Sel), .BAC_Action_EN_in(EN_BAC_in), 
										.Trig_Sout(IM_Trigout), .Pulse_CTRL(Ctrl_Pulse), .EN_INF(InfiniteEN), .EN_MAN(ManualEN), .Delay_Value(DelayValues),
										.Clock(Clock), .Reset(Reset), .Clock107(Clock107M))	;
									

endmodule
