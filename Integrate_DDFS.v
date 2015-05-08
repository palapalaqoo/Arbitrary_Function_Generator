`timescale	1ns/1ps

module	Integrate_DDFS(Data_out, PCO, Data_in, Start_Phase_IN, BurstEN, Burst_IEG_AP_Sel, Clock, 
								Sel_SinTri, Triangle_Addrin, Triangle_Datain, TriRAM_WE, Triangle_Clock, Reset, EReset)	;

output	[15:0]	Data_out	;
wire	[15:0]	Data_out	;

output	PCO	;
wire	PCO	;


input	[47:0]	Data_in	;
wire	[47:0]	Data_in	;

input	[13:0]	Start_Phase_IN	;
wire	[13:0]	Start_Phase_IN	;

input	[9:0]	Triangle_Addrin	;
wire	[9:0]	Triangle_Addrin	;

input	[15:0]	Triangle_Datain	;
wire	[15:0]	Triangle_Datain	;

input	TriRAM_WE, Sel_SinTri	;
wire	TriRAM_WE, Sel_SinTri	;

input	Triangle_Clock	;
wire	Triangle_Clock	;

input	BurstEN	;
wire	BurstEN	;

input	Burst_IEG_AP_Sel	;
wire	Burst_IEG_AP_Sel	;

input	Clock, Reset, EReset	;
wire	Clock, Reset, EReset	;



wire	[13:0]	Addr_path, Addr_path00, Addr_path01, Addr_path02, 
					Addr_path03, Addr_path04, Addr_path05, ROM_Addr	; 
wire	[47:0]	Phase_Temp	;
wire	[15:0]	Sinusoid_Dout, Data_out00	;
wire	[15:0]	Triangle_Dout, Triangle_Dout00, Sinusoid_Dout00	;



Phase_Reg48B			Phase_Reg00(.Dout(Phase_Temp), .Din(Data_in), .Clock(Clock))	;
DDFS48bits				DDFS_ACC(.ROM_IN(Addr_path00), .PCO(PCO), .Phase_in(Phase_Temp), .Clock(Clock), .Reset(Reset))	;

BufReg14RB				RADDR_REG(.Dout(Addr_path01), .Din(Addr_path00), .Clock(Clock), .Reset(Reset))	;
Addition_14bits		PHAS_INCR(.Sum_out(Addr_path02), .Ain(Addr_path01), .Bin(Start_Phase_IN), .Clock(Clock), .Reset(EReset))	;
ADDR_Path				PHASE_ADP(.ADDR_OUT(Addr_path03), .ADDR_IN(Addr_path02), .Clock(Clock))	;
Phase_Mux14B			EXT_GATE_SEL(.Dout(Addr_path04), .Din1(Addr_path03), .Din2(Addr_path02), .Sel(Burst_IEG_AP_Sel), .Clock(Clock))	;

BufEReg14B				Hold_Reg(.Dout(Addr_path05), .Din1(Addr_path04), .Din2(Start_Phase_IN), .EN(Reset), .Clock(Clock))	;
Phase_Mux				PHAS_Mux(.Dout(Addr_path), .Din1(Addr_path01), .Din2(Addr_path05), .Sel(BurstEN), .Clock(Clock))	;

AddrBufTempM			ABTM_BLK(.Dout(ROM_Addr), .Din(Addr_path), .Clock(Clock))	;

ROM_Table				DDFS_LUT(.Data_out(Sinusoid_Dout), .Addr_in(ROM_Addr), .Clock(Clock), .EN(1'b1))	;
BufReg16B				Sinusoid_DB00(.Dout(Sinusoid_Dout00), .Din(Sinusoid_Dout), .Clock(Clock))	;


Triangle_RAM1K			Triangle_LUT(.doutb(Triangle_Dout), .clka(Triangle_Clock), .dina(Triangle_Datain), .addra(Triangle_Addrin), .wea(TriRAM_WE), .clkb(Clock), .addrb(ROM_Addr[13:4]));
BufReg16B				Triangle_DB00(.Dout(Triangle_Dout00), .Din(Triangle_Dout), .Clock(Clock))	;

MUX16Bits				Sin_Tri_SEL(.Dout(Data_out00), .Din1(Sinusoid_Dout00), .Din2(Triangle_Dout00), .Sel(Sel_SinTri), .Clock(Clock))	;
BufReg16B				Data_Buf00(.Dout(Data_out), .Din(Data_out00), .Clock(Clock))	;


endmodule	
