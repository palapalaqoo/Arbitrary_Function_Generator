`timescale	1ns/1ps

module	AM_MUXCY16B(O, DI, CI, S)	;

output	[15:0]	O	;
wire	[15:0]	O	;

input	[15:0]	DI, CI	;
wire	[15:0]	DI, CI	;

input	S	;
wire	S	;


MUXCY		AM_MUXCY_B00(.O(O[0]), .DI(DI[0]), .CI(CI[0]), .S(S))	;
MUXCY		AM_MUXCY_B01(.O(O[1]), .DI(DI[1]), .CI(CI[1]), .S(S))	;
MUXCY		AM_MUXCY_B02(.O(O[2]), .DI(DI[2]), .CI(CI[2]), .S(S))	;
MUXCY		AM_MUXCY_B03(.O(O[3]), .DI(DI[3]), .CI(CI[3]), .S(S))	;
MUXCY		AM_MUXCY_B04(.O(O[4]), .DI(DI[4]), .CI(CI[4]), .S(S))	;

MUXCY		AM_MUXCY_B05(.O(O[5]), .DI(DI[5]), .CI(CI[5]), .S(S))	;
MUXCY		AM_MUXCY_B06(.O(O[6]), .DI(DI[6]), .CI(CI[6]), .S(S))	;
MUXCY		AM_MUXCY_B07(.O(O[7]), .DI(DI[7]), .CI(CI[7]), .S(S))	;
MUXCY		AM_MUXCY_B08(.O(O[8]), .DI(DI[8]), .CI(CI[8]), .S(S))	;
MUXCY		AM_MUXCY_B09(.O(O[9]), .DI(DI[9]), .CI(CI[9]), .S(S))	;

MUXCY		AM_MUXCY_B10(.O(O[10]), .DI(DI[10]), .CI(CI[10]), .S(S))	;
MUXCY		AM_MUXCY_B11(.O(O[11]), .DI(DI[11]), .CI(CI[11]), .S(S))	;
MUXCY		AM_MUXCY_B12(.O(O[12]), .DI(DI[12]), .CI(CI[12]), .S(S))	;
MUXCY		AM_MUXCY_B13(.O(O[13]), .DI(DI[13]), .CI(CI[13]), .S(S))	;
MUXCY		AM_MUXCY_B14(.O(O[14]), .DI(DI[14]), .CI(CI[14]), .S(S))	;

MUXCY		AM_MUXCY_B15(.O(O[15]), .DI(DI[15]), .CI(CI[15]), .S(S))	;

endmodule
