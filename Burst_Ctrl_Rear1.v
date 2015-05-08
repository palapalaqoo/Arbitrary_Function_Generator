`timescale	1ns/1ps

module	Burst_Ctrl_Rear1(Comp_Sum, BPIT_Sout, BPE_Sout, INT_Trig_out, BAC_Action_EN, Amount_IN, BPI_Value_In, BPE_Sin, 
									Delay_ValueIN, INT_Trig_Sel, Burst_EN, BAC_Reset, IM_Trig_Sin, EN_Manual, Clock, Clock107, Reset)	;

output	Comp_Sum, BPIT_Sout, BPE_Sout, INT_Trig_out	;
wire	Comp_Sum, BPIT_Sout, BPE_Sout, INT_Trig_out	;

input	BAC_Action_EN, Burst_EN	;
wire	BAC_Action_EN, Burst_EN	;

input	[1:0]	INT_Trig_Sel	;
wire	[1:0]	INT_Trig_Sel	;

input	[47:0]	BPI_Value_In	;
wire	[47:0]	BPI_Value_In	;

input	[19:0]	Amount_IN	;
wire	[19:0]	Amount_IN	;

input	[33:0]	Delay_ValueIN	;
wire	[33:0]	Delay_ValueIN	;

input	BPE_Sin	;
wire	BPE_Sin	;

input	Clock, Reset, Clock107	;
wire	Clock, Reset, Clock107	;

input	BAC_Reset	;
wire	BAC_Reset	;

input	IM_Trig_Sin, EN_Manual	;
wire	IM_Trig_Sin, EN_Manual	;


wire	[19:0]	BAC_Sout_Temp, Amount_In_Temp	;
wire	BAC_Action_ENT	;

wire	BPI_Sout2, BPI_LPSout	;


INC_Amount						INCAmount(.Dout(BAC_Action_ENT), .Din(BAC_Action_EN), .Clock(Clock), .Reset(Reset))	;
Burst_Amount_Count20Bits	BAC20Bits(.SUM_OUT(BAC_Sout_Temp), .EN(BAC_Action_ENT), .Clock(Clock107), .Reset(BAC_Reset))	;
Amount_Reg20bits				Amount_Value20bits(.Dout(Amount_In_Temp), .Din(Amount_IN), .Clock(Clock))	;
Comparator						Comparator_20bits(.Comp_out(Comp_Sum), .Comp_A(BAC_Sout_Temp), .Comp_B(Amount_In_Temp), .Clock(Clock107), .Reset(Reset))	;
Burst_Period_EXT				BP_EXT(.Dout(BPE_Sout), .Din(BPE_Sin), .Clock(Clock))	;
Burst_Period					BP_INT(.Period_Ctrl(BPI_Sout), /*PCO,*/ .Period_in(BPI_Value_In), .Burst_EN(Burst_EN), .Clock(Clock), .Reset(Reset)) ;

Normal_Trigger_Mode			Normal_Delay(.Trig_Ctrl_Sout(BPIT_Sout), .PSWR_IN(BPI_Sout), .Ending_Sin(Comp_Sum), .Delay_Vin(Delay_ValueIN), .Normal_EN(Burst_EN), .Clock_Fast(Clock107), .Clock_Slow(Clock107))	;
Normal_TrigOut_LPath			Normal_TLPath(.Dout(BPI_LPSout), .Din(BPI_Sout), .Clock(Clock107))	;
BTrigout_Sel					BPTR_SEL(.Dout(BPI_Sout2), .Din1(BPI_LPSout), .Din2(IM_Trig_Sin), .Sel(EN_Manual))	;
OPN_Sel							BP_INT_OPN(.Sout_EXT(INT_Trig_out), .Sin(BPI_Sout2), .Sel_H(INT_Trig_Sel[1]), .Sel_L(INT_Trig_Sel[0]), .Clock(Clock))	;

endmodule
