`timescale	1ns/1ps

module	Addition_14bits(Sum_out, Carry_out, Ain, Bin, Clock, Reset)	;

output	[13:0]	Sum_out	;
reg	[13:0]	Sum_out	;

output	Carry_out	;
reg	Carry_out	;

input	[13:0]	Ain, Bin	;
wire	[13:0]	Ain, Bin	;

input	Clock, Reset	;
wire	Clock, Reset	;

wire	[13:0]	Sum	;

wire	Carryout	;

wire	First_Cin	;
assign First_Cin = 1'b0	;


//This wire	is a carrier net for Stage
wire	Carry_Stage_1to2, Carry_Stage_2to3, Carry_Stage_3to4, Carry_Stage_4to5,
		Carry_Stage_5to6, Carry_Stage_6to7	;
		
		
		
//The architecture of pipeline for every Stage............................................................................................
wire	[1:0]	Stage1_AtoR00, Stage1_R00toR01, Stage1_R01toR02, Stage1_R02toR03, Stage1_R03toR04, Stage1_R04toR05	;

Addition_2bits	Stage1_add(.out_c(Stage1_AtoR00), .cout(Carry_Stage_1to2), .in_a(Ain[1:0]), .in_b(Bin[1:0]), .cin(First_Cin), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage1_Reg00(.D_out(Stage1_R00toR01), .D_in(Stage1_AtoR00), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage1_Reg01(.D_out(Stage1_R01toR02), .D_in(Stage1_R00toR01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage1_Reg02(.D_out(Stage1_R02toR03), .D_in(Stage1_R01toR02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage1_Reg03(.D_out(Stage1_R03toR04), .D_in(Stage1_R02toR03), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage1_Reg04(.D_out(Stage1_R04toR05), .D_in(Stage1_R03toR04), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage1_Reg05(.D_out(Sum[1:0]), .D_in(Stage1_R04toR05), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage2..............................................................................................
wire	[1:0]	Stage2_RAtoA, Stage2_RBtoA	;
wire	[1:0] Stage2_AtoR01, Stage2_R01toR02, Stage2_R02toR03, Stage2_R03toR04, Stage2_R04toR05	;

AddReg2bits		Stage2_RegA00(.D_out(Stage2_RAtoA), .D_in(Ain[3:2]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage2_RegB00(.D_out(Stage2_RBtoA), .D_in(Bin[3:2]), .Clock(Clock), .Reset(Reset))	;

Addition_2bits		Stage2_add(.out_c(Stage2_AtoR01), .cout(Carry_Stage_2to3), .in_a(Stage2_RAtoA), .in_b(Stage2_RBtoA), .cin(Carry_Stage_1to2), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage2_Reg01(.D_out(Stage2_R01toR02), .D_in(Stage2_AtoR01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage2_Reg02(.D_out(Stage2_R02toR03), .D_in(Stage2_R01toR02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage2_Reg03(.D_out(Stage2_R03toR04), .D_in(Stage2_R02toR03), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage2_Reg04(.D_out(Stage2_R04toR05), .D_in(Stage2_R03toR04), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage2_Reg05(.D_out(Sum[3:2]), .D_in(Stage2_R04toR05), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage3..............................................................................................
wire	[1:0]	Stage3_RA00toRA01, Stage3_RA01toA	;
wire	[1:0] Stage3_RB00toRB01, Stage3_RB01toA	;
wire	[1:0]	Stage3_AtoR02, Stage3_R02toR03, Stage3_R03toR04, Stage3_R04toR05	; 

AddReg2bits		Stage3_RegA00(.D_out(Stage3_RA00toRA01), .D_in(Ain[5:4]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage3_RegA01(.D_out(Stage3_RA01toA), .D_in(Stage3_RA00toRA01), .Clock(Clock), .Reset(Reset))	;

AddReg2bits		Stage3_RegB00(.D_out(Stage3_RB00toRB01), .D_in(Bin[5:4]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage3_RegB01(.D_out(Stage3_RB01toA), .D_in(Stage3_RB00toRB01), .Clock(Clock), .Reset(Reset))	;

Addition_2bits		Stage3_add(.out_c(Stage3_AtoR02), .cout(Carry_Stage_3to4), .in_a(Stage3_RA01toA), .in_b(Stage3_RB01toA), .cin(Carry_Stage_2to3), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage3_Reg02(.D_out(Stage3_R02toR03), .D_in(Stage3_AtoR02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage3_Reg03(.D_out(Stage3_R03toR04), .D_in(Stage3_R02toR03), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage3_Reg04(.D_out(Stage3_R04toR05), .D_in(Stage3_R03toR04), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage3_Reg05(.D_out(Sum[5:4]), .D_in(Stage3_R04toR05), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage4..............................................................................................
wire	[1:0]	Stage4_RA00toRA01, Stage4_RA01toRA02, Stage4_RA02toA	;
wire	[1:0] Stage4_RB00toRB01, Stage4_RB01toRB02, Stage4_RB02toA	;
wire	[1:0]	Stage4_AtoR03, Stage4_R03toR04, Stage4_R04toR05	;

AddReg2bits		Stage4_RegA00(.D_out(Stage4_RA00toRA01), .D_in(Ain[7:6]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage4_RegA01(.D_out(Stage4_RA01toRA02), .D_in(Stage4_RA00toRA01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage4_RegA02(.D_out(Stage4_RA02toA), .D_in(Stage4_RA01toRA02), .Clock(Clock), .Reset(Reset))	;

AddReg2bits		Stage4_RegB00(.D_out(Stage4_RB00toRB01), .D_in(Bin[7:6]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage4_RegB01(.D_out(Stage4_RB01toRB02), .D_in(Stage4_RB00toRB01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage4_RegB02(.D_out(Stage4_RB02toA), .D_in(Stage4_RB01toRB02), .Clock(Clock), .Reset(Reset))	;

Addition_2bits		Stage4_add(.out_c(Stage4_AtoR03), .cout(Carry_Stage_4to5), .in_a(Stage4_RA02toA), .in_b(Stage4_RB02toA), .cin(Carry_Stage_3to4), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage4_Reg03(.D_out(Stage4_R03toR04), .D_in(Stage4_AtoR03), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage4_Reg04(.D_out(Stage4_R04toR05), .D_in(Stage4_R03toR04), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage4_Reg05(.D_out(Sum[7:6]), .D_in(Stage4_R04toR05), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage5..............................................................................................
wire	[1:0]	Stage5_RA00toRA01, Stage5_RA01toRA02, Stage5_RA02toRA03, Stage5_RA03toA	;
wire	[1:0]	Stage5_RB00toRB01, Stage5_RB01toRB02, Stage5_RB02toRB03, Stage5_RB03toA	;
wire	[1:0]	Stage5_AtoR04, Stage5_R04toR05	;

AddReg2bits		Stage5_RegA00(.D_out(Stage5_RA00toRA01), .D_in(Ain[9:8]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage5_RegA01(.D_out(Stage5_RA01toRA02), .D_in(Stage5_RA00toRA01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage5_RegA02(.D_out(Stage5_RA02toRA03), .D_in(Stage5_RA01toRA02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage5_RegA03(.D_out(Stage5_RA03toA), .D_in(Stage5_RA02toRA03), .Clock(Clock), .Reset(Reset))	;

AddReg2bits		Stage5_RegB00(.D_out(Stage5_RB00toRB01), .D_in(Bin[9:8]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage5_RegB01(.D_out(Stage5_RB01toRB02), .D_in(Stage5_RB00toRB01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage5_RegB02(.D_out(Stage5_RB02toRB03), .D_in(Stage5_RB01toRB02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage5_RegB03(.D_out(Stage5_RB03toA), .D_in(Stage5_RB02toRB03), .Clock(Clock), .Reset(Reset))	;


Addition_2bits		Stage5_add(.out_c(Stage5_AtoR04), .cout(Carry_Stage_5to6), .in_a(Stage5_RA03toA), .in_b(Stage5_RB03toA), .cin(Carry_Stage_4to5), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage5_Reg04(.D_out(Stage5_R04toR05), .D_in(Stage5_AtoR04), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage5_Reg05(.D_out(Sum[9:8]), .D_in(Stage5_R04toR05), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage6..............................................................................................
wire	[1:0]	Stage6_RA00toRA01, Stage6_RA01toRA02, Stage6_RA02toRA03, Stage6_RA03toRA04, Stage6_RA04toA	;
wire	[1:0]	Stage6_RB00toRB01, Stage6_RB01toRB02, Stage6_RB02toRB03, Stage6_RB03toRB04, Stage6_RB04toA	;
wire	[1:0]	Stage6_AtoR05	;

AddReg2bits		Stage6_RegA00(.D_out(Stage6_RA00toRA01), .D_in(Ain[11:10]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_RegA01(.D_out(Stage6_RA01toRA02), .D_in(Stage6_RA00toRA01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_RegA02(.D_out(Stage6_RA02toRA03), .D_in(Stage6_RA01toRA02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_RegA03(.D_out(Stage6_RA03toRA04), .D_in(Stage6_RA02toRA03), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_RegA04(.D_out(Stage6_RA04toA), .D_in(Stage6_RA03toRA04), .Clock(Clock), .Reset(Reset))	;

AddReg2bits		Stage6_RegB00(.D_out(Stage6_RB00toRB01), .D_in(Bin[11:10]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_RegB01(.D_out(Stage6_RB01toRB02), .D_in(Stage6_RB00toRB01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_RegB02(.D_out(Stage6_RB02toRB03), .D_in(Stage6_RB01toRB02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_RegB03(.D_out(Stage6_RB03toRB04), .D_in(Stage6_RB02toRB03), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_RegB04(.D_out(Stage6_RB04toA), .D_in(Stage6_RB03toRB04), .Clock(Clock), .Reset(Reset))	;

Addition_2bits		Stage6_add(.out_c(Stage6_AtoR05), .cout(Carry_Stage_6to7), .in_a(Stage6_RA04toA), .in_b(Stage6_RB04toA), .cin(Carry_Stage_5to6), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage6_Reg05(.D_out(Sum[11:10]), .D_in(Stage6_AtoR05), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage7..............................................................................................
wire	[1:0]	Stage7_RA00toRA01, Stage7_RA01toRA02, Stage7_RA02toRA03, Stage7_RA03toRA04, Stage7_RA04toRA05, Stage7_RA05toA	;
wire	[1:0]	Stage7_RB00toRB01, Stage7_RB01toRB02, Stage7_RB02toRB03, Stage7_RB03toRB04, Stage7_RB04toRB05, Stage7_RB05toA	;

AddReg2bits		Stage7_RegA00(.D_out(Stage7_RA00toRA01), .D_in(Ain[13:12]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegA01(.D_out(Stage7_RA01toRA02), .D_in(Stage7_RA00toRA01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegA02(.D_out(Stage7_RA02toRA03), .D_in(Stage7_RA01toRA02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegA03(.D_out(Stage7_RA03toRA04), .D_in(Stage7_RA02toRA03), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegA04(.D_out(Stage7_RA04toRA05), .D_in(Stage7_RA03toRA04), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegA05(.D_out(Stage7_RA05toA), .D_in(Stage7_RA04toRA05), .Clock(Clock), .Reset(Reset))	;

AddReg2bits		Stage7_RegB00(.D_out(Stage7_RB00toRB01), .D_in(Bin[13:12]), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegB01(.D_out(Stage7_RB01toRB02), .D_in(Stage7_RB00toRB01), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegB02(.D_out(Stage7_RB02toRB03), .D_in(Stage7_RB01toRB02), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegB03(.D_out(Stage7_RB03toRB04), .D_in(Stage7_RB02toRB03), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegB04(.D_out(Stage7_RB04toRB05), .D_in(Stage7_RB03toRB04), .Clock(Clock), .Reset(Reset))	;
AddReg2bits		Stage7_RegB05(.D_out(Stage7_RB05toA), .D_in(Stage7_RB04toRB05), .Clock(Clock), .Reset(Reset))	;

Addition_2bits		Stage7_add(.out_c(Sum[13:12]), .cout(Carryout), .in_a(Stage7_RA05toA), .in_b(Stage7_RB05toA), .cin(Carry_Stage_6to7), .Clock(Clock), .Reset(Reset))	;



always	@(posedge	Clock)
	begin
		Sum_out <= Sum	;
		Carry_out <= Carryout	;
	end
	
endmodule	

