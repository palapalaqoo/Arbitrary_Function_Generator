//Here Clock use be 107MHz.....................................................................................
`timescale	1ns/1ps

module	Latch_Data_Region(BSK1_Vout, BSK2_Vout, FSK_INTP_Vout, Burst_INTP_Vout, Burst_Count_Vout, Burst_INCRE_Vout,
									FM_DEV_Value, FM_Freq_Value, Sweep_StaEnd_Value, Sweep_Start_Value, Sweep_SWTime_Value, Sweep_SWMark_Value, FM_CMF_Value,
									Data48B_in, Data20B_in, Data16B_in, EN_K1, EN_K2, EN_FSKINTP_VU, EN_BurstINTP_VU, EN_BurstCount_VU, AM_CONS_Values,
									EN_FM_DEV, EN_FM_FREQ, EN_Sweep_StaEnd, EN_Sweep_StartFreq, EN_Sweep_Time, Delay_Value_OUT,
									EN_BurstINCRE_VU, EN_SW_Marker, EN_Delay_VU, EN_AM_CONS,
									EN_MODWAVE_VU, EN_DCOFFSET_VU, EN_DUTY_VU, EN_GAIN_VU, EN_SPARE_VU, EN_SQVL_VU, EN_SQVT_VU,
									MOD_WAVE_Value, DC_OFFSET_Value, DUTY_Value, GAIN_Value, SQVL_Value, SQVT_Value, Spare_Value, EN_KeyData, KeyData_Values,
									Clock, Reset)	;
									
output	[47:0]	BSK1_Vout, BSK2_Vout, Burst_INTP_Vout	;
wire	[47:0]	BSK1_Vout, BSK2_Vout, Burst_INTP_Vout	;

output	[41:0]	FSK_INTP_Vout	;
wire	[41:0]	FSK_INTP_Vout	;

output	[19:0]	Burst_Count_Vout	;
wire	[19:0]	Burst_Count_Vout	;

output	[15:0]	Burst_INCRE_Vout, KeyData_Values	;
wire	[15:0]	Burst_INCRE_Vout, KeyData_Values	;

output	[47:0]	FM_DEV_Value, FM_Freq_Value, Sweep_StaEnd_Value, Sweep_Start_Value, Sweep_SWTime_Value, FM_CMF_Value	;
wire	[47:0]	FM_DEV_Value, FM_Freq_Value, Sweep_StaEnd_Value, Sweep_Start_Value, Sweep_SWTime_Value, FM_CMF_Value	;

output	[11:0]	Sweep_SWMark_Value	;
wire	[11:0]	Sweep_SWMark_Value	;

output	[33:0]	Delay_Value_OUT	;
wire	[33:0]	Delay_Value_OUT	;

output	[11:0]	MOD_WAVE_Value, DC_OFFSET_Value, DUTY_Value, GAIN_Value, SQVL_Value, SQVT_Value, Spare_Value	;
wire	[11:0]	MOD_WAVE_Value, DC_OFFSET_Value, DUTY_Value, GAIN_Value, SQVL_Value, SQVT_Value, Spare_Value	;

output	[15:0]	AM_CONS_Values	;
wire	[15:0]	AM_CONS_Values	;



input	[47:0]	Data48B_in	;
wire	[47:0]	Data48B_in	;

input	[19:0]	Data20B_in	;
wire	[19:0]	Data20B_in	;

input	[15:0]	Data16B_in	;
wire	[15:0]	Data16B_in	;

input	EN_K1, EN_K2, EN_FSKINTP_VU, EN_BurstINTP_VU, EN_BurstCount_VU, EN_BurstINCRE_VU	;
wire	EN_K1, EN_K2, EN_FSKINTP_VU, EN_BurstINTP_VU, EN_BurstCount_VU, EN_BurstINCRE_VU	;

input	EN_FM_DEV, EN_FM_FREQ, EN_Sweep_StaEnd, EN_Sweep_StartFreq, EN_Sweep_Time	;
wire	EN_FM_DEV, EN_FM_FREQ, EN_Sweep_StaEnd, EN_Sweep_StartFreq, EN_Sweep_Time	;

input	EN_SW_Marker, EN_Delay_VU	;
wire	EN_SW_Marker, EN_Delay_VU	;

input	EN_MODWAVE_VU, EN_DCOFFSET_VU, EN_DUTY_VU, EN_GAIN_VU, EN_SPARE_VU, EN_SQVL_VU, EN_SQVT_VU	;
wire	EN_MODWAVE_VU, EN_DCOFFSET_VU, EN_DUTY_VU, EN_GAIN_VU, EN_SPARE_VU, EN_SQVL_VU, EN_SQVT_VU	;

input	EN_AM_CONS	;
wire	EN_AM_CONS	;

input	EN_KeyData	;
wire	EN_KeyData	;

input	Clock, Reset	;
wire	Clock, Reset	;



Based_DDFS_LD48B_K1			BS_DDFS_K1(.Dout(BSK1_Vout), .Din(Data48B_in), .EN(EN_K1), .Clock(Clock), .Reset(Reset))	;
Based_DDFS_LD48B_K2			BS_DDFS_K2(.Dout(BSK2_Vout), .Din(Data48B_in), .EN(EN_K2), .Clock(Clock), .Reset(Reset))	;
FSK_IPeriod_LD42B				FSK_INT_VU(.Dout(FSK_INTP_Vout), .Din(Data48B_in[41:0]), .EN(EN_FSKINTP_VU), .Clock(Clock), .Reset(Reset))	;
Burst_IPeriod_LD48B			Burst_INT_VU(.Dout(Burst_INTP_Vout), .Din(Data48B_in), .EN(EN_BurstINTP_VU), .Clock(Clock), .Reset(Reset))	;
Burst_Count_LD20B				Burst_Count_VU(.Dout(Burst_Count_Vout), .Din(Data20B_in), .EN(EN_BurstCount_VU), .Clock(Clock), .Reset(Reset))	;
Burst_Increment_LD16B		Burst_INCRE_VU(.Dout(Burst_INCRE_Vout), .Din(Data16B_in), .EN(EN_BurstINCRE_VU), .Clock(Clock), .Reset(Reset))	;

FM_CFrequency_Value			FM_CFrequency_VUU(.Dout(FM_CMF_Value), .Din(Data48B_in), .EN(EN_K1), .Clock(Clock), .Reset(Reset))	;
FM_Deviation_Value			FM_Deviation_VU(.Dout(FM_DEV_Value), .Din(Data48B_in), .EN(EN_FM_DEV), .Clock(Clock), .Reset(Reset))	;
FM_Frequency_Value			FM_Frequency_VU(.Dout(FM_Freq_Value), .Din(Data48B_in), .EN(EN_FM_FREQ), .Clock(Clock), .Reset(Reset))	;
Sweep_StartEnd_DiffV			Sweep_StaEnd_VU(.Dout(Sweep_StaEnd_Value), .Din(Data48B_in), .EN(EN_Sweep_StaEnd), .Clock(Clock), .Reset(Reset))	;
Sweep_Start_Frequency		Sweep_Start_FVU(.Dout(Sweep_Start_Value), .Din(Data48B_in), .EN(EN_Sweep_StartFreq), .Clock(Clock), .Reset(Reset))	;
Sweep_Time_Value				Sweep_SweepTime(.Dout(Sweep_SWTime_Value), .Din(Data48B_in), .EN(EN_Sweep_Time), .Clock(Clock), .Reset(Reset))	;
Sweep_Marker_ValueLD			Sweep_SWMarker(.Dout(Sweep_SWMark_Value), .Din(Data16B_in[11:0]), .EN(EN_SW_Marker), .Clock(Clock), .Reset(Reset))	;

Burst_Delay_VU					Burst_Delay_VUR(.Dout(Delay_Value_OUT), .Din(Data48B_in[33:0]), .EN(EN_Delay_VU), .Clock(Clock), .Reset(Reset))	;

REG_DAC7821_MODWAVE			LD_MODWAVE_VU(.Dout(MOD_WAVE_Value), .Din(Data16B_in[11:0]), .EN(EN_MODWAVE_VU), .Clock(Clock), .Reset(Reset))	;
REG_DC_OFFSET					LD_DC_OFFSET_VU(.Dout(DC_OFFSET_Value), .Din(Data16B_in[11:0]), .EN(EN_DCOFFSET_VU), .Clock(Clock), .Reset(Reset))	;
REG_DUTY_S						LD_DUYT_S_VU(.Dout(DUTY_Value), .Din(Data16B_in[11:0]), .EN(EN_DUTY_VU), .Clock(Clock), .Reset(Reset))	;
REG_GAIN_V						LD_GAIN_V_VU(.Dout(GAIN_Value), .Din(Data16B_in[11:0]), .EN(EN_GAIN_VU), .Clock(Clock), .Reset(Reset))	;
REG_SPARE						LD_SPARE_VU(.Dout(Spare_Value), .Din(Data16B_in[11:0]), .EN(EN_SPARE_VU), .Clock(Clock), .Reset(Reset))	;
REG_SQ_VL						LD_SQ_VL_VU(.Dout(SQVL_Value), .Din(Data16B_in[11:0]), .EN(EN_SQVL_VU), .Clock(Clock), .Reset(Reset))	;
REG_SQ_VT						LD_SQ_VT_VU(.Dout(SQVT_Value), .Din(Data16B_in[11:0]), .EN(EN_SQVT_VU), .Clock(Clock), .Reset(Reset))	;

AM_CONSTANT_LD16B				LD_AM_CONSV(.Dout(AM_CONS_Values), .Din(Data16B_in), .EN(EN_AM_CONS), .Clock(Clock), .Reset(Reset))	;

KeyData_LD16B					LD_KeyData(.Dout(KeyData_Values), .Din(Data16B_in), .EN(EN_KeyData), .Clock(Clock), .Reset(Reset))	;

endmodule
