`timescale	1ns/1ps

module	Burst_Period(Period_Ctrl, PCO, Period_in, Burst_EN, Clock, Reset) ;
							

output	Period_Ctrl	;
wire	Period_Ctrl	;

output	PCO	;
wire	PCO	;

input	[47:0]	Period_in	;
wire	[47:0]	Period_in	;

input	Burst_EN	;
wire	Burst_EN	;

input	Clock, Reset	;
wire	Clock, Reset	;
		

reg	[47:0]	Period_value	;
wire	[11:0]	Addr_BUF, Addr_BUFO	;
wire	Period_Ctrl_temp	;


always	@(posedge	Clock)
	begin
		Period_value <= Period_in	;
	end

Period_ACC48bits				Period_ACC48bits(.SUM(Addr_BUF), .Period_Carry_OUT(PCO), .Ain(Period_value), .EN(Burst_EN), .Clock(Clock), .Reset(Reset))	;
Reg_12bits						Period_Reg12bits(.Dout(Addr_BUFO), .Din(Addr_BUF), .Clock(Clock), .Reset(Reset))	;
Burst_Period_ROMTable		BPRT(.Ctrl_Value(Period_Ctrl_temp), .Rate_in(Addr_BUFO), .Clock(Clock))	;
Burst_Period_Reg1B			BPReg1B(.Dout(Period_Ctrl), .Din(Period_Ctrl_temp), .Clock(Clock))	;

endmodule
