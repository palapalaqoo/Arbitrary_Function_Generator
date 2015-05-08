`timescale	1ns/1ps

module	Infinite_Integrate(Ctrl_Sout, Trig_Sout, DelayVin, PSWRIN, EN_IN, CLK214MHz, CLK107MHz)	;

output	Ctrl_Sout, Trig_Sout	;
wire	Ctrl_Sout, Trig_Sout	;

input	[33:0]	DelayVin	;
wire	[33:0]	DelayVin	;

input	PSWRIN	;
wire	PSWRIN	;

input	EN_IN	;
wire	EN_IN	;

input	CLK214MHz, CLK107MHz	;
wire	CLK214MHz, CLK107MHz	;


//DCM214MHz					DCM_PLL(.CLKIN_IN(Clock), .RST_IN(1'b0), .CLKFX_OUT(CLK214MHz), .CLK2X_OUT(CLK107MHz));
Infinite_Trigout			INF_Trig_Mode(.TDout(Trig_Sout), .PSWR_IN(PSWRIN), .EN(EN_IN), .Clock(CLK214MHz))	;
Infinite_circuit			INF_Ctrl_Mode(.Dout(Ctrl_Sout), .PSWR_IN(PSWRIN), .Delay_Vin(DelayVin), .EN(EN_IN), .Clock_Fast(CLK214MHz), .Clock_Slow(CLK107MHz))	;


endmodule

