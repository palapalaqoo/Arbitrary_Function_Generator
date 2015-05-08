`timescale	1ns/1ps

module	CVG_DAC7821_AllSignals(CVG_DAC7821_Dataout, CVG_DAC7821_CSbarout, CVG_DAC7821_RWbarout, CVG_DAC7821_LD_CTRLout, HC4051_Selector,
											OFFSET_VU, DUTYS_VU, GAINV_VU, SQVL_VU, SQVT_VU, SPARE_VU, Clock_54MHz, Clock_6MHz, Reset)	;
											

output	[11:0]	CVG_DAC7821_Dataout	;
wire	[11:0]	CVG_DAC7821_Dataout	;

output	CVG_DAC7821_CSbarout, CVG_DAC7821_RWbarout	;
wire	CVG_DAC7821_CSbarout, CVG_DAC7821_RWbarout	;

output	CVG_DAC7821_LD_CTRLout	;
wire	CVG_DAC7821_LD_CTRLout	;

output	[3:0] HC4051_Selector	;
wire	[3:0] HC4051_Selector	;


input	[11:0]	OFFSET_VU, DUTYS_VU, GAINV_VU, SQVL_VU, SQVT_VU, SPARE_VU	;
wire	[11:0]	OFFSET_VU, DUTYS_VU, GAINV_VU, SQVL_VU, SQVT_VU, SPARE_VU	;

input	Clock_54MHz, Clock_6MHz, Reset	;
wire	Clock_54MHz, Clock_6MHz, Reset	;




wire	CVG_DAC7821_CSbar_T, CVG_DAC7821_RWbar_T	;
wire	[11:0]	CVG_DAC7821_Data_T	;


DAC7821_SCANNER				DAC7821_CRTL_VOL(.Data_out(CVG_DAC7821_Data_T), .R_Wbar(CVG_DAC7821_RWbar_T), .CSbar(CVG_DAC7821_CSbar_T), .EN_CTRL(CVG_DAC7821_LD_CTRLout), 
															.DC_OFFSET_Vin(OFFSET_VU), .DUTY_S_Vin(DUTYS_VU), .GAIN_V_Vin(GAINV_VU), 
															.SQ_VL_Vin(SQVL_VU), .SQ_VT_Vin(SQVT_VU), .Spare_Vin(SPARE_VU), .HC4051_State_Sel(HC4051_Selector), 
															.Clock(Clock_6MHz), .Reset(Reset))	;


CVG_DAC7821_Data_DPATH		CVG_DAC7821_DPATH(.Dout(CVG_DAC7821_Dataout), .Din(CVG_DAC7821_Data_T), .Clock(Clock_54MHz), .Reset(Reset))	;
CVG_DAC7821_CSbar_DPATH		CVG_DAC7821_CSPATH(.Dout(CVG_DAC7821_CSbarout), .Din(CVG_DAC7821_CSbar_T), .Clock(Clock_54MHz), .Reset(Reset))	;
CVG_DAC7821_RWbar_DPATH		CVG_DAC7821_RWPATH(.Dout(CVG_DAC7821_RWbarout), .Din(CVG_DAC7821_RWbar_T), .Clock(Clock_54MHz), .Reset(Reset))	;


endmodule
