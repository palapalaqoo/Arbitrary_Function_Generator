`timescale	1ns/1ps

module	Infinite_Trigout(TDout, PSWR_IN, EN, Clock)	;

output	TDout	;
wire	TDout	;

input	PSWR_IN	;
wire	PSWR_IN	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


wire	Trigout_Sel	;


Infinite_Trigout_Mux						INF_Mux(.Dout(TDout), .Din1(PSWR_IN), .Din2(1'b0), .Sel(Trigout_Sel), .EN(EN), .Clock(Clock))	;
Infinite_Trigout_Single_Rear			INF_MTSR(.STrig_out(Trigout_Sel), .STrig_in(PSWR_IN), .Clock(Clock), .EN(EN))	;


endmodule
