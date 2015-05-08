`timescale	1ns/1ps

module	Manual_Trigger_Mode(Trig_Ctrl_Sout, Trig_out, PSWR_IN, Ending_Sin, Delay_Vin, Manual_EN, Clock_Fast, Clock_Slow)	;

output	Trig_Ctrl_Sout	;
wire	Trig_Ctrl_Sout	;

output	Trig_out	;
reg	Trig_out	;

input	PSWR_IN, Ending_Sin	;
wire	PSWR_IN, Ending_Sin	;

input	[33:0]	Delay_Vin	;
wire	[33:0]	Delay_Vin	;

input	Manual_EN	;
wire	Manual_EN	;

input	Clock_Fast, Clock_Slow	;
wire	Clock_Fast, Clock_Slow	;


wire	Delay_Sout	;
wire	Trigout_wire00	;
reg	INA, INB	;

wire	Ending_Sin00	;

assign	Ending_Sin00 = Trig_Ctrl_Sout ? Ending_Sin : 1'b0	;


Maunal_Trigger				Trigger_FR(.Trig_Dout(Trigout_wire00), .Trig_Ain(INA), .Trig_Bin(Delay_Sout), .MNTrig_EN(Manual_EN), .Clock(Clock_Fast))	;
Counter34B					Trig_Delay(.Dout(Delay_Sout), .Din(Delay_Vin), .Clock(Clock_Slow), .EN(Trigout_wire00))	;
Maunal_Trigger_Rear		Trigger_R(.Trig_Dout(Trig_Ctrl_Sout), .Trig_Ain(Delay_Sout), .Trig_Bin(INB), .MNTrig_EN(Manual_EN), .Clock(Clock_Fast))	;


always	@(posedge	Clock_Fast)
	begin
		Trig_out <= PSWR_IN	;
		INA <= PSWR_IN	;
		INB <= Ending_Sin00	;
	end



endmodule
