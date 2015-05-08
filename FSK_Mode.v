`timescale	1ns/1ps

module	FSK_Mode(FSK_Ctrl_out, FSK_EN_INT, FSK_EN_EXT, FSK_Value, FSK_EXT_SIG, Clock, Reset)	;

output	FSK_Ctrl_out	;
reg	FSK_Ctrl_out	;

input	[41:0]	FSK_Value	;
wire	[41:0]	FSK_Value	;

input	FSK_EXT_SIG	;
wire	FSK_EXT_SIG	;

input	FSK_EN_INT, FSK_EN_EXT	;
wire	FSK_EN_INT, FSK_EN_EXT	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	[9:0]	FSK_CRT_Addr	;
wire	FSK_Ctrl1	;
wire	[41:0]	FSK_Value_Temp	;
wire	FSK_EXT_SIGT	;
reg	FSK_CTRL_ST	;



BufReg42B				BR42B(.Dout(FSK_Value_Temp), .Din(FSK_Value), .Clock(Clock))	;
FSK_ACC42bits			FSK_ACC(.Sum_out(FSK_CRT_Addr), /*.Carry_out(CT_EN),*/ .Ain(FSK_Value_Temp), .EN(FSK_EN_INT), .Clock(Clock), .Reset(Reset))	;
FSK_Ctrl_ROMTable		FSK_CRT(.Ctrl_Value(FSK_Ctrl1), .Rate_in(FSK_CRT_Addr), .Clock(Clock))	;
//Carry_trigger	FSK_CT(.Dout(FSK_Ctrl2), .Tri_En(CT_EN), .Clock(Clock), .Reset(Reset))	;
FSK_EXTSIG_Reg1B		FSK_ES_Temp(.Dout(FSK_EXT_SIGT), .Din(FSK_EXT_SIG), .Clock(Clock))	;


always	@(posedge	Clock)
	begin
		if ( FSK_EN_EXT == 1'b0 )
			begin
				FSK_CTRL_ST <= FSK_Ctrl1	;
			end
		else
			begin
				FSK_CTRL_ST <= FSK_EXT_SIGT	;
			end
	end
	
always	@(posedge	Clock)
	begin
		FSK_Ctrl_out <= FSK_CTRL_ST	;
	end


endmodule


