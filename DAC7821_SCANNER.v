`timescale	1ns/1ps

module	DAC7821_SCANNER(Data_out, R_Wbar, CSbar, EN_CTRL, DC_OFFSET_Vin, DUTY_S_Vin, GAIN_V_Vin, 
									HC4051_State_Sel, SQ_VL_Vin, SQ_VT_Vin, Spare_Vin, Clock, Reset)	;
									
output	[11:0]	Data_out	;
reg	[11:0]	Data_out	;

output	R_Wbar, CSbar	;
reg	R_Wbar, CSbar	;

output	[3:0]	HC4051_State_Sel	;
reg	[3:0]	HC4051_State_Sel	;

output	EN_CTRL	;
reg	EN_CTRL	;



input	[11:0]	DC_OFFSET_Vin, DUTY_S_Vin, GAIN_V_Vin, SQ_VL_Vin, SQ_VT_Vin, Spare_Vin	;
wire	[11:0]	DC_OFFSET_Vin, DUTY_S_Vin, GAIN_V_Vin, SQ_VL_Vin, SQ_VT_Vin, Spare_Vin	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	[14:0]	Scan_Judge	;

Counter8Bits			Count_Loop(.Dout(Scan_Judge), .Clock(Clock), .Reset(Reset))	;

always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Data_out <= 12'b0000_0000_0000	;
				R_Wbar <= 1'b0	;
				CSbar <= 1'b0	;
				HC4051_State_Sel <= 4'b1000	;
				EN_CTRL <= 1'b0	;
			end
		else if ( Reset == 1'b1 )
			begin
				if ( Scan_Judge == 15'b000_0000_0000_0000 )		//Scanner Judge == 0		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b0	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0111	;
						EN_CTRL <= 1'b1	;
					end
				else if ( Scan_Judge == 15'b000_0000_0000_0001 )		//Scanner Judge == 1		...............
					begin
						Data_out <= DC_OFFSET_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b0	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b000_0000_0000_0101 )		//Scanner Judge == 5		...............
					begin
						Data_out <= DC_OFFSET_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b1	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b000_0000_0000_0110 )		//Scanner Judge == 6		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b1	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0000	;
						EN_CTRL <= 1'b0	;
					end
				else if ( Scan_Judge == 15'b001_0101_0101_0000 )		//Scanner Judge == 5456		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b0	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0111	;
						EN_CTRL <= 1'b1	;
					end
				else if ( Scan_Judge == 15'b001_0101_0101_0001 )		//Scanner Judge == 5457		...............
					begin
						Data_out <= DUTY_S_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b0	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b001_0101_0101_0101 )		//Scanner Judge == 5461		...............
					begin
						Data_out <= DUTY_S_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b1	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b001_0101_0101_0110 )		//Scanner Judge == 5462		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b1	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0001	;
						EN_CTRL <= 1'b0	;
					end
				else if ( Scan_Judge == 15'b010_1010_1010_0000 )		//Scanner Judge == 10912		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b0	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0111	;
						EN_CTRL <= 1'b1	;
					end
				else if ( Scan_Judge == 15'b010_1010_1010_0001 )		//Scanner Judge == 10913		...............
					begin
						Data_out <= GAIN_V_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b0	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b010_1010_1010_0101 )		//Scanner Judge == 10917		...............
					begin
						Data_out <= GAIN_V_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b1	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b010_1010_1010_0110 )		//Scanner Judge == 10918		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b1	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0010	;
						EN_CTRL <= 1'b0	;
					end
				else if ( Scan_Judge == 15'b011_1111_1111_0000 )		//Scanner Judge == 16368		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b0	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0111	;
						EN_CTRL <= 1'b1	;
					end
				else if ( Scan_Judge == 15'b011_1111_1111_0001 )		//Scanner Judge == 16369		...............
					begin
						Data_out <= SQ_VL_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b0	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b011_1111_1111_0101 )		//Scanner Judge == 16373		...............
					begin
						Data_out <= SQ_VL_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b1	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b011_1111_1111_0110 )		//Scanner Judge == 16374		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b1	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0011	;
						EN_CTRL <= 1'b0	;
					end
				else if ( Scan_Judge == 15'b101_0101_0100_0000 )		//Scanner Judge == 21824		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b0	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0111	;
						EN_CTRL <= 1'b1	;
					end
				else if ( Scan_Judge == 15'b101_0101_0100_0001 )		//Scanner Judge == 21825		...............
					begin
						Data_out <= SQ_VT_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b0	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b101_0101_0100_0101 )		//Scanner Judge == 21829		...............
					begin
						Data_out <= SQ_VT_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b1	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b101_0101_0100_0110 )		//Scanner Judge == 21830		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b1	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0100	;
						EN_CTRL <= 1'b0	;
					end
				else if ( Scan_Judge == 15'b110_1010_1001_0000 )		//Scanner Judge == 27280		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b0	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0111	;
						EN_CTRL <= 1'b1	;
					end
				else if ( Scan_Judge == 15'b110_1010_1001_0001 )		//Scanner Judge == 27281		...............
					begin
						Data_out <= Spare_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b0	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b110_1010_1001_0101 )		//Scanner Judge == 27285		...............
					begin
						Data_out <= Spare_Vin	;
						R_Wbar <= R_Wbar	;
						CSbar <= 1'b1	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
				else if ( Scan_Judge == 15'b110_1010_1001_0110 )		//Scanner Judge == 27286		...............
					begin
						Data_out <= Data_out	;
						R_Wbar <= 1'b1	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= 4'b0101	;
						EN_CTRL <= 1'b0	;
					end
				else 
					begin
						Data_out <= Data_out	;
						R_Wbar <= R_Wbar	;
						CSbar <= CSbar	;
						HC4051_State_Sel <= HC4051_State_Sel	;
						EN_CTRL <= EN_CTRL	;
					end
			end
	end


endmodule


										
