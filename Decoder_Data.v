`timescale	1ns/1ps

module	Decoder_Data(Code_out, Code_in, Clock)	;

output	[16:0]	Code_out	;
reg	[16:0]	Code_out	;

input	[25:0]	Code_in	;
wire	[25:0]	Code_in	;

input	Clock	;
wire	Clock	;


always	@(posedge	Clock)
	begin
		case(Code_in)
		// A25A24.......................A3A2A1A0....................(A0 not used).....................
			26'b10_0000_0000_0000_0000_1000_0000 : Code_out <= 17'b0_0000_0000_0000_0001	;		//K1, EN_1 enable...............(16bits stack to 48bits)
			26'b10_0000_0000_0000_0000_1000_0010 : Code_out <= 17'b0_0000_0000_0000_0010	;		//K1, EN_2 enable...............(16bits stack to 48bits)
			26'b10_0000_0000_0000_0000_1000_0100 : Code_out <= 17'b0_0000_0000_0000_0100	;		//K1, EN_3 enable...............(16bits stack to 48bits)
			26'b10_0000_0000_0000_0000_1000_0110 : Code_out <= 17'b0_0000_0000_0000_1000	;		//K1, EN_4 enable...............(16bits stack to 48bits)
			26'b10_0000_0000_0000_0000_1000_1000 : Code_out <= 17'b0_0000_0000_0001_0000	;		//K1, DEN_K1 Enable..............(48bits pass to Register of K1)
			
			26'b10_0000_0000_0000_0000_1000_1010 : Code_out <= 17'b0_0000_0000_0010_0000	;		//K2, DEN_K2 Enable..............(48bits pass to Register of K1)
			
			26'b10_0000_0000_0000_0000_1000_1100 : Code_out <= 17'b0_0000_0000_0100_0000	;		//FSK_Internal_Period, DEN_FSK_Value Enable..............(42bits)
			
			26'b10_0000_0000_0000_0000_1000_1110 : Code_out <= 17'b0_0000_0000_1000_0000	;		//Burst_Internal_Period, DEN_Burst_Value Enable..............(48bits)
			26'b10_0000_0000_0000_0000_1001_0000 : Code_out <= 17'b0_0000_0001_0000_0000	;		//Burst_Amount_Value, DEN_Burst_Amount_Value enable................(16bits)			
			26'b10_0000_0000_0000_0000_1001_0010 : Code_out <= 17'b0_0000_0010_0000_0000	;		//Burst_Increment_Value, DEN_Burst_Increment_Value Enable..............(48bits pass to Register of K1)
			
			26'b10_0000_0000_0000_0000_1001_0100 : Code_out <= 17'b0_0000_0100_0000_0000	;		//FM_Deviation_Value, Enable..............(48bits)
			26'b10_0000_0000_0000_0000_1001_0110 : Code_out <= 17'b0_0000_1000_0000_0000	;		//FM_Frequency_Value, Enable..............(48bits)
			26'b10_0000_0000_0000_0000_1001_1000 : Code_out <= 17'b0_0001_0000_0000_0000	;		//Sweep_StaEnd_Freq,  Enable..............(48bits)
			26'b10_0000_0000_0000_0000_1001_1010 : Code_out <= 17'b0_0010_0000_0000_0000	;		//Sweep_Start_Freq, Enable..............(48bits)
			26'b10_0000_0000_0000_0000_1001_1100 : Code_out <= 17'b0_0100_0000_0000_0000	;		//Sweep_SweepTime, Enable..............(48bits)
			26'b10_0000_0000_0000_0000_1001_1110 : Code_out <= 17'b0_1000_0000_0000_0000	;		//Sweep marker enable
			26'b10_0000_0000_0000_0000_1010_0000 : Code_out <= 17'b1_0000_0000_0000_0000	;		//Burst Delay value enable



			default : Code_out <= 17'b0_0000_0000_0000_0000	;
		endcase
	end
	
endmodule


