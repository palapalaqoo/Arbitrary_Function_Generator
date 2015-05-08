`timescale	1ns/1ps

module	DCM_IRest(CLKDV_O, CLKFX_O, CLKFXD180_O, CLKIBUFG_O, CLKD0_O, CLK2X_O, CLK2XD180_O,
							CLKD90_O, CLKD180_O, CLKD270_O, LOCKED_O, PSCLK0_OUT, PSCLK90_OUT, PSCLK180_OUT, PSCLK270_OUT, STATUS_O, Clock)	;

output	CLKDV_O, CLKFX_O, CLKFXD180_O, CLKIBUFG_O, CLKD0_O, CLK2X_O, CLK2XD180_O,
			CLKD90_O, CLKD180_O, CLKD270_O, LOCKED_O	;
wire	CLKDV_O, CLKFX_O, CLKFXD180_O, CLKIBUFG_O, CLKD0_O, CLK2X_O, CLK2XD180_O,
			CLKD90_O, CLKD180_O, CLKD270_O, LOCKED_O	;
			
output	PSCLK0_OUT, PSCLK90_OUT, PSCLK180_OUT, PSCLK270_OUT	;
wire	PSCLK0_OUT, PSCLK90_OUT, PSCLK180_OUT, PSCLK270_OUT	;
			
output	[7:0]	STATUS_O	;
wire	[7:0]	STATUS_O	;

input	Clock	;
wire	Clock	;


//wire	NReset	;
//assign	NReset = ~Reset	;



//IRST_Reg				INT_RST(.Dout(IReset), .Din(LOCKED_O), .Clock(CLKFX_O), .Reset(Reset))	;
DCM_214MHz			DCM214MHz(.CLKIN_IN(Clock), .RST_IN(1'b0), .CLKDV_OUT(CLKDV_O), .CLKFX_OUT(CLKFX_O), .CLKFX180_OUT(CLKFXD180_O), .CLKIN_IBUFG_OUT(CLKIBUFG_O), 
										.CLK0_OUT(CLKD0_O), .CLK2X_OUT(CLK2X_O), .CLK2X180_OUT(CLK2XD180_O), .CLK90_OUT(CLKD90_O), .CLK180_OUT(CLKD180_O), .CLK270_OUT(CLKD270_O), 
										.LOCKED_OUT(LOCKED_O), .STATUS_OUT(STATUS_O));
Phase_Shift			DCM214MHz_SP(.CLKIN_IN(CLKFX_O), .RST_IN(1'b0), .CLK0_OUT(PSCLK0_OUT), .CLK90_OUT(PSCLK90_OUT), .CLK180_OUT(PSCLK180_OUT), .CLK270_OUT(PSCLK270_OUT));


endmodule
