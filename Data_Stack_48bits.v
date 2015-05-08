`timescale	1ns/1ps

module	Data_Stack_48bits(DataOut_48B, DataOut_20B, DataOut_16B, Data_in, EN_P1, EN_P2, EN_P3, EN_P4, Clock, Reset)	;

output	[47:0]	DataOut_48B	;
wire	[47:0]	DataOut_48B	;

output	[19:0]	DataOut_20B	;
wire	[19:0]	DataOut_20B	;

output	[15:0]	DataOut_16B	;
wire	[15:0]	DataOut_16B	;

input	[15:0]	Data_in	;
wire	[15:0]	Data_in	;	

input	EN_P1, EN_P2, EN_P3, EN_P4	;
wire	EN_P1, EN_P2, EN_P3, EN_P4	;

input	Clock, Reset	;
wire	Clock, Reset	;

reg	EN1, EN2, EN3, EN4	;
wire	[15:0]	Temp16B, Temp32B, Temp48B	;


wire	[19:0]	DS20B	;

	
always	@(posedge	Clock)
	begin
		EN1 <= EN_P1	;
		EN2 <= EN_P2	;
		EN3 <= EN_P3	;
		EN4 <= EN_P4	;
	end
	
FDCE_latch_16bits	DSTemp1(.Dout(Temp16B), .Din(Data_in), .EN(EN1), .Clock(Clock), .Reset(Reset))	;
FDCE_latch_16bits	DSTemp2(.Dout(Temp32B), .Din(Data_in), .EN(EN2), .Clock(Clock), .Reset(Reset))	;
FDCE_latch_16bits	DSTemp3(.Dout(Temp48B), .Din(Data_in), .EN(EN3), .Clock(Clock), .Reset(Reset))	;		
FDCE_latch_48bits	DSTemp4(.Dout(DataOut_48B), .Din({Temp48B, Temp32B, Temp16B}), .EN(EN4), .Clock(Clock), .Reset(Reset))	;

//assign	DS14B = Temp16B[13:0]	;
assign	DS20B = {Temp32B[3:0], Temp16B}	;

TReg16Bits		DSR16B(.Dout(DataOut_16B), .Din(Temp16B), .Clock(Clock))	;
TReg20Bits		DSR20B(.Dout(DataOut_20B), .Din(DS20B), .Clock(Clock))	;



endmodule	
				
				