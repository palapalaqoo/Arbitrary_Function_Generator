`timescale	1ns/1ps

module	AFG3000_FPGA(DA9747_Data, DA9747_CLKP, DA9747_CLKN, AD9224_CLK, Trigout_Pin, SYNC_OUT, NWE, NCS, CPU_Data, CPU_Addr, EXT_MODU_SIN,  
						AD9224_IN, Clock, Reset, AM_DA9747_Data, Relay_Ctrl_Words, DAC7821_Data, OUT_PROTECT, MODWAVE_CSbar, MODWAVE_RWbar,
						CVG_DAC7821_Data, CVG_DAC7821_RWbar, CVG_DAC7821_CSbar, HC4051_SELs, MOD_SOUT_SEL, 
						DDR2_A, DDR2_BA, DDR2_DM, DDR2_CKE, DDR2_CS_N, DDR2_RAS_N, DDR2_CAS_N, DDR2_WE_N, DDR2_ODT, 
						RST_DQS_DIV_OUT, DDR2_CK, DDR2_CK_N, DDR2_DQS, DDR2_DQS_N, DDR2_DQ, RST_DQS_DIV_IN, ARB_EDDS_SIN, NRD,
						KB_Bus, KD_Bus, Do_Ctrl, Key_INT, ARB_CLK_TB)	;
output ARB_CLK_TB;
wire ARB_CLK_TB;


output	[11:0]	DAC7821_Data	;
wire	[11:0]	DAC7821_Data	;

output	[15:0]	DA9747_Data	;
wire	[15:0]	DA9747_Data	;

output	[15:0]	AM_DA9747_Data	;
wire	[15:0]	AM_DA9747_Data	;

output	DA9747_CLKP, DA9747_CLKN	;
wire	DA9747_CLKP, DA9747_CLKN	;

output	Trigout_Pin	;
wire	Trigout_Pin	;

output	AD9224_CLK	;
wire	AD9224_CLK	;

output	SYNC_OUT	;
wire	SYNC_OUT	;

output	[6:0]	Relay_Ctrl_Words	;
wire	[6:0]	Relay_Ctrl_Words	;

output	OUT_PROTECT	;
wire	OUT_PROTECT	;

output	MODWAVE_CSbar, MODWAVE_RWbar	;
wire	MODWAVE_CSbar, MODWAVE_RWbar	;

output	[11:0]	CVG_DAC7821_Data	;
wire	[11:0]	CVG_DAC7821_Data	;

output	CVG_DAC7821_RWbar, CVG_DAC7821_CSbar	;
wire	CVG_DAC7821_RWbar, CVG_DAC7821_CSbar	;

output	[3:0]	HC4051_SELs	;
wire	[3:0]	HC4051_SELs	;

output	[2:0]	MOD_SOUT_SEL	;
wire	[2:0]	MOD_SOUT_SEL	;

input	[4:0]	KB_Bus	;
wire	[4:0]	KB_Bus	;

output	[2:0]	KD_Bus	;
wire	[2:0]	KD_Bus	;

output	Do_Ctrl, Key_INT	;
wire	Do_Ctrl, Key_INT	;


//Declare input ports..............................
input	EXT_MODU_SIN	;
wire	EXT_MODU_SIN	;


input	NWE, NCS, NRD	;
wire	NWE, NCS, NRD	;

input	[25:0]	CPU_Addr	;
wire	[25:0]	CPU_Addr	;

inout	[15:0]	CPU_Data	;
wire	[15:0]	CPU_Data	;

input	[11:0]	AD9224_IN	;
wire	[11:0]	AD9224_IN	;

input	Clock, Reset	;
wire	Clock, Reset	;

//These declare I/O ports is for DDR2 interface connection.......................
output	DDR2_CKE, DDR2_CS_N, DDR2_RAS_N, DDR2_CAS_N, DDR2_WE_N, DDR2_ODT, RST_DQS_DIV_OUT, DDR2_CK, DDR2_CK_N	;
wire	DDR2_CKE, DDR2_CS_N, DDR2_RAS_N, DDR2_CAS_N, DDR2_WE_N, DDR2_ODT, RST_DQS_DIV_OUT, DDR2_CK, DDR2_CK_N	;

output	[12:0]	DDR2_A	;
wire	[12:0]	DDR2_A	;

output	[1:0]	DDR2_BA, DDR2_DM	;
wire	[1:0]	DDR2_BA, DDR2_DM	;


inout	[1:0]	DDR2_DQS, DDR2_DQS_N	;
wire	[1:0]	DDR2_DQS, DDR2_DQS_N	;

inout	[15:0]	DDR2_DQ	;
wire	[15:0]	DDR2_DQ	;

input	RST_DQS_DIV_IN	;
wire	RST_DQS_DIV_IN	;

input	ARB_EDDS_SIN	;
wire	ARB_EDDS_SIN	;

//Above decalre I/O port is for DDR2 interface connection................................


wire	CLK_214MHz, CLK_107MHz, CLK_54MHz	;
wire	[31:0]	DEC_CTRL_BUS, CTRL_WORD	;
wire	[16:0]	DEC_DATA_BUS	;
wire	[15:0]	FPGA_DATA_BUS	;
wire	[47:0]	Phase_K1, Phase_K2	;
wire	[41:0]	FSK_Rate_VU	;
wire	[47:0]	Burst_INT_VU	;
wire	[19:0]	Burst_Count_VU	;
wire	[15:0]	Burst_INCRE_VU	;
wire	[47:0]	DataStack_48B	;
wire	[19:0]	DataStack_20B	;
wire	[15:0]	DataStack_16B	;
wire	[47:0]	Phase_VU	;
wire	FSK_Rate_CTRL	;
wire	INTReset, EN_BAC, Reset_Burst	;
wire	[15:0]	DDS_OUT	;

wire	[47:0]	Phase_K1T, Phase_K2T, Burst_INT_VUT	; 
wire	[41:0]	FSK_Rate_VUT	;
wire	[19:0]	Burst_Count_VUT	;
wire	[15:0]	Burst_INCRE_VU03	;

wire	[11:0]	AD9224_Dout	;
wire	[47:0]	FSK_OUT, FM_SWEEP_OUT	;

wire	[47:0]	Deviation_Value, FM_Rate_Value, SW_Start_Value, SW_StaEnd_Value, SW_SWTime_Value, FM_CFreq, CFrquency_Value	;
wire	[47:0]	To_FM_Devi, To_FM_Rate, To_SW_Start, To_SW_STEN, To_SW_SWTM	;
wire	[47:0]	To_FTW1, To_FM, To_FTW_RAM	;
wire	[11:0]	K4RAM_ADDR, K4RAM_DATA, FMSWRAM_ADDR, FMSWRAM_DATA	;
wire	K4RAM_WEA, FMSWRAM_WEA	;
wire	EXT_MODU_SIN_OUT, Burst_INT_Trigout	;
wire	[11:0]	SWMARK_TWIRE, SW_MARK	;





wire	[15:0]	Tri_Data	;
wire	Tri_We	;

wire	Triangle_WEN	;
wire	[15:0]	Triangle_Din	;
wire	[9:0]	Triangle_Ain	;
wire	[33:0]	BSTDelay_Values, BSTDelay_Values00	;


wire	FM_SYNC_OUT, ARB_CLK_OUT, ARB_SYNC_OUT, DIFF_CLKIN	;
wire	[15:0]	ARB_DOUT, DDS_OUT_Temp00, DDS_OUT_Temp01	;

wire	PSCLK214MHz_0D	;

wire	[31:0]	PSWR2	;
assign	Relay_Ctrl_Words = PSWR2[6:0]	;

wire	[11:0]	MODSG_Value	;

//assign	OUT_PROTECT = CTRL_WORD[27]	;

wire	[11:0]	DEC_DAC7821_ENBUS	;
wire	[11:0]	DAC7821_DC_OFFSET, DAC7821_DUTY_S, DAC7821_GAIN_V, DAC7821_SQ_VL, DAC7821_SQ_VT, DAC7821_Spare	;
wire	[11:0]	DAC_OFFSET_VU, DAC_DUTYS_VU, DAC_GAINV_VU, DAC_SQVL_VU, DAC_SQVT_VU, DAC_SPARE_VU	;
wire	CLK_6MHz	;

wire	[15:0]	AM_Constant_Value, AM_CONS_Value	;
wire	CVG_DAC7821_LD_CTRL	;

wire	DataBus_BiCtrl	;
wire	[15:0]	CPU_Data2, DataBack, KeyPad_Values	;



IOBUF								DataBus_IOBUF0(.O(CPU_Data2[0]), .IO(CPU_Data[0]), .I(DataBack[0]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF1(.O(CPU_Data2[1]), .IO(CPU_Data[1]), .I(DataBack[1]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF2(.O(CPU_Data2[2]), .IO(CPU_Data[2]), .I(DataBack[2]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF3(.O(CPU_Data2[3]), .IO(CPU_Data[3]), .I(DataBack[3]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF4(.O(CPU_Data2[4]), .IO(CPU_Data[4]), .I(DataBack[4]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF5(.O(CPU_Data2[5]), .IO(CPU_Data[5]), .I(DataBack[5]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF6(.O(CPU_Data2[6]), .IO(CPU_Data[6]), .I(DataBack[6]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF7(.O(CPU_Data2[7]), .IO(CPU_Data[7]), .I(DataBack[7]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF8(.O(CPU_Data2[8]), .IO(CPU_Data[8]), .I(DataBack[8]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF9(.O(CPU_Data2[9]), .IO(CPU_Data[9]), .I(DataBack[9]), .T(DataBus_BiCtrl))	;

IOBUF								DataBus_IOBUF10(.O(CPU_Data2[10]), .IO(CPU_Data[10]), .I(DataBack[10]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF11(.O(CPU_Data2[11]), .IO(CPU_Data[11]), .I(DataBack[11]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF12(.O(CPU_Data2[12]), .IO(CPU_Data[12]), .I(DataBack[12]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF13(.O(CPU_Data2[13]), .IO(CPU_Data[13]), .I(DataBack[13]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF14(.O(CPU_Data2[14]), .IO(CPU_Data[14]), .I(DataBack[14]), .T(DataBus_BiCtrl))	;
IOBUF								DataBus_IOBUF15(.O(CPU_Data2[15]), .IO(CPU_Data[15]), .I(DataBack[15]), .T(DataBus_BiCtrl))	;



REG_VKEY							KEYPAD_MODULE(.CLK(CLK_54MHz), .KB(KB_Bus), .KD(KD_Bus), .INT(Key_INT), .VKEY(DataBack), .LED(KeyPad_Values), .LED_OUT(Do_Ctrl));

DCM_IRest						DCM_INTRST(.CLKFX_O(CLK_214MHz), .CLK2X_O(CLK_107MHz), .CLKIBUFG_O(CLK_54MHz), .PSCLK180_OUT(PSCLK214MHz_0D), .Clock(Clock))	;

Decoder_DataCtrl				DEC_DAC(.FPGA_INT_Data(FPGA_DATA_BUS), .Decode_DAout(DEC_DATA_BUS), .OPCTRL(DEC_CTRL_BUS), .RAM4K_ADDR(K4RAM_ADDR), .RAM4K_DATA(K4RAM_DATA), .RAM4K_WEA(K4RAM_WEA),
												.OPCTRL_V2(PSWR2), .CPUI_NWE(NWE), .CPUI_NCS(NCS), .CPUI_DATA(CPU_Data2), .CPUI_ADDR(CPU_Addr), .FPGA_INT_Data00(Tri_Data), .TriRAM1K_we(Tri_We), .CPUI_NRD(NRD),
												.DEC_DAC7821_DECOUT(DEC_DAC7821_ENBUS), .Bi_DataBus_Ctrl(DataBus_BiCtrl), .Clock(CLK_107MHz), .Reset(Reset))	;

Data_Stack_48bits				Data_Stack_Region(.DataOut_48B(DataStack_48B), .DataOut_20B(DataStack_20B), .DataOut_16B(DataStack_16B), .Data_in(FPGA_DATA_BUS), .EN_P1(DEC_DATA_BUS[0]), .EN_P2(DEC_DATA_BUS[1]), 
															.EN_P3(DEC_DATA_BUS[2]), .EN_P4(DEC_DATA_BUS[3]), .Clock(CLK_107MHz), .Reset(Reset))	;

Latch_Data_Region				LD_Region(.BSK1_Vout(Phase_K1), .BSK2_Vout(Phase_K2), .FSK_INTP_Vout(FSK_Rate_VU), .Burst_INTP_Vout(Burst_INT_VU), .Burst_Count_Vout(Burst_Count_VU), .Burst_INCRE_Vout(Burst_INCRE_VU),
													.FM_DEV_Value(Deviation_Value), .FM_Freq_Value(FM_Rate_Value), .Sweep_StaEnd_Value(SW_StaEnd_Value), .Sweep_Start_Value(SW_Start_Value), .Sweep_SWTime_Value(SW_SWTime_Value), 
													.Sweep_SWMark_Value(SWMARK_TWIRE), .FM_CMF_Value(CFrquency_Value), .Data48B_in(DataStack_48B), .Data20B_in(DataStack_20B), .Data16B_in(DataStack_16B), 
													.EN_K1(DEC_DATA_BUS[4]), .EN_K2(DEC_DATA_BUS[5]), .EN_FSKINTP_VU(DEC_DATA_BUS[6]), .AM_CONS_Values(AM_Constant_Value),
													.EN_FM_DEV(DEC_DATA_BUS[10]), .EN_FM_FREQ(DEC_DATA_BUS[11]), .EN_Sweep_StaEnd(DEC_DATA_BUS[12]), .EN_Sweep_StartFreq(DEC_DATA_BUS[13]), .EN_Sweep_Time(DEC_DATA_BUS[14]), 
													.Delay_Value_OUT(BSTDelay_Values), .EN_Delay_VU(DEC_DATA_BUS[16]), .EN_AM_CONS(DEC_DAC7821_ENBUS[7]), .EN_KeyData(DEC_DAC7821_ENBUS[8]), .KeyData_Values(KeyPad_Values),
													.EN_MODWAVE_VU(DEC_DAC7821_ENBUS[0]), .EN_DCOFFSET_VU(DEC_DAC7821_ENBUS[1]), .EN_DUTY_VU(DEC_DAC7821_ENBUS[2]), .EN_GAIN_VU(DEC_DAC7821_ENBUS[3]), .EN_SPARE_VU(DEC_DAC7821_ENBUS[6]), .EN_SQVL_VU(DEC_DAC7821_ENBUS[4]), .EN_SQVT_VU(DEC_DAC7821_ENBUS[5]),
													.MOD_WAVE_Value(MODSG_Value), .DC_OFFSET_Value(DAC7821_DC_OFFSET), .DUTY_Value(DAC7821_DUTY_S), .GAIN_Value(DAC7821_GAIN_V), .SQVL_Value(DAC7821_SQ_VL), .SQVT_Value(DAC7821_SQ_VT), .Spare_Value(DAC7821_Spare), 
													.EN_BurstINTP_VU(DEC_DATA_BUS[7]), .EN_BurstCount_VU(DEC_DATA_BUS[8]), .EN_BurstINCRE_VU(DEC_DATA_BUS[9]), .EN_SW_Marker(DEC_DATA_BUS[15]), .Clock(CLK_107MHz), .Reset(Reset))	;


Data_Reg48B						Phase_K1Temp(.Dout(Phase_K1T), .Din(Phase_K1), .Clock(CLK_107MHz))	;
Data_Reg48B						Phase_K2Temp(.Dout(Phase_K2T), .Din(Phase_K2), .Clock(CLK_107MHz))	;
Data_Reg42B						FSK_Rate_VTemp(.Dout(FSK_Rate_VUT), .Din(FSK_Rate_VU), .Clock(CLK_107MHz))	;


//=======
OPCTRL_DPATH					DECOPCTRL_DPATH(.Dout(CTRL_WORD), .Din(DEC_CTRL_BUS), .Clock(CLK_107MHz))	;

Burst_INTP_Path				Burst_INT_PATH(.Dout(Burst_INT_VUT), .Din(Burst_INT_VU), .Clock(CLK_107MHz))	;
Burst_Amount_Path				Burst_AMON_PATH(.Dout(Burst_Count_VUT), .Din(Burst_Count_VU), .Clock(CLK_107MHz))	;
Burst_INCRE_VPath				Burst_INCRE_PATH(.Dout(Burst_INCRE_VU03), .Din(Burst_INCRE_VU), .Clock(CLK_107MHz))	;

Central_Freq_path				FM_CF_PATH(.Dout(FM_CFreq), .Din(CFrquency_Value), .Clock(CLK_107MHz))	;
FM_Deviation_Path				FM_DEVI_PATH(.Dout(To_FM_Devi), .Din(Deviation_Value), .Clock(CLK_107MHz))	;
FM_Frequency_Path				FM_FREQ_PATH(.Dout(To_FM_Rate), .Din(FM_Rate_Value), .Clock(CLK_107MHz))	;
Sweep_StaEnd_Path				SW_STEN_PATH(.Dout(To_SW_STEN), .Din(SW_StaEnd_Value), .Clock(CLK_107MHz))	;
Sweep_Start_Path				SW_START_PATH(.Dout(To_SW_Start), .Din(SW_Start_Value), .Clock(CLK_107MHz))	;
Sweep_SweepTime_Path			SW_SWTM_PATH(.Dout(To_SW_SWTM), .Din(SW_SWTime_Value), .Clock(CLK_107MHz))	;
AD9224_DataPath				AD9224_DPATH(.Dout(AD9224_Dout), .Din(AD9224_IN), .Clock(CLK_107MHz))	;
EXTSIN_DPATH					EXTSIG_DPATH(.Dout(EXT_MODU_SIN_OUT), .Din(EXT_MODU_SIN), .Clock(CLK_214MHz))	;
SW_Marker_DPath				SWMARK_DPATH(.Dout(SW_MARK), .Din(SWMARK_TWIRE), .Clock(CLK_107MHz))	;
Delay_Value_Path				Delay_DPATH(.VDout(BSTDelay_Values00), .VDin(BSTDelay_Values), .Clock(CLK_107MHz))	;
TRIARAM_DPATH					Triangle_DPTH(.Dout(Triangle_Din), .Aout(Triangle_Ain), .ENout(Triangle_WEN), .Ain(K4RAM_ADDR[9:0]), .Din(Tri_Data), .ENin(Tri_We), .Clock(CLK_107MHz), .Clock2(CLK_214MHz))	;
FSWMRAM_DPTH					FMSWRAM_DPTH(.Dout(FMSWRAM_DATA), .Aout(FMSWRAM_ADDR), .Wout(FMSWRAM_WEA), .Win(K4RAM_WEA), .Ain(K4RAM_ADDR), .Din(K4RAM_DATA), .Clock(CLK_107MHz))	;					

DCOFFSET_VPath					DCOFFSET_DPATH(.Dout(DAC_OFFSET_VU), .Din(DAC7821_DC_OFFSET), .EN(CVG_DAC7821_LD_CTRL), .Clock(CLK_107MHz))	;
DUTYS_VPath						DUTYS_DPATH(.Dout(DAC_DUTYS_VU), .Din(DAC7821_DUTY_S), .EN(CVG_DAC7821_LD_CTRL), .Clock(CLK_107MHz))	;
GAINV_VPath						GAINV_DPATH(.Dout(DAC_GAINV_VU), .Din(DAC7821_GAIN_V), .EN(CVG_DAC7821_LD_CTRL), .Clock(CLK_107MHz))	;
SPARE_VPath						SQVL_DPATH(.Dout(DAC_SQVL_VU), .Din(DAC7821_SQ_VL), .EN(CVG_DAC7821_LD_CTRL), .Clock(CLK_107MHz))	;
SQVL_VPath						SQVT_DPATH(.Dout(DAC_SQVT_VU), .Din(DAC7821_SQ_VT), .EN(CVG_DAC7821_LD_CTRL), .Clock(CLK_107MHz))	;
SQVT_VPath						SPARE_DPATH(.Dout(DAC_SPARE_VU), .Din(DAC7821_Spare), .EN(CVG_DAC7821_LD_CTRL), .Clock(CLK_107MHz))	;

AM_Constants_VPath			AM_CONS_DPATH(.Dout(AM_CONS_Value), .Din(AM_Constant_Value), .Clock(CLK_107MHz))	;

//======


Sweep_FM_Mux48					Start_Central_SEL(.Dout(To_FTW1), .Din1(To_SW_Start), .Din2(FM_CFreq), .Sel(CTRL_WORD[12]), .Clock(CLK_107MHz))	;
Sweep_FM_Mux48					StaEnd_Deviation_SEL(.Dout(To_FM), .Din1(To_SW_STEN), .Din2(To_FM_Devi), .Sel(CTRL_WORD[12]), .Clock(CLK_107MHz))	;
Sweep_FM_Mux48					SWTime_FMRate_SEL(.Dout(To_FTW_RAM), .Din1(To_SW_SWTM), .Din2(To_FM_Rate), .Sel(CTRL_WORD[12]), .Clock(CLK_107MHz))	;



						
FSK_Rate_Sel					FSK_Rate_SW(.Mout(FSK_OUT), .Min_1(Phase_K1T), .Min_2(Phase_K2T), .SW_Sel(FSK_Rate_CTRL), .Clock(CLK_214MHz))	;										
										
FSK_Mode							FSK_Rate_Mode(.FSK_Ctrl_out(FSK_Rate_CTRL), .FSK_EN_INT(CTRL_WORD[0]), .FSK_EN_EXT(CTRL_WORD[1]), .FSK_Value(FSK_Rate_VUT), .FSK_EXT_SIG(EXT_MODU_SIN_OUT), .Clock(CLK_214MHz), .Reset(Reset))	;			

Integrate_DDFS					INTDDFS(.Data_out(DDS_OUT), .PCO(EN_BAC), .Data_in(Phase_VU), .Start_Phase_IN(Burst_INCRE_VU03[13:0]), .BurstEN(CTRL_WORD[2]), .Burst_IEG_AP_Sel(CTRL_WORD[7]), 
												.Sel_SinTri(CTRL_WORD[20]), .Triangle_Addrin(Triangle_Ain), .Triangle_Datain(Triangle_Din), .TriRAM_WE(Triangle_WEN), .Triangle_Clock(CLK_107MHz), .Clock(CLK_214MHz), .Reset(INTReset), .EReset(Reset))	;
												
Burst_Ctrl_Integrate			Burst_Ctrl_Mode(.EN_Ctrl(Reset_Burst), .INT_TR_out(Burst_INT_Trigout), .Amount_Value_in(Burst_Count_VUT), .Internal_Period_Value(Burst_INT_VUT), .BurstEN(CTRL_WORD[21]), .EN_BAC_in(EN_BAC),
															.INT_TR_Sel(CTRL_WORD[4:3]), .Gated_TR_Sel(CTRL_WORD[8]), .EXT_TR_Sel(CTRL_WORD[6]),. External_Signal(EXT_MODU_SIN_OUT), .Gated_Sel(CTRL_WORD[7]), .Period_Sel(CTRL_WORD[5]), 
															.ManualEN(CTRL_WORD[9]), .InfiniteEN(CTRL_WORD[10]), .Ctrl_Pulse(CTRL_WORD[22]), .DelayValues(BSTDelay_Values00), .Clock(CLK_214MHz), .Reset(Reset), .Clock107M(CLK_107MHz))	;

Reset_Mux						Reset_Switch(.Dout(INTReset), .Din1(Reset), .Din2(Reset_Burst), .Sel(CTRL_WORD[2]), .Clock(CLK_214MHz))	;



BufReg16B						BufReg16B00(.Dout(DDS_OUT_Temp00), .Din(DDS_OUT), .Clock(CLK_214MHz))	;
BufReg16B						BufReg16B01(.Dout(DDS_OUT_Temp01), .Din(DDS_OUT_Temp00), .Clock(CLK_214MHz))	;


FM									FM_Mode(.AD(AD9224_Dout), .CLR(~Reset), .C_FMCLK(CTRL_WORD[13]), .FM({1'b0, To_FM}), .FM_SWEEP(CTRL_WORD[12]), .FTW_RAM(To_FTW_RAM), .FTW1(To_FTW1), .INT_EXT(CTRL_WORD[13]), 
												.MAIN_CLK(CLK_214MHz), .RAM_ADDR(FMSWRAM_ADDR), .RAM_CE(FMSWRAM_WEA), .RAM_CLK(CLK_107MHz), .RAM_DATA(FMSWRAM_DATA), .FMCLK(AD9224_CLK), .PHASE_DDS(FM_SWEEP_OUT),
												.EXT_T(EXT_MODU_SIN_OUT), .T_int_ext(CTRL_WORD[18]), .T_Pos_Neg(CTRL_WORD[17]), .Sweep_marker(SW_MARK), .T_Ctrl(CTRL_WORD[16:14]), .SYNC(FM_SYNC_OUT), .Ext_Manul_Exchange(CTRL_WORD[25]), 
												.FM_MTrigger(CTRL_WORD[24]), .CON(CTRL_WORD[23]), .AM_Dout(AM_DA9747_Data), .T_out(SW_TRG_OUT), .DECODE_MOD(MODSG_Value), .DC_MOD(CTRL_WORD[26]), .To_DAC7821(DAC7821_Data), .XLXN_159(CLK_6MHz), .AM_Constant(AM_CONS_Value));

Sweep_FM_Mux48					Normal_FMSWEEP_SEL(.Dout(Phase_VU), .Din1(FSK_OUT), .Din2(FM_SWEEP_OUT), .Sel(CTRL_WORD[11]), .Clock(CLK_214MHz))	;	//when FM_Sweep Mode is Enable the CTRL_WORD[11] must set to 1'b1................. 

BFS_Trigout_SEL				BFS_TRGOUT_Switch(.Dout(Trigout_Pin), .Din1(Burst_INT_Trigout), .Din2(SW_TRG_OUT), .Sel(CTRL_WORD[11]), .Clock(CLK_214MHz))	;


ARB_MODULE						ARB_MODE(.CLK_in(CLK_54MHz), .cntrl0_rst_dqs_div_in(RST_DQS_DIV_IN), .cntrl0_ddr2_cke(DDR2_CKE), .cntrl0_ddr2_cs_n(DDR2_CS_N), .cntrl0_ddr2_ras_n(DDR2_RAS_N), 
												.cntrl0_ddr2_cas_n(DDR2_CAS_N), .cntrl0_ddr2_we_n(DDR2_WE_N), .cntrl0_ddr2_odt(DDR2_ODT), .cntrl0_rst_dqs_div_out(RST_DQS_DIV_OUT),  
												.cntrl0_ddr2_a(DDR2_A), .cntrl0_ddr2_ba(DDR2_BA), .cntrl0_ddr2_dm(DDR2_DM), .cntrl0_ddr2_ck(DDR2_CK), .cntrl0_ddr2_ck_n(DDR2_CK_N), 
												.cntrl0_ddr2_dqs(DDR2_DQS), .cntrl0_ddr2_dqs_n(DDR2_DQS_N), .cntrl0_ddr2_dq(DDR2_DQ), .DAC_DATA(ARB_DOUT), .sync(ARB_SYNC_OUT), //.DDS_CLK_IN(DDS_OUT[15]), 
												.EXT_CLK_IN(ARB_EDDS_SIN), .ARB_CLK(ARB_CLK_OUT), /*.ARB_SELECTED(),*/ .write(NWE), .Addr_in(CPU_Addr), .CS(NCS), .DataBus(CPU_Data2));

assign ARB_CLK_TB=ARB_CLK_OUT;

ARB_DDS_SNC_SEL				SYNC_SEL(.Dout(SYNC_OUT), .Din1(FM_SYNC_OUT), .Din2(ARB_SYNC_OUT), .SEL(CTRL_WORD[19]), .Clock(CLK_107MHz))	;
ARB_DDS_OSEL					AD_DOUT_SEL(.Dout(DA9747_Data), .Din1(DDS_OUT_Temp01), .Din2(ARB_DOUT), .SEL(CTRL_WORD[19]), .Clock(CLK_214MHz))	;

BUFGMUX							AD_Clock_SEL(.O(DIFF_CLKIN), .I0(PSCLK214MHz_0D), .I1(~ARB_CLK_OUT), .S(CTRL_WORD[19]))	;
//assign	DIFF_CLKIN = CTRL_WORD[19] ? ARB_CLK_OUT : CLK_214MHz	;
//MUXCY									AD_Clock_SEL(.O(DIFF_CLKIN), .DI(CLK_214MHz), .CI(ARB_CLK_OUT), .S(CTRL_WORD[19]))	;

OBUFDS	#(.IOSTANDARD("DEFAULT"))	OBUFDS_LVDS(.O(DA9747_CLKP), .OB(DA9747_CLKN), .I(DIFF_CLKIN))	;



//synthesis attribute keep of CLK_6MHz is "true"
BUF	MODWAVE_CSBUF(.O(MODWAVE_CSbar), .I(CLK_6MHz))	;
//synthesis attribute keep of CLK_6MHz is "true"
BUF	MODWAVE_RWBUF(.O(MODWAVE_RWbar), .I(CLK_6MHz))	;


//assign	MOD_SOUT_SEL = {CTRL_WORD[30],  CTRL_WORD[29],  CTRL_WORD[28]}	;
Reg_Buf3bits						MSS_Module(.Dout(MOD_SOUT_SEL), .Din({CTRL_WORD[30],  CTRL_WORD[29],  CTRL_WORD[28]}), .Clock(CLK_107MHz), .Reset(Reset))	;
Reg_Buf1bits						Protect_Module(.Dout(OUT_PROTECT), .Din(CTRL_WORD[27]), .Clock(CLK_107MHz), .Reset(Reset))	;


CVG_DAC7821_AllSignals			CVG_DAC7821_Signals_Group(.CVG_DAC7821_Dataout(CVG_DAC7821_Data), .CVG_DAC7821_CSbarout(CVG_DAC7821_CSbar), .CVG_DAC7821_RWbarout(CVG_DAC7821_RWbar), .CVG_DAC7821_LD_CTRLout(CVG_DAC7821_LD_CTRL), .HC4051_Selector(HC4051_SELs),
																			.OFFSET_VU(DAC_OFFSET_VU), .DUTYS_VU(DAC_DUTYS_VU), .GAINV_VU(DAC_GAINV_VU), .SQVL_VU(DAC_SQVL_VU), .SQVT_VU(DAC_SQVT_VU), .SPARE_VU(DAC_SPARE_VU), 
																			.Clock_54MHz(CLK_54MHz), .Clock_6MHz(CLK_6MHz), .Reset(Reset))	;


endmodule	


