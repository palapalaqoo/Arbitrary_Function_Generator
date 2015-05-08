`timescale	1ns/1ps

module	Pulse_wave(Pulse_out, EN_out, Reset_BAC, Pin, Clock)	;

output	Pulse_out, EN_out, Reset_BAC	;
wire	Pulse_out, EN_out, Reset_BAC	;

input	Pin	;
wire	Pin	;

input	Clock	;
wire	Clock	;

wire	Pin_Not1, Pin_Not2, Pin_OR, Pin_Buf, Pin_Buf01, Pin_Buf02	;
wire	Pin_Buf03, Pulse_out_t, EN_out_t	;

assign	Pin_Not1 = (~Pin_Buf) & Pin	;
assign	Pin_Not2 = (~Pin) & Pin_Buf	;
assign	Pin_OR = Pin_Not1 | Pin_Not2	;

assign	Pin_Buf02 = Pin_Buf01 & EN_out	;
assign	Pin_Buf03 = Pin_Buf01 & Pin_Buf	;

Pulse_Reg	PR00(.Dout(Pin_Buf), .Din(Pin), .Clock(Clock))	;
Pulse_Reg	PR01(.Dout(Pin_Buf01), .Din(Pin_OR), .Clock(Clock))	;

Pulse_Reg	PR02(.Dout(Pulse_out_t), .Din(~Pin_Buf02), .Clock(Clock))	;
Pulse_Reg	PR03(.Dout(Pulse_out), .Din(Pulse_out_t), .Clock(Clock))	;

Pulse_Reg	PR04(.Dout(EN_out_t), .Din(Pin_Buf), .Clock(Clock))	;
Pulse_Reg	PR05(.Dout(EN_out), .Din(EN_out_t), .Clock(Clock))	;

Pulse_Reg	PR06(.Dout(Reset_BAC), .Din(~Pin_Buf03), .Clock(Clock))	;

endmodule
