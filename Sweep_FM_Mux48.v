`timescale	1ns/1ps

module	Sweep_FM_Mux48(Dout, Din1, Din2, Sel, Clock)	;

output	[47:0]	Dout	;
wire	[47:0]	Dout	;

input	[47:0]	Din1, Din2	;
wire	[47:0]	Din1, Din2	;

input	Clock	;
wire	Clock	;

input	Sel	;
wire	Sel	;


wire	[47:0]	DTemp	;
assign	DTemp = Sel ? Din2 : Din1	;

FM_Sweep_Reg48B	FM_SW_Reg48B00(.Dout(Dout), .Din(DTemp), .Clock(Clock))	;

endmodule
