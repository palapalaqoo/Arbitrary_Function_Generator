`timescale	1ns/1ps

module	Gated_SIG(GES_OUT, GES_IN, BA_Carry_in, Clock)	;

output	GES_OUT	;
wire	GES_OUT	;

input	GES_IN	;
wire	GES_IN	;

input	BA_Carry_in	;
wire	BA_Carry_in	;

input	Clock	;
wire	Clock	;

wire	IReset	;
wire	GES_temp	;

assign	GES_temp = GES_IN | GES_OUT	;


Gated_Reg1bit			Gated_Reg1(.Dout(GES_OUT), .Din(GES_temp), .Clock(Clock), .Reset(IReset))	;
Gated_ENReg1bit		Gated_ENReg1(.Dout(IReset), .Din(~GES_IN), .EN(BA_Carry_in), .Clock(Clock))	;

endmodule

