`timescale	1ns/1ps

module	IFandML_MUX(Dout, Din1, Din2, Sel)	;

output	Dout	;
wire	Dout	;

input	Din1, Din2	;
wire	Din1, Din2	;

input	Sel	;
wire	Sel	;


assign	Dout = Sel ? Din2 : Din1	;

endmodule
