`timescale	1ns/1ps

module	Infinite_merge_Manual(Ctrl_Sig_Out, Trig_Sig_Out, Normal_Sig_In, PSWR_IN, End_Sig_In, DelayVin, EN_Manual, EN_Infinite, CLK_Fast, CLK_Slow)	;

output	Ctrl_Sig_Out, Trig_Sig_Out	;
wire	Ctrl_Sig_Out, Trig_Sig_Out	;

input	PSWR_IN, End_Sig_In, Normal_Sig_In	;
wire	PSWR_IN, End_Sig_In, Normal_Sig_In	;

input	[33:0]	DelayVin	;
wire	[33:0]	DelayVin	;

input	EN_Manual, EN_Infinite	;
wire	EN_Manual, EN_Infinite	;

input	CLK_Fast, CLK_Slow	;
wire	CLK_Fast, CLK_Slow	;



wire	M_CtrlSout, I_CtrlSout, M_TrigSout, I_TrigSout	;
wire	CSwire00	;
wire	IM_TrigWire	;


Manual_Trigger_Mode		MT_Mode(.Trig_Ctrl_Sout(M_CtrlSout), .Trig_out(M_TrigSout), .PSWR_IN(PSWR_IN), .Ending_Sin(End_Sig_In), .Delay_Vin(DelayVin), .Manual_EN(EN_Manual), .Clock_Fast(CLK_Fast), .Clock_Slow(CLK_Slow))	;
Infinite_Integrate		IF_Mode(.Ctrl_Sout(I_CtrlSout), .Trig_Sout(I_TrigSout), .DelayVin(DelayVin), .PSWRIN(PSWR_IN), .EN_IN(EN_Infinite), .CLK214MHz(CLK_Fast), .CLK107MHz(CLK_Slow))	;


IFandML_MUX			IF_Mux00(.Dout(CSwire00), .Din1(Normal_Sig_In), .Din2(M_CtrlSout), .Sel(EN_Manual))	;
IFandML_MUX			IF_Mux01(.Dout(Ctrl_Sig_Out), .Din1(CSwire00), .Din2(I_CtrlSout), .Sel(EN_Infinite))	;

IFandML_MUX			ML_Mux00(.Dout(IM_TrigWire), .Din1(M_TrigSout), .Din2(I_TrigSout), .Sel(EN_Infinite))	;

INFMNL_TrigOut_LPath			IM_TO_LPath(.Dout(Trig_Sig_Out), .Din(IM_TrigWire), .Sel(EN_Infinite), .Clock(CLK_Slow))	;


endmodule

