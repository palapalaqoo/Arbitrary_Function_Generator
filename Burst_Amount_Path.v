`timescale	1ns/1ps

module	Burst_Amount_Path(Dout, Din, Clock)	;

output	[19:0]	Dout	;
wire	[19:0]	Dout	;

input	[19:0]	Din	;
wire	[19:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[19:0]	Burst_Count_VUT00	;


Data_Reg20B						Burst_Amount_VT00(.Dout(Burst_Count_VUT00), .Din(Din), .Clock(Clock))	;
Data_Reg20B						Burst_Amount_VT01(.Dout(Dout), .Din(Burst_Count_VUT00), .Clock(Clock))	;


endmodule
