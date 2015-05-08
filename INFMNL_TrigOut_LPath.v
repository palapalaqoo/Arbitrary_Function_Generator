`timescale	1ns/1ps

module	INFMNL_TrigOut_LPath(Dout, Din, Sel, Clock)	;

output	Dout	;
wire	Dout	;

input	Din	;
wire	Din	;

input	Sel	;
wire	Sel	;

input	Clock	;
wire	Clock	;


wire	LPWIRE00, LPWIRE01, LPWIRE02, LPWIRE03, LPWIRE04, LPWIRE05, LPWIRE06, LPWIRE07, LPWIRE08, LPWIRE09,
		LPWIRE10, LPWIRE11, LPWIRE12, LPWIRE13, LPWIRE14, LPWIRE15, LPWIRE16, LPWIRE17, LPWIRE18, LPWIRE19,
		LPWIRE20, LPWIRE21, LPWIRE22, LPWIRE23, LPWIRE24, LPWIRE25, LPWIRE26, LPWIRE27, LPWIRE28	;


Latency_Buf1B		LBR1B00(.Dout(LPWIRE00), .Din(Din), .Clock(Clock))	;
Latency_Buf1B		LBR1B01(.Dout(LPWIRE01), .Din(LPWIRE00), .Clock(Clock))	;
Latency_Buf1B		LBR1B02(.Dout(LPWIRE02), .Din(LPWIRE01), .Clock(Clock))	;
Latency_Buf1B		LBR1B03(.Dout(LPWIRE03), .Din(LPWIRE02), .Clock(Clock))	;
Latency_Buf1B		LBR1B04(.Dout(LPWIRE04), .Din(LPWIRE03), .Clock(Clock))	;
Latency_Buf1B		LBR1B05(.Dout(LPWIRE05), .Din(LPWIRE04), .Clock(Clock))	;
Latency_Buf1B		LBR1B06(.Dout(LPWIRE06), .Din(LPWIRE05), .Clock(Clock))	;
Latency_Buf1B		LBR1B07(.Dout(LPWIRE07), .Din(LPWIRE06), .Clock(Clock))	;
Latency_Buf1B		LBR1B08(.Dout(LPWIRE08), .Din(LPWIRE07), .Clock(Clock))	;
Latency_Buf1B		LBR1B09(.Dout(LPWIRE09), .Din(LPWIRE08), .Clock(Clock))	;

Latency_Buf1B		LBR1B10(.Dout(LPWIRE10), .Din(LPWIRE09), .Clock(Clock))	;
Latency_Buf1B		LBR1B11(.Dout(LPWIRE11), .Din(LPWIRE10), .Clock(Clock))	;
Latency_Buf1B		LBR1B12(.Dout(LPWIRE12), .Din(LPWIRE11), .Clock(Clock))	;
Latency_Buf1B		LBR1B13(.Dout(LPWIRE13), .Din(LPWIRE12), .Clock(Clock))	;
Latency_Buf1B		LBR1B14(.Dout(LPWIRE14), .Din(LPWIRE13), .Clock(Clock))	;
Latency_Buf1B		LBR1B15(.Dout(LPWIRE15), .Din(LPWIRE14), .Clock(Clock))	;
Latency_Buf1B		LBR1B16(.Dout(LPWIRE16), .Din(LPWIRE15), .Clock(Clock))	;
Latency_Buf1B		LBR1B17(.Dout(LPWIRE17), .Din(LPWIRE16), .Clock(Clock))	;
Latency_Buf1B		LBR1B18(.Dout(LPWIRE18), .Din(LPWIRE17), .Clock(Clock))	;
Latency_Buf1B		LBR1B19(.Dout(LPWIRE19), .Din(LPWIRE18), .Clock(Clock))	;

Latency_Buf1B		LBR1B20(.Dout(LPWIRE20), .Din(LPWIRE19), .Clock(Clock))	;
Latency_Buf1B		LBR1B21(.Dout(LPWIRE21), .Din(LPWIRE20), .Clock(Clock))	;
Latency_Buf1B		LBR1B22(.Dout(LPWIRE22), .Din(LPWIRE21), .Clock(Clock))	;
Latency_Buf1B		LBR1B23(.Dout(LPWIRE23), .Din(LPWIRE22), .Clock(Clock))	;
Latency_Buf1B		LBR1B24(.Dout(LPWIRE24), .Din(LPWIRE23), .Clock(Clock))	;
Latency_Buf1B		LBR1B25(.Dout(LPWIRE25), .Din(LPWIRE24), .Clock(Clock))	;
Latency_Buf1B		LBR1B26(.Dout(LPWIRE26), .Din(LPWIRE25), .Clock(Clock))	;
Latency_Buf1B		LBR1B27(.Dout(LPWIRE27), .Din(LPWIRE26), .Clock(Clock))	;
Latency_Buf1B		LBR1B28(.Dout(LPWIRE28), .Din(LPWIRE27), .Clock(Clock))	;

assign	Dout = Sel ? LPWIRE28 : LPWIRE27	;


endmodule
