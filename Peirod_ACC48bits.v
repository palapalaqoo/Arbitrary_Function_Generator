`timescale	1ns/1ps

module	Period_ACC48bits(SUM, Period_Carry_OUT, Ain, EN, Clock, Reset)	;

output	[11:0]	SUM	;
wire	[11:0]	SUM	;

output	Period_Carry_OUT	;
wire	Period_Carry_OUT	;

input	[47:0]	Ain	;
wire	[47:0]	Ain	;

input	EN	;
wire	EN	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	First_Cin	;
assign First_Cin = 1'b0	;



//This wire	is a carrier net for Stage
wire	Carry_Stage_1to2, Carry_Stage_2to3, Carry_Stage_3to4, Carry_Stage_4to5,
		Carry_Stage_5to6, Carry_Stage_6to7, Carry_Stage_7to8, Carry_Stage_8to9,
		Carry_Stage_9to10, Carry_Stage_10to11, Carry_Stage_11to12, Carry_Stage_12to13,
		Carry_Stage_13to14, Carry_Stage_14to15, Carry_Stage_15to16,Carry_Stage_16to17,
		Carry_Stage_18to19, Carry_Stage_19to20, Carry_Stage_20to21,Carry_Stage_21to22,
		Carry_Stage_22to23, Carry_Stage_23to24	;
		
		
		
//The architecture of pipeline for every Stage............................................................................................


Period_acc_2bits	Stage1_acc(/*out_c,*/ .cout(Carry_Stage_1to2), .in_a(Ain[1:0]), .cin(First_Cin), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage2..............................................................................................
wire	[1:0]	Stage2_RtoA	;

Period_Reg2bits		Stage2_Reg00(.D_out(Stage2_RtoA), .D_in(Ain[3:2]), .Clock(Clock))	;
Period_acc_2bits		Stage2_acc(/*out_c,*/ .cout(Carry_Stage_2to3), .in_a(Stage2_RtoA), .cin(Carry_Stage_1to2), .EN(EN), .Clock(Clock), .Reset(Reset))	;



//Declaration connector wire for Stage3..............................................................................................
wire	[1:0]	Stage3_R00toR01, Stage3_R01toA	;

Period_Reg2bits		Stage3_Reg00(.D_out(Stage3_R00toR01), .D_in(Ain[5:4]), .Clock(Clock))	;
Period_Reg2bits		Stage3_Reg01(.D_out(Stage3_R01toA), .D_in(Stage3_R00toR01), .Clock(Clock))	;
Period_acc_2bits		Stage3_acc(/*out_c,*/ .cout(Carry_Stage_3to4), .in_a(Stage3_R01toA), .cin(Carry_Stage_2to3), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage4..............................................................................................
wire	[1:0]	Stage4_R00toR01, Stage4_R01toR02, Stage4_R02toA	;

Period_Reg2bits		Stage4_Reg00(.D_out(Stage4_R00toR01), .D_in(Ain[7:6]), .Clock(Clock))	;
Period_Reg2bits		Stage4_Reg01(.D_out(Stage4_R01toR02), .D_in(Stage4_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage4_Reg02(.D_out(Stage4_R02toA), .D_in(Stage4_R01toR02), .Clock(Clock))	;
Period_acc_2bits		Stage4_acc(/*out_c,*/ .cout(Carry_Stage_4to5), .in_a(Stage4_R02toA), .cin(Carry_Stage_3to4), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage5..............................................................................................
wire	[1:0]	Stage5_R00toR01, Stage5_R01toR02, Stage5_R02toR03, Stage5_R03toA	;

Period_Reg2bits		Stage5_Reg00(.D_out(Stage5_R00toR01), .D_in(Ain[9:8]), .Clock(Clock))	;
Period_Reg2bits		Stage5_Reg01(.D_out(Stage5_R01toR02), .D_in(Stage5_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage5_Reg02(.D_out(Stage5_R02toR03), .D_in(Stage5_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage5_Reg03(.D_out(Stage5_R03toA), .D_in(Stage5_R02toR03), .Clock(Clock))	;
Period_acc_2bits		Stage5_acc(/*out_c,*/ .cout(Carry_Stage_5to6), .in_a(Stage5_R03toA), .cin(Carry_Stage_4to5), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage6..............................................................................................
wire	[1:0]	Stage6_R00toR01, Stage6_R01toR02, Stage6_R02toR03, Stage6_R03toR04, Stage6_R04toA	;

Period_Reg2bits		Stage6_Reg00(.D_out(Stage6_R00toR01), .D_in(Ain[11:10]), .Clock(Clock))	;
Period_Reg2bits		Stage6_Reg01(.D_out(Stage6_R01toR02), .D_in(Stage6_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage6_Reg02(.D_out(Stage6_R02toR03), .D_in(Stage6_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage6_Reg03(.D_out(Stage6_R03toR04), .D_in(Stage6_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage6_Reg04(.D_out(Stage6_R04toA), .D_in(Stage6_R03toR04), .Clock(Clock))	;
Period_acc_2bits		Stage6_acc(/*out_c,*/ .cout(Carry_Stage_6to7), .in_a(Stage6_R04toA), .cin(Carry_Stage_5to6), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage7..............................................................................................
wire	[1:0]	Stage7_R00toR01, Stage7_R01toR02, Stage7_R02toR03, Stage7_R03toR04, Stage7_R04toR05, Stage7_R05toA	;

Period_Reg2bits		Stage7_Reg00(.D_out(Stage7_R00toR01), .D_in(Ain[13:12]), .Clock(Clock))	;
Period_Reg2bits		Stage7_Reg01(.D_out(Stage7_R01toR02), .D_in(Stage7_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage7_Reg02(.D_out(Stage7_R02toR03), .D_in(Stage7_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage7_Reg03(.D_out(Stage7_R03toR04), .D_in(Stage7_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage7_Reg04(.D_out(Stage7_R04toR05), .D_in(Stage7_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage7_Reg05(.D_out(Stage7_R05toA), .D_in(Stage7_R04toR05), .Clock(Clock))	;
Period_acc_2bits		Stage7_acc(/*out_c,*/ .cout(Carry_Stage_7to8), .in_a(Stage7_R05toA), .cin(Carry_Stage_6to7), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage8..............................................................................................
wire	[1:0]	Stage8_R00toR01, Stage8_R01toR02, Stage8_R02toR03, Stage8_R03toR04, Stage8_R04toR05, Stage8_R05toR06, Stage8_R06toA	;

Period_Reg2bits		Stage8_Reg00(.D_out(Stage8_R00toR01), .D_in(Ain[15:14]), .Clock(Clock))	;
Period_Reg2bits		Stage8_Reg01(.D_out(Stage8_R01toR02), .D_in(Stage8_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage8_Reg02(.D_out(Stage8_R02toR03), .D_in(Stage8_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage8_Reg03(.D_out(Stage8_R03toR04), .D_in(Stage8_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage8_Reg04(.D_out(Stage8_R04toR05), .D_in(Stage8_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage8_Reg05(.D_out(Stage8_R05toR06), .D_in(Stage8_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage8_Reg06(.D_out(Stage8_R06toA), .D_in(Stage8_R05toR06), .Clock(Clock))	;
Period_acc_2bits		Stage8_acc(/*out_c,*/ .cout(Carry_Stage_8to9), .in_a(Stage8_R06toA), .cin(Carry_Stage_7to8), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage9..............................................................................................
wire	[1:0]	Stage9_R00toR01, Stage9_R01toR02, Stage9_R02toR03, Stage9_R03toR04, Stage9_R04toR05, Stage9_R05toR06, Stage9_R06toR07,
				Stage9_R07toA	;

Period_Reg2bits		Stage9_Reg00(.D_out(Stage9_R00toR01), .D_in(Ain[17:16]), .Clock(Clock))	;
Period_Reg2bits		Stage9_Reg01(.D_out(Stage9_R01toR02), .D_in(Stage9_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage9_Reg02(.D_out(Stage9_R02toR03), .D_in(Stage9_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage9_Reg03(.D_out(Stage9_R03toR04), .D_in(Stage9_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage9_Reg04(.D_out(Stage9_R04toR05), .D_in(Stage9_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage9_Reg05(.D_out(Stage9_R05toR06), .D_in(Stage9_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage9_Reg06(.D_out(Stage9_R06toR07), .D_in(Stage9_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage9_Reg07(.D_out(Stage9_R07toA), .D_in(Stage9_R06toR07), .Clock(Clock))	;
Period_acc_2bits		Stage9_acc(/*out_c,*/ .cout(Carry_Stage_9to10), .in_a(Stage9_R07toA), .cin(Carry_Stage_8to9), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage10..............................................................................................
wire	[1:0]	Stage10_R00toR01, Stage10_R01toR02, Stage10_R02toR03, Stage10_R03toR04, Stage10_R04toR05, Stage10_R05toR06, Stage10_R06toR07,
				Stage10_R07toR08, Stage10_R08toA	;

Period_Reg2bits		Stage10_Reg00(.D_out(Stage10_R00toR01), .D_in(Ain[19:18]), .Clock(Clock))	;
Period_Reg2bits		Stage10_Reg01(.D_out(Stage10_R01toR02), .D_in(Stage10_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage10_Reg02(.D_out(Stage10_R02toR03), .D_in(Stage10_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage10_Reg03(.D_out(Stage10_R03toR04), .D_in(Stage10_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage10_Reg04(.D_out(Stage10_R04toR05), .D_in(Stage10_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage10_Reg05(.D_out(Stage10_R05toR06), .D_in(Stage10_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage10_Reg06(.D_out(Stage10_R06toR07), .D_in(Stage10_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage10_Reg07(.D_out(Stage10_R07toR08), .D_in(Stage10_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage10_Reg08(.D_out(Stage10_R08toA), .D_in(Stage10_R07toR08), .Clock(Clock))	;
Period_acc_2bits		Stage10_acc(/*out_c,*/ .cout(Carry_Stage_10to11), .in_a(Stage10_R08toA), .cin(Carry_Stage_9to10), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage11..............................................................................................
wire	[1:0]	Stage11_R00toR01, Stage11_R01toR02, Stage11_R02toR03, Stage11_R03toR04, Stage11_R04toR05, Stage11_R05toR06, Stage11_R06toR07,
				Stage11_R07toR08, Stage11_R08toR09, Stage11_R09toA	;

Period_Reg2bits		Stage11_Reg00(.D_out(Stage11_R00toR01), .D_in(Ain[21:20]), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg01(.D_out(Stage11_R01toR02), .D_in(Stage11_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg02(.D_out(Stage11_R02toR03), .D_in(Stage11_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg03(.D_out(Stage11_R03toR04), .D_in(Stage11_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg04(.D_out(Stage11_R04toR05), .D_in(Stage11_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg05(.D_out(Stage11_R05toR06), .D_in(Stage11_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg06(.D_out(Stage11_R06toR07), .D_in(Stage11_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg07(.D_out(Stage11_R07toR08), .D_in(Stage11_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg08(.D_out(Stage11_R08toR09), .D_in(Stage11_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage11_Reg09(.D_out(Stage11_R09toA), .D_in(Stage11_R08toR09), .Clock(Clock))	;
Period_acc_2bits		Stage11_acc(/*out_c,*/ .cout(Carry_Stage_11to12), .in_a(Stage11_R09toA), .cin(Carry_Stage_10to11), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage12..............................................................................................
wire	[1:0]	Stage12_R00toR01, Stage12_R01toR02, Stage12_R02toR03, Stage12_R03toR04, Stage12_R04toR05, Stage12_R05toR06, Stage12_R06toR07,
				Stage12_R07toR08, Stage12_R08toR09, Stage12_R09toR10, Stage12_R10toA	;

Period_Reg2bits		Stage12_Reg00(.D_out(Stage12_R00toR01), .D_in(Ain[23:22]), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg01(.D_out(Stage12_R01toR02), .D_in(Stage12_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg02(.D_out(Stage12_R02toR03), .D_in(Stage12_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg03(.D_out(Stage12_R03toR04), .D_in(Stage12_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg04(.D_out(Stage12_R04toR05), .D_in(Stage12_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg05(.D_out(Stage12_R05toR06), .D_in(Stage12_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg06(.D_out(Stage12_R06toR07), .D_in(Stage12_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg07(.D_out(Stage12_R07toR08), .D_in(Stage12_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg08(.D_out(Stage12_R08toR09), .D_in(Stage12_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg09(.D_out(Stage12_R09toR10), .D_in(Stage12_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage12_Reg10(.D_out(Stage12_R10toA), .D_in(Stage12_R09toR10), .Clock(Clock))	;
Period_acc_2bits		Stage12_acc(/*out_c,*/ .cout(Carry_Stage_12to13), .in_a(Stage12_R10toA), .cin(Carry_Stage_11to12), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage13..............................................................................................
wire	[1:0]	Stage13_R00toR01, Stage13_R01toR02, Stage13_R02toR03, Stage13_R03toR04, Stage13_R04toR05, Stage13_R05toR06, Stage13_R06toR07,
				Stage13_R07toR08, Stage13_R08toR09, Stage13_R09toR10, Stage13_R10toR11, Stage13_R11toA	;

Period_Reg2bits		Stage13_Reg00(.D_out(Stage13_R00toR01), .D_in(Ain[25:24]), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg01(.D_out(Stage13_R01toR02), .D_in(Stage13_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg02(.D_out(Stage13_R02toR03), .D_in(Stage13_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg03(.D_out(Stage13_R03toR04), .D_in(Stage13_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg04(.D_out(Stage13_R04toR05), .D_in(Stage13_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg05(.D_out(Stage13_R05toR06), .D_in(Stage13_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg06(.D_out(Stage13_R06toR07), .D_in(Stage13_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg07(.D_out(Stage13_R07toR08), .D_in(Stage13_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg08(.D_out(Stage13_R08toR09), .D_in(Stage13_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg09(.D_out(Stage13_R09toR10), .D_in(Stage13_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg10(.D_out(Stage13_R10toR11), .D_in(Stage13_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage13_Reg11(.D_out(Stage13_R11toA), .D_in(Stage13_R10toR11), .Clock(Clock))	;
Period_acc_2bits		Stage13_acc(/*out_c,*/ .cout(Carry_Stage_13to14), .in_a(Stage13_R11toA), .cin(Carry_Stage_12to13), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage14..............................................................................................
wire	[1:0]	Stage14_R00toR01, Stage14_R01toR02, Stage14_R02toR03, Stage14_R03toR04, Stage14_R04toR05, Stage14_R05toR06, Stage14_R06toR07,
				Stage14_R07toR08, Stage14_R08toR09, Stage14_R09toR10, Stage14_R10toR11, Stage14_R11toR12, Stage14_R12toA	;

Period_Reg2bits		Stage14_Reg00(.D_out(Stage14_R00toR01), .D_in(Ain[27:26]), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg01(.D_out(Stage14_R01toR02), .D_in(Stage14_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg02(.D_out(Stage14_R02toR03), .D_in(Stage14_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg03(.D_out(Stage14_R03toR04), .D_in(Stage14_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg04(.D_out(Stage14_R04toR05), .D_in(Stage14_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg05(.D_out(Stage14_R05toR06), .D_in(Stage14_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg06(.D_out(Stage14_R06toR07), .D_in(Stage14_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg07(.D_out(Stage14_R07toR08), .D_in(Stage14_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg08(.D_out(Stage14_R08toR09), .D_in(Stage14_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg09(.D_out(Stage14_R09toR10), .D_in(Stage14_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg10(.D_out(Stage14_R10toR11), .D_in(Stage14_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg11(.D_out(Stage14_R11toR12), .D_in(Stage14_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage14_Reg12(.D_out(Stage14_R12toA), .D_in(Stage14_R11toR12), .Clock(Clock))	;
Period_acc_2bits		Stage14_acc(/*out_c,*/ .cout(Carry_Stage_14to15), .in_a(Stage14_R12toA), .cin(Carry_Stage_13to14), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage15..............................................................................................
wire	[1:0]	Stage15_R00toR01, Stage15_R01toR02, Stage15_R02toR03, Stage15_R03toR04, Stage15_R04toR05, Stage15_R05toR06, Stage15_R06toR07,
				Stage15_R07toR08, Stage15_R08toR09, Stage15_R09toR10, Stage15_R10toR11, Stage15_R11toR12, Stage15_R12toR13, Stage15_R13toA	;

Period_Reg2bits		Stage15_Reg00(.D_out(Stage15_R00toR01), .D_in(Ain[29:28]), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg01(.D_out(Stage15_R01toR02), .D_in(Stage15_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg02(.D_out(Stage15_R02toR03), .D_in(Stage15_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg03(.D_out(Stage15_R03toR04), .D_in(Stage15_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg04(.D_out(Stage15_R04toR05), .D_in(Stage15_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg05(.D_out(Stage15_R05toR06), .D_in(Stage15_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg06(.D_out(Stage15_R06toR07), .D_in(Stage15_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg07(.D_out(Stage15_R07toR08), .D_in(Stage15_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg08(.D_out(Stage15_R08toR09), .D_in(Stage15_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg09(.D_out(Stage15_R09toR10), .D_in(Stage15_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg10(.D_out(Stage15_R10toR11), .D_in(Stage15_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg11(.D_out(Stage15_R11toR12), .D_in(Stage15_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg12(.D_out(Stage15_R12toR13), .D_in(Stage15_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage15_Reg13(.D_out(Stage15_R13toA), .D_in(Stage15_R12toR13), .Clock(Clock))	;
Period_acc_2bits		Stage15_acc(/*out_c,*/ .cout(Carry_Stage_15to16), .in_a(Stage15_R13toA), .cin(Carry_Stage_14to15), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage16..............................................................................................
wire	[1:0]	Stage16_R00toR01, Stage16_R01toR02, Stage16_R02toR03, Stage16_R03toR04, Stage16_R04toR05, Stage16_R05toR06, Stage16_R06toR07,
				Stage16_R07toR08, Stage16_R08toR09, Stage16_R09toR10, Stage16_R10toR11, Stage16_R11toR12, Stage16_R12toR13, Stage16_R13toR14,
				Stage16_R14toA	;

Period_Reg2bits		Stage16_Reg00(.D_out(Stage16_R00toR01), .D_in(Ain[31:30]), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg01(.D_out(Stage16_R01toR02), .D_in(Stage16_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg02(.D_out(Stage16_R02toR03), .D_in(Stage16_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg03(.D_out(Stage16_R03toR04), .D_in(Stage16_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg04(.D_out(Stage16_R04toR05), .D_in(Stage16_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg05(.D_out(Stage16_R05toR06), .D_in(Stage16_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg06(.D_out(Stage16_R06toR07), .D_in(Stage16_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg07(.D_out(Stage16_R07toR08), .D_in(Stage16_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg08(.D_out(Stage16_R08toR09), .D_in(Stage16_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg09(.D_out(Stage16_R09toR10), .D_in(Stage16_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg10(.D_out(Stage16_R10toR11), .D_in(Stage16_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg11(.D_out(Stage16_R11toR12), .D_in(Stage16_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg12(.D_out(Stage16_R12toR13), .D_in(Stage16_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg13(.D_out(Stage16_R13toR14), .D_in(Stage16_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage16_Reg14(.D_out(Stage16_R14toA), .D_in(Stage16_R13toR14), .Clock(Clock))	;
Period_acc_2bits		Stage16_acc(/*out_c,*/ .cout(Carry_Stage_16to17), .in_a(Stage16_R14toA), .cin(Carry_Stage_15to16), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage17..............................................................................................
wire	[1:0]	Stage17_R00toR01, Stage17_R01toR02, Stage17_R02toR03, Stage17_R03toR04, Stage17_R04toR05, Stage17_R05toR06, Stage17_R06toR07,
				Stage17_R07toR08, Stage17_R08toR09, Stage17_R09toR10, Stage17_R10toR11, Stage17_R11toR12, Stage17_R12toR13, Stage17_R13toR14,
				Stage17_R14toR15, Stage17_R15toA	;

Period_Reg2bits		Stage17_Reg00(.D_out(Stage17_R00toR01), .D_in(Ain[33:32]), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg01(.D_out(Stage17_R01toR02), .D_in(Stage17_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg02(.D_out(Stage17_R02toR03), .D_in(Stage17_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg03(.D_out(Stage17_R03toR04), .D_in(Stage17_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg04(.D_out(Stage17_R04toR05), .D_in(Stage17_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg05(.D_out(Stage17_R05toR06), .D_in(Stage17_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg06(.D_out(Stage17_R06toR07), .D_in(Stage17_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg07(.D_out(Stage17_R07toR08), .D_in(Stage17_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg08(.D_out(Stage17_R08toR09), .D_in(Stage17_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg09(.D_out(Stage17_R09toR10), .D_in(Stage17_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg10(.D_out(Stage17_R10toR11), .D_in(Stage17_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg11(.D_out(Stage17_R11toR12), .D_in(Stage17_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg12(.D_out(Stage17_R12toR13), .D_in(Stage17_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg13(.D_out(Stage17_R13toR14), .D_in(Stage17_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg14(.D_out(Stage17_R14toR15), .D_in(Stage17_R13toR14), .Clock(Clock))	;
Period_Reg2bits		Stage17_Reg15(.D_out(Stage17_R15toA), .D_in(Stage17_R14toR15), .Clock(Clock))	;
Period_acc_2bits		Stage17_acc(/*out_c,*/ .cout(Carry_Stage_17to18), .in_a(Stage17_R15toA), .cin(Carry_Stage_16to17), .EN(EN), .Clock(Clock), .Reset(Reset))	;


//Declaration connector wire for Stage18..............................................................................................
wire	[1:0]	Stage18_R00toR01, Stage18_R01toR02, Stage18_R02toR03, Stage18_R03toR04, Stage18_R04toR05, Stage18_R05toR06, Stage18_R06toR07,
				Stage18_R07toR08, Stage18_R08toR09, Stage18_R09toR10, Stage18_R10toR11, Stage18_R11toR12, Stage18_R12toR13, Stage18_R13toR14,
				Stage18_R14toR15, Stage18_R15toR16, Stage18_R16toA/*, Stage18_AtoR17, Stage18_R17toR18, Stage18_R18toR19, Stage18_R19toR20, 
				Stage18_R20toR21, Stage18_R21toR22*/	;

Period_Reg2bits		Stage18_Reg00(.D_out(Stage18_R00toR01), .D_in(Ain[35:34]), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg01(.D_out(Stage18_R01toR02), .D_in(Stage18_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg02(.D_out(Stage18_R02toR03), .D_in(Stage18_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg03(.D_out(Stage18_R03toR04), .D_in(Stage18_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg04(.D_out(Stage18_R04toR05), .D_in(Stage18_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg05(.D_out(Stage18_R05toR06), .D_in(Stage18_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg06(.D_out(Stage18_R06toR07), .D_in(Stage18_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg07(.D_out(Stage18_R07toR08), .D_in(Stage18_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg08(.D_out(Stage18_R08toR09), .D_in(Stage18_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg09(.D_out(Stage18_R09toR10), .D_in(Stage18_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg10(.D_out(Stage18_R10toR11), .D_in(Stage18_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg11(.D_out(Stage18_R11toR12), .D_in(Stage18_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg12(.D_out(Stage18_R12toR13), .D_in(Stage18_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg13(.D_out(Stage18_R13toR14), .D_in(Stage18_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg14(.D_out(Stage18_R14toR15), .D_in(Stage18_R13toR14), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg15(.D_out(Stage18_R15toR16), .D_in(Stage18_R14toR15), .Clock(Clock))	;
Period_Reg2bits		Stage18_Reg16(.D_out(Stage18_R16toA), .D_in(Stage18_R15toR16), .Clock(Clock))	;
Period_acc_2bits		Stage18_acc(/*.out_c(Stage18_AtoR17),*/ .cout(Carry_Stage_18to19), .in_a(Stage18_R16toA), .cin(Carry_Stage_17to18), .EN(EN), .Clock(Clock), .Reset(Reset))	;
//Period_Reg2bits		Stage18_Reg17(.D_out(Stage18_R17toR18), .D_in(Stage18_AtoR17), .Clock(Clock))	;
//Period_Reg2bits		Stage18_Reg18(.D_out(Stage18_R18toR19), .D_in(Stage18_R17toR18), .Clock(Clock))	;
//Period_Reg2bits		Stage18_Reg19(.D_out(Stage18_R19toR20), .D_in(Stage18_R18toR19), .Clock(Clock))	;
//Period_Reg2bits		Stage18_Reg20(.D_out(Stage18_R20toR21), .D_in(Stage18_R19toR20), .Clock(Clock))	;
//Period_Reg2bits		Stage18_Reg21(.D_out(Stage18_R21toR22), .D_in(Stage18_R20toR21), .Clock(Clock))	;
//Period_Reg2bits		Stage18_Reg22(.D_out(Sum[1:0]), .D_in(Stage18_R21toR22), .Clock(Clock))	;


//Declaration connector wire for Stage19..............................................................................................
wire	[1:0]	Stage19_R00toR01, Stage19_R01toR02, Stage19_R02toR03, Stage19_R03toR04, Stage19_R04toR05, Stage19_R05toR06, Stage19_R06toR07,
				Stage19_R07toR08, Stage19_R08toR09, Stage19_R09toR10, Stage19_R10toR11, Stage19_R11toR12, Stage19_R12toR13, Stage19_R13toR14,
				Stage19_R14toR15, Stage19_R15toR16, Stage19_R16toR17, Stage19_R17toA, Stage19_AtoR18, Stage19_R18toR19, Stage19_R19toR20, 
				Stage19_R20toR21,	Stage19_R21toR22	;

Period_Reg2bits		Stage19_Reg00(.D_out(Stage19_R00toR01), .D_in(Ain[37:36]), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg01(.D_out(Stage19_R01toR02), .D_in(Stage19_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg02(.D_out(Stage19_R02toR03), .D_in(Stage19_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg03(.D_out(Stage19_R03toR04), .D_in(Stage19_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg04(.D_out(Stage19_R04toR05), .D_in(Stage19_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg05(.D_out(Stage19_R05toR06), .D_in(Stage19_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg06(.D_out(Stage19_R06toR07), .D_in(Stage19_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg07(.D_out(Stage19_R07toR08), .D_in(Stage19_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg08(.D_out(Stage19_R08toR09), .D_in(Stage19_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg09(.D_out(Stage19_R09toR10), .D_in(Stage19_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg10(.D_out(Stage19_R10toR11), .D_in(Stage19_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg11(.D_out(Stage19_R11toR12), .D_in(Stage19_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg12(.D_out(Stage19_R12toR13), .D_in(Stage19_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg13(.D_out(Stage19_R13toR14), .D_in(Stage19_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg14(.D_out(Stage19_R14toR15), .D_in(Stage19_R13toR14), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg15(.D_out(Stage19_R15toR16), .D_in(Stage19_R14toR15), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg16(.D_out(Stage19_R16toR17), .D_in(Stage19_R15toR16), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg17(.D_out(Stage19_R17toA), .D_in(Stage19_R16toR17), .Clock(Clock))	;
Period_acc_2bits		Stage19_acc(.out_c(Stage19_AtoR18), .cout(Carry_Stage_19to20), .in_a(Stage19_R17toA), .cin(Carry_Stage_18to19), .EN(EN), .Clock(Clock), .Reset(Reset))	;
Period_Reg2bits		Stage19_Reg18(.D_out(Stage19_R18toR19), .D_in(Stage19_AtoR18), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg19(.D_out(Stage19_R19toR20), .D_in(Stage19_R18toR19), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg20(.D_out(Stage19_R20toR21), .D_in(Stage19_R19toR20), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg21(.D_out(Stage19_R21toR22), .D_in(Stage19_R20toR21), .Clock(Clock))	;
Period_Reg2bits		Stage19_Reg22(.D_out(SUM[1:0]), .D_in(Stage19_R21toR22), .Clock(Clock))	;


//Declaration connector wire for Stage20..............................................................................................
wire	[1:0]	Stage20_R00toR01, Stage20_R01toR02, Stage20_R02toR03, Stage20_R03toR04, Stage20_R04toR05, Stage20_R05toR06, Stage20_R06toR07,
				Stage20_R07toR08, Stage20_R08toR09, Stage20_R09toR10, Stage20_R10toR11, Stage20_R11toR12, Stage20_R12toR13, Stage20_R13toR14,
				Stage20_R14toR15, Stage20_R15toR16, Stage20_R16toR17, Stage20_R17toR18, Stage20_R18toA, Stage20_AtoR19, Stage20_R19toR20, 
				Stage20_R20toR21,	Stage20_R21toR22	;

Period_Reg2bits		Stage20_Reg00(.D_out(Stage20_R00toR01), .D_in(Ain[39:38]), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg01(.D_out(Stage20_R01toR02), .D_in(Stage20_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg02(.D_out(Stage20_R02toR03), .D_in(Stage20_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg03(.D_out(Stage20_R03toR04), .D_in(Stage20_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg04(.D_out(Stage20_R04toR05), .D_in(Stage20_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg05(.D_out(Stage20_R05toR06), .D_in(Stage20_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg06(.D_out(Stage20_R06toR07), .D_in(Stage20_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg07(.D_out(Stage20_R07toR08), .D_in(Stage20_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg08(.D_out(Stage20_R08toR09), .D_in(Stage20_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg09(.D_out(Stage20_R09toR10), .D_in(Stage20_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg10(.D_out(Stage20_R10toR11), .D_in(Stage20_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg11(.D_out(Stage20_R11toR12), .D_in(Stage20_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg12(.D_out(Stage20_R12toR13), .D_in(Stage20_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg13(.D_out(Stage20_R13toR14), .D_in(Stage20_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg14(.D_out(Stage20_R14toR15), .D_in(Stage20_R13toR14), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg15(.D_out(Stage20_R15toR16), .D_in(Stage20_R14toR15), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg16(.D_out(Stage20_R16toR17), .D_in(Stage20_R15toR16), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg17(.D_out(Stage20_R17toR18), .D_in(Stage20_R16toR17), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg18(.D_out(Stage20_R18toA), .D_in(Stage20_R17toR18), .Clock(Clock))	;
Period_acc_2bits		Stage20_acc(.out_c(Stage20_AtoR19), .cout(Carry_Stage_20to21), .in_a(Stage20_R18toA), .cin(Carry_Stage_19to20), .EN(EN), .Clock(Clock), .Reset(Reset))	;
Period_Reg2bits		Stage20_Reg19(.D_out(Stage20_R19toR20), .D_in(Stage20_AtoR19), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg20(.D_out(Stage20_R20toR21), .D_in(Stage20_R19toR20), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg21(.D_out(Stage20_R21toR22), .D_in(Stage20_R20toR21), .Clock(Clock))	;
Period_Reg2bits		Stage20_Reg22(.D_out(SUM[3:2]), .D_in(Stage20_R21toR22), .Clock(Clock))	;


//Declaration connector wire for Stage21..............................................................................................
wire	[1:0]	Stage21_R00toR01, Stage21_R01toR02, Stage21_R02toR03, Stage21_R03toR04, Stage21_R04toR05, Stage21_R05toR06, Stage21_R06toR07,
				Stage21_R07toR08, Stage21_R08toR09, Stage21_R09toR10, Stage21_R10toR11, Stage21_R11toR12, Stage21_R12toR13, Stage21_R13toR14,
				Stage21_R14toR15, Stage21_R15toR16, Stage21_R16toR17, Stage21_R17toR18, Stage21_R18toR19, Stage21_AtoR20, Stage21_R19toA, 
				Stage21_R20toR21,	Stage21_R21toR22	;

Period_Reg2bits		Stage21_Reg00(.D_out(Stage21_R00toR01), .D_in(Ain[41:40]), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg01(.D_out(Stage21_R01toR02), .D_in(Stage21_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg02(.D_out(Stage21_R02toR03), .D_in(Stage21_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg03(.D_out(Stage21_R03toR04), .D_in(Stage21_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg04(.D_out(Stage21_R04toR05), .D_in(Stage21_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg05(.D_out(Stage21_R05toR06), .D_in(Stage21_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg06(.D_out(Stage21_R06toR07), .D_in(Stage21_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg07(.D_out(Stage21_R07toR08), .D_in(Stage21_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg08(.D_out(Stage21_R08toR09), .D_in(Stage21_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg09(.D_out(Stage21_R09toR10), .D_in(Stage21_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg10(.D_out(Stage21_R10toR11), .D_in(Stage21_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg11(.D_out(Stage21_R11toR12), .D_in(Stage21_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg12(.D_out(Stage21_R12toR13), .D_in(Stage21_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg13(.D_out(Stage21_R13toR14), .D_in(Stage21_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg14(.D_out(Stage21_R14toR15), .D_in(Stage21_R13toR14), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg15(.D_out(Stage21_R15toR16), .D_in(Stage21_R14toR15), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg16(.D_out(Stage21_R16toR17), .D_in(Stage21_R15toR16), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg17(.D_out(Stage21_R17toR18), .D_in(Stage21_R16toR17), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg18(.D_out(Stage21_R18toR19), .D_in(Stage21_R17toR18), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg19(.D_out(Stage21_R19toA), .D_in(Stage21_R18toR19), .Clock(Clock))	;
Period_acc_2bits		Stage21_acc(.out_c(Stage21_AtoR20), .cout(Carry_Stage_21to22), .in_a(Stage21_R19toA), .cin(Carry_Stage_20to21), .EN(EN), .Clock(Clock), .Reset(Reset))	;
Period_Reg2bits		Stage21_Reg20(.D_out(Stage21_R20toR21), .D_in(Stage21_AtoR20), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg21(.D_out(Stage21_R21toR22), .D_in(Stage21_R20toR21), .Clock(Clock))	;
Period_Reg2bits		Stage21_Reg22(.D_out(SUM[5:4]), .D_in(Stage21_R21toR22), .Clock(Clock))	;


//Declaration connector wire for Stage22..............................................................................................
wire	[1:0]	Stage22_R00toR01, Stage22_R01toR02, Stage22_R02toR03, Stage22_R03toR04, Stage22_R04toR05, Stage22_R05toR06, Stage22_R06toR07,
				Stage22_R07toR08, Stage22_R08toR09, Stage22_R09toR10, Stage22_R10toR11, Stage22_R11toR12, Stage22_R12toR13, Stage22_R13toR14,
				Stage22_R14toR15, Stage22_R15toR16, Stage22_R16toR17, Stage22_R17toR18, Stage22_R18toR19, Stage22_AtoR21, Stage22_R20toA, 
				Stage22_R19toR20,	Stage22_R21toR22	;

Period_Reg2bits		Stage22_Reg00(.D_out(Stage22_R00toR01), .D_in(Ain[43:42]), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg01(.D_out(Stage22_R01toR02), .D_in(Stage22_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg02(.D_out(Stage22_R02toR03), .D_in(Stage22_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg03(.D_out(Stage22_R03toR04), .D_in(Stage22_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg04(.D_out(Stage22_R04toR05), .D_in(Stage22_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg05(.D_out(Stage22_R05toR06), .D_in(Stage22_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg06(.D_out(Stage22_R06toR07), .D_in(Stage22_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg07(.D_out(Stage22_R07toR08), .D_in(Stage22_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg08(.D_out(Stage22_R08toR09), .D_in(Stage22_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg09(.D_out(Stage22_R09toR10), .D_in(Stage22_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg10(.D_out(Stage22_R10toR11), .D_in(Stage22_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg11(.D_out(Stage22_R11toR12), .D_in(Stage22_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg12(.D_out(Stage22_R12toR13), .D_in(Stage22_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg13(.D_out(Stage22_R13toR14), .D_in(Stage22_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg14(.D_out(Stage22_R14toR15), .D_in(Stage22_R13toR14), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg15(.D_out(Stage22_R15toR16), .D_in(Stage22_R14toR15), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg16(.D_out(Stage22_R16toR17), .D_in(Stage22_R15toR16), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg17(.D_out(Stage22_R17toR18), .D_in(Stage22_R16toR17), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg18(.D_out(Stage22_R18toR19), .D_in(Stage22_R17toR18), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg19(.D_out(Stage22_R19toR20), .D_in(Stage22_R18toR19), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg20(.D_out(Stage22_R20toA), .D_in(Stage22_R19toR20), .Clock(Clock))	;
Period_acc_2bits		Stage22_acc(.out_c(Stage22_AtoR21), .cout(Carry_Stage_22to23), .in_a(Stage22_R20toA), .cin(Carry_Stage_21to22), .EN(EN), .Clock(Clock), .Reset(Reset))	;
Period_Reg2bits		Stage22_Reg21(.D_out(Stage22_R21toR22), .D_in(Stage22_AtoR21), .Clock(Clock))	;
Period_Reg2bits		Stage22_Reg22(.D_out(SUM[7:6]), .D_in(Stage22_R21toR22), .Clock(Clock))	;


//Declaration connector wire for Stage23..............................................................................................
wire	[1:0]	Stage23_R00toR01, Stage23_R01toR02, Stage23_R02toR03, Stage23_R03toR04, Stage23_R04toR05, Stage23_R05toR06, Stage23_R06toR07,
				Stage23_R07toR08, Stage23_R08toR09, Stage23_R09toR10, Stage23_R10toR11, Stage23_R11toR12, Stage23_R12toR13, Stage23_R13toR14,
				Stage23_R14toR15, Stage23_R15toR16, Stage23_R16toR17, Stage23_R17toR18, Stage23_R18toR19, Stage23_R19toR20, Stage23_R20toR21, 
				Stage23_R21toA,	Stage23_AtoR22	;

Period_Reg2bits		Stage23_Reg00(.D_out(Stage23_R00toR01), .D_in(Ain[45:44]), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg01(.D_out(Stage23_R01toR02), .D_in(Stage23_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg02(.D_out(Stage23_R02toR03), .D_in(Stage23_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg03(.D_out(Stage23_R03toR04), .D_in(Stage23_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg04(.D_out(Stage23_R04toR05), .D_in(Stage23_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg05(.D_out(Stage23_R05toR06), .D_in(Stage23_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg06(.D_out(Stage23_R06toR07), .D_in(Stage23_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg07(.D_out(Stage23_R07toR08), .D_in(Stage23_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg08(.D_out(Stage23_R08toR09), .D_in(Stage23_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg09(.D_out(Stage23_R09toR10), .D_in(Stage23_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg10(.D_out(Stage23_R10toR11), .D_in(Stage23_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg11(.D_out(Stage23_R11toR12), .D_in(Stage23_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg12(.D_out(Stage23_R12toR13), .D_in(Stage23_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg13(.D_out(Stage23_R13toR14), .D_in(Stage23_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg14(.D_out(Stage23_R14toR15), .D_in(Stage23_R13toR14), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg15(.D_out(Stage23_R15toR16), .D_in(Stage23_R14toR15), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg16(.D_out(Stage23_R16toR17), .D_in(Stage23_R15toR16), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg17(.D_out(Stage23_R17toR18), .D_in(Stage23_R16toR17), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg18(.D_out(Stage23_R18toR19), .D_in(Stage23_R17toR18), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg19(.D_out(Stage23_R19toR20), .D_in(Stage23_R18toR19), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg20(.D_out(Stage23_R20toR21), .D_in(Stage23_R19toR20), .Clock(Clock))	;
Period_Reg2bits		Stage23_Reg21(.D_out(Stage23_R21toA), .D_in(Stage23_R20toR21), .Clock(Clock))	;
Period_acc_2bits		Stage23_acc(.out_c(Stage23_AtoR22), .cout(Carry_Stage_23to24), .in_a(Stage23_R21toA), .cin(Carry_Stage_22to23), .EN(EN), .Clock(Clock), .Reset(Reset))	;
Period_Reg2bits		Stage23_Reg22(.D_out(SUM[9:8]), .D_in(Stage23_AtoR22), .Clock(Clock))	;


//Declaration connector wire for Stage24..............................................................................................
wire	[1:0]	Stage24_R00toR01, Stage24_R01toR02, Stage24_R02toR03, Stage24_R03toR04, Stage24_R04toR05, Stage24_R05toR06, Stage24_R06toR07,
				Stage24_R07toR08, Stage24_R08toR09, Stage24_R09toR10, Stage24_R10toR11, Stage24_R11toR12, Stage24_R12toR13, Stage24_R13toR14,
				Stage24_R14toR15, Stage24_R15toR16, Stage24_R16toR17, Stage24_R17toR18, Stage24_R18toR19, Stage24_R19toR20, Stage24_R20toR21, 
				Stage24_R21toR22, Stage24_R22toA		;

Period_Reg2bits		Stage24_Reg00(.D_out(Stage24_R00toR01), .D_in(Ain[47:46]), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg01(.D_out(Stage24_R01toR02), .D_in(Stage24_R00toR01), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg02(.D_out(Stage24_R02toR03), .D_in(Stage24_R01toR02), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg03(.D_out(Stage24_R03toR04), .D_in(Stage24_R02toR03), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg04(.D_out(Stage24_R04toR05), .D_in(Stage24_R03toR04), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg05(.D_out(Stage24_R05toR06), .D_in(Stage24_R04toR05), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg06(.D_out(Stage24_R06toR07), .D_in(Stage24_R05toR06), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg07(.D_out(Stage24_R07toR08), .D_in(Stage24_R06toR07), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg08(.D_out(Stage24_R08toR09), .D_in(Stage24_R07toR08), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg09(.D_out(Stage24_R09toR10), .D_in(Stage24_R08toR09), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg10(.D_out(Stage24_R10toR11), .D_in(Stage24_R09toR10), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg11(.D_out(Stage24_R11toR12), .D_in(Stage24_R10toR11), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg12(.D_out(Stage24_R12toR13), .D_in(Stage24_R11toR12), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg13(.D_out(Stage24_R13toR14), .D_in(Stage24_R12toR13), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg14(.D_out(Stage24_R14toR15), .D_in(Stage24_R13toR14), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg15(.D_out(Stage24_R15toR16), .D_in(Stage24_R14toR15), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg16(.D_out(Stage24_R16toR17), .D_in(Stage24_R15toR16), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg17(.D_out(Stage24_R17toR18), .D_in(Stage24_R16toR17), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg18(.D_out(Stage24_R18toR19), .D_in(Stage24_R17toR18), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg19(.D_out(Stage24_R19toR20), .D_in(Stage24_R18toR19), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg20(.D_out(Stage24_R20toR21), .D_in(Stage24_R19toR20), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg21(.D_out(Stage24_R21toR22), .D_in(Stage24_R20toR21), .Clock(Clock))	;
Period_Reg2bits		Stage24_Reg22(.D_out(Stage24_R22toA), .D_in(Stage24_R21toR22), .Clock(Clock))	;
Period_acc_2bits		Stage24_acc(.out_c(SUM[11:10]), .cout(Period_Carry_OUT), .in_a(Stage24_R22toA), .cin(Carry_Stage_23to24), .EN(EN), .Clock(Clock), .Reset(Reset))	;


	
	
endmodule	

