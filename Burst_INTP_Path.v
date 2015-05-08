`timescale	1ns/1ps

module	Burst_INTP_Path(Dout, Din, Clock)	;

output	[47:0]	Dout	;
wire	[47:0]	Dout	;

input	[47:0]	Din	;
wire	[47:0]	Din	;

input	Clock	;
wire	Clock	;


wire	[47:0]	Burst_INT_VUT00	;

Data_Reg48B						Burst_INTP_VT00(.Dout(Burst_INT_VUT00), .Din(Din), .Clock(Clock))	;
Data_Reg48B						Burst_INTP_VT01(.Dout(Dout), .Din(Burst_INT_VUT00), .Clock(Clock))	;

endmodule	
