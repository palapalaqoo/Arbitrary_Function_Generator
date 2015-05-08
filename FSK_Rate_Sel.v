`timescale	1ns/1ps

module	FSK_Rate_Sel(Mout, Min_1, Min_2, SW_Sel, Clock)	;

output	[47:0]	Mout	;
wire	[47:0]	Mout	;

input	[47:0]	Min_1, Min_2	;
wire	[47:0]	Min_1, Min_2	;

input	SW_Sel	;
wire	SW_Sel	;

input	Clock	;
wire	Clock	;


wire	[47:0]	MtoR	;

FSK_MUX_Sel			FSK_MuxS(.Dout(MtoR), .Din_1(Min_1), .Din_2(Min_2), .Sel(SW_Sel))	;
FSK_Mux_Reg48B		FSK_MuxR(.Dout(Mout), .Din(MtoR), .Clock(Clock))	;

endmodule
