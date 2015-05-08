`timescale	1ns/1ps

module	FSK_MUX_Sel(Dout, Din_1, Din_2, Sel)	;

output	[47:0]	Dout	;
wire	[47:0]	Dout	;

input	[47:0]	Din_1, Din_2	;
wire	[47:0]	Din_1, Din_2	;

input	Sel	;
wire	Sel	;

assign	Dout = Sel ? Din_2 : Din_1	;

endmodule
