`timescale	1ns/1ps

module	DDFS48bits(ROM_IN, PCO, Phase_in, Clock, Reset)	;

output	[13:0]	ROM_IN	;
wire	[13:0]	ROM_IN	;

output	PCO	;
wire	PCO	;

input	[47:0]	Phase_in	;
wire	[47:0]	Phase_in	;

input	Clock, Reset	;
wire	Clock, Reset	;


ACC48bits	ACC48Bits(.Sum_out(ROM_IN), .Carry_OUT(PCO), .Ain(Phase_in), .Clock(Clock), .Reset(Reset))	;


endmodule
