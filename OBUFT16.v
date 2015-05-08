`timescale	1ns/1ps

module	OBUFT16(Dout, Din, Con_T)	;

output	[15:0]	Dout	;
wire	[15:0]	Dout	;

input	[15:0]	Din	;
wire	[15:0]	Din	;

input	Con_T	;
wire	Con_T	;



OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M0(.O(Dout[0]), .I(Din[0]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M1(.O(Dout[1]), .I(Din[1]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M2(.O(Dout[2]), .I(Din[2]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M3(.O(Dout[3]), .I(Din[3]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M4(.O(Dout[4]), .I(Din[4]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M5(.O(Dout[5]), .I(Din[5]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M6(.O(Dout[6]), .I(Din[6]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M7(.O(Dout[7]), .I(Din[7]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M8(.O(Dout[8]), .I(Din[8]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M9(.O(Dout[9]), .I(Din[9]), .T(Con_T))	;

OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M10(.O(Dout[10]), .I(Din[10]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M11(.O(Dout[11]), .I(Din[11]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M12(.O(Dout[12]), .I(Din[12]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M13(.O(Dout[13]), .I(Din[13]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M14(.O(Dout[14]), .I(Din[14]), .T(Con_T))	;
OBUFT	#(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))	OBUFT_M15(.O(Dout[15]), .I(Din[15]), .T(Con_T))	;

endmodule
