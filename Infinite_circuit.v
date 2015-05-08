`timescale	1ns/1ps

module	Infinite_circuit(Dout, PSWR_IN, Delay_Vin, EN, Clock_Fast, Clock_Slow)	;

output	Dout	;
wire	Dout	;

input	PSWR_IN	;
wire	PSWR_IN	;

input	[33:0]	Delay_Vin	;
wire	[33:0]	Delay_Vin	;

input	EN	;
wire	EN	;

input	Clock_Fast, Clock_Slow	;
wire	Clock_Fast, Clock_Slow	;


wire	PSWR_Sout	;
wire	Trig_BSig	;
wire	Judge_Sel	;
wire	Trigout00, Trigout01, Trigout02	;
wire	Delay_Sout	;

PSWR_Path								INFIN_Path(.Dout(PSWR_Sout), .Din(PSWR_IN), .Clock(Clock_Fast))	;
Infinite_Mode_Mux						INFIN_MUX_Front(.Dout(Trig_BSig), .Din1(PSWR_Sout), .Din2(Delay_Sout), .Sel(Judge_Sel))	;


Maunal_Trigger							INFIN_MTrigA(.Trig_Dout(Trigout00), .Trig_Ain(PSWR_Sout), .Trig_Bin(Trig_BSig), .MNTrig_EN(EN), .Clock(Clock_Fast))	;
Manual_Trigger_Single_Front		INFIN_MTrigF(.STrig_out(Judge_Sel), .STrig_in(PSWR_IN), .Clock(Clock_Fast), .EN(EN))	;


Infinite_Mode_Mux						INFIN_MUX_Medium(.Dout(Trigout01), .Din1(1'b0), .Din2(Trigout00), .Sel(Judge_Sel))	;
Counter34B								INFIN_Delay(.Dout(Delay_Sout), .Din(Delay_Vin), .Clock(Clock_Slow), .EN(Trigout01))	;


Infinite_Mode_Mux						INFIN_MUX_Rear(.Dout(Trigout02), .Din1(Trigout00), .Din2(Delay_Sout), .Sel(Judge_Sel))	;
Manual_Trigger_Single_Rear			INFIN_MTrigR(.STrig_out(Dout), .STrig_in(Trigout02), .Clock(Clock_Fast), .EN(EN))	;


endmodule
