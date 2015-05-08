`timescale	1ns/1ps

module	Normal_Trigger_Mode(Trig_Ctrl_Sout, PSWR_IN, Ending_Sin, Delay_Vin, Normal_EN, Clock_Fast, Clock_Slow)	;

output	Trig_Ctrl_Sout	;
wire	Trig_Ctrl_Sout	;

input	PSWR_IN, Ending_Sin	;
wire	PSWR_IN, Ending_Sin	;

input	[33:0]	Delay_Vin	;
wire	[33:0]	Delay_Vin	;

input	Normal_EN	;
wire	Normal_EN	;

input	Clock_Fast, Clock_Slow	;
wire	Clock_Fast, Clock_Slow	;


wire	Delay_Sout	;
wire	Trigout_wire00	;

wire	Sum_wire		;
wire	Ending_Sin00	;

assign	Ending_Sin00 = Trig_Ctrl_Sout ? Ending_Sin : 1'b0	;


assign	Sum_wire	= Delay_Sout | Ending_Sin00	;

Normal_Trigger				NTrigger_FR(.Trig_Dout(Trigout_wire00), .Trig_Ain(PSWR_IN), .Trig_Bin(Delay_Sout), .NTrig_EN(Normal_EN), .Clock(Clock_Fast))	;
Counter34B					NTrig_Delay(.Dout(Delay_Sout), .Din(Delay_Vin), .Clock(Clock_Slow), .EN(Trigout_wire00))	;
Normal_Trigger_Rear		NTrigger_R(.Trig_Dout(Trig_Ctrl_Sout), .Trig_Ain(Sum_wire), .NTrig_EN(Normal_EN), .Clock(Clock_Fast))	;

//Normal_Trigger_Rear		Trigger_R(.Trig_Dout(Trig_Ctrl_Sout), .Trig_Ain(Delay_Sout), .Trig_Bin(Ending_Sin), .NTrig_EN(Normal_EN), .Clock(Clock_Fast))	;


endmodule
