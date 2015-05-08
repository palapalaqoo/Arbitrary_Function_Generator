//Here Clock is use 107MHz.......................
`timescale	1ns/1ps

module	Decoder_DataCtrl(FPGA_INT_Data, Decode_DAout, OPCTRL, RAM4K_ADDR, RAM4K_DATA, RAM4K_WEA, CPUI_NWE, CPUI_NCS, CPUI_DATA, CPUI_ADDR, 
									CPUI_NRD, DEC_DAC7821_DECOUT, OPCTRL_V2, FPGA_INT_Data00, TriRAM1K_we, Bi_DataBus_Ctrl, Clock, Reset)	;

output	[15:0]	FPGA_INT_Data	;
wire	[15:0]	FPGA_INT_Data	;

output	[16:0]	Decode_DAout	;
wire	[16:0]	Decode_DAout	;

output	[11:0]	RAM4K_ADDR, RAM4K_DATA	;
wire	[11:0]	RAM4K_ADDR, RAM4K_DATA	;

output	RAM4K_WEA	;
wire	RAM4K_WEA	;

output	[31:0]	OPCTRL, OPCTRL_V2	;
wire	[31:0]	OPCTRL, OPCTRL_V2	;


output	[15:0]	FPGA_INT_Data00	;
//wire	[15:0]	FPGA_INT_Data00	;

output	TriRAM1K_we	;
wire	TriRAM1K_we	;

output	[11:0]	DEC_DAC7821_DECOUT	;
wire	[11:0]	DEC_DAC7821_DECOUT	;

output	Bi_DataBus_Ctrl	;
wire	Bi_DataBus_Ctrl	;

input	[25:0]	CPUI_ADDR	;
wire	[25:0]	CPUI_ADDR	;

input	[15:0]	CPUI_DATA	;
wire	[15:0]	CPUI_DATA	;

input	CPUI_NWE, CPUI_NCS, CPUI_NRD	;
wire	CPUI_NWE, CPUI_NCS, CPUI_NRD	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	[25:0]	FPGA_INT_ADDR	;
wire	[16:0]	Decode_DAoutT0	;
wire	[15:0]	FPGA_INT_Data00, FPGA_INT_Data01, FPGA_INT_Data02	;
wire	[11:0]	DAC7821_DECOUT_Temp	;




CPU_Data_Addr		CPU_Da_Ad(.FPGA_Data(FPGA_INT_Data00), .FPGA_Addr(FPGA_INT_ADDR), .CPU_NWE(CPUI_NWE), .CPU_NCS(CPUI_NCS), .CPU_NRD(CPUI_NRD), 
										.CPU_Data(CPUI_DATA), .CPU_Addr(CPUI_ADDR), .INOUT_CTRL(Bi_DataBus_Ctrl), .FPGA_Clock(Clock), .FPGA_Reset(Reset))	;
Decoder_Data		DEC_Data(.Code_out(Decode_DAoutT0), .Code_in(FPGA_INT_ADDR), .Clock(Clock))	;

DEC_DReg17B			DEC_DR00(.Dout(Decode_DAout), .Din(Decode_DAoutT0), .Clock(Clock))	;


DEC_FID16B			DEC_FID00(.Dout(FPGA_INT_Data01), .Din(FPGA_INT_Data00), .Clock(Clock))	;
DEC_FID16B			DEC_FID01(.Dout(FPGA_INT_Data02), .Din(FPGA_INT_Data01), .Clock(Clock))	;
DEC_FID16B			DEC_FID02(.Dout(FPGA_INT_Data), .Din(FPGA_INT_Data02), .Clock(Clock))	;



assign	RAM4K_DATA = FPGA_INT_Data00[11:0]	;
//assign	RAM4K_ADDR = FPGA_INT_ADDR[12:1]	;

BufReg12B			RAM4K_ABR00(.Dout(RAM4K_ADDR), .Din(FPGA_INT_ADDR[12:1]), .Clock(Clock))	;

FM_SW_RAM_DEC		DEC_RAM4K(.CONT_OUT(RAM4K_WEA), .Addr_IN(FPGA_INT_ADDR[25:13]), .Clock(Clock))	;
DEC_OP_CTRL			DEC_OPCTRL(.CTRL_OUT(OPCTRL), .ADDR_IN(FPGA_INT_ADDR), .DATA_IN(FPGA_INT_Data00), .Clock(Clock))	;
DEC_OP_CTRL2		DEC_OPCTRL_V2(.CTRL_OUT2(OPCTRL_V2), .ADDR_IN(FPGA_INT_ADDR), .DATA_IN(FPGA_INT_Data00), .Clock(Clock))	;

Triangle_RAM_DEC	DEC_TriRAM(.WN_OUT(TriRAM1K_we), .Addr_IN(FPGA_INT_ADDR[25:11]), .Clock(Clock))	;

//Date 20090702 addition in
DECODE_DAC7821		DEC_DAC7821(.DECODE_OUT(DAC7821_DECOUT_Temp), .ADDR_IN(FPGA_INT_ADDR), .Clock(Clock))	;
DEC_DAC7821_REG	DEC_DAC_CR(.Dout(DEC_DAC7821_DECOUT), .Din(DAC7821_DECOUT_Temp), .Clock(Clock))	;


endmodule
