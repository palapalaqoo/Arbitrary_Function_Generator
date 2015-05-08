`timescale	1ns/1ps

module	compare(comp_out, comp_a, comp_b)	;

output	comp_out	;
wire	comp_out	;

input	[19:0]	comp_a, comp_b	;
wire	[19:0]	comp_a, comp_b	;


assign	comp_out = (comp_a < comp_b) ? 1'b1 : 1'b0	;

endmodule


