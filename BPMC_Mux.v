`timescale	1ns/1ps

module	BPMC_Mux(Mout, Min_1, Min_2, Sel_in)	;

output	Mout	;
wire	Mout	;

input	Min_1, Min_2	;
wire	Min_1, Min_2	; 

input	Sel_in	;
wire	Sel_in	;

assign	Mout = ( Sel_in ) ? Min_1 : Min_2	;

endmodule
