`timescale	1ns/1ps

module	Comparator(Comp_out, Comp_A, Comp_B, Clock, Reset)	;

output	Comp_out	;
wire	Comp_out	;

input	[19:0]	Comp_A, Comp_B	;
wire	[19:0]	Comp_A, Comp_B	;

input	Clock, Reset	;
wire	Clock, Reset	;

wire	[19:0]	temp_A, temp_B	;
wire	comp_out_net	;


Comp_Reg20bits		Reg20b_A(.Dout(temp_A), .Din(Comp_A), .Clock(Clock), .Reset(Reset))	;
Comp_Reg20bits		Reg20b_B(.Dout(temp_B), .Din(Comp_B), .Clock(Clock), .Reset(Reset))	;
compare				comp_20b(.comp_out(comp_out_net), .comp_a(temp_A), .comp_b(temp_B))	;
Comp_Reg1bits		Reg1b_comp(.Dout(Comp_out), .Din(comp_out_net), .Clock(Clock))	;

endmodule
