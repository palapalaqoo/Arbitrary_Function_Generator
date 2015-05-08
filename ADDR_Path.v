`timescale	1ns/1ps

module	ADDR_Path(ADDR_OUT, ADDR_IN, Clock)	;

output	[13:0]	ADDR_OUT	;
wire	[13:0]	ADDR_OUT	;

input	[13:0]	ADDR_IN	;
wire	[13:0]	ADDR_IN	;

input	Clock	;
wire	Clock	;


wire	[13:0]	Addr_wire03, Addr_wire04, Addr_wire05, Addr_wire06, Addr_wire07, 
					Addr_wire08, Addr_wire09, Addr_wire10, Addr_wire11	;

BufReg14B				BADDR_REG00(.Dout(Addr_wire03), .Din(ADDR_IN), .Clock(Clock))	;
BufReg14B				BADDR_REG01(.Dout(Addr_wire04), .Din(Addr_wire03), .Clock(Clock))	;
BufReg14B				BADDR_REG02(.Dout(Addr_wire05), .Din(Addr_wire04), .Clock(Clock))	;
BufReg14B				BADDR_REG03(.Dout(Addr_wire06), .Din(Addr_wire05), .Clock(Clock))	;
BufReg14B				BADDR_REG04(.Dout(Addr_wire07), .Din(Addr_wire06), .Clock(Clock))	;
BufReg14B				BADDR_REG05(.Dout(Addr_wire08), .Din(Addr_wire07), .Clock(Clock))	;
BufReg14B				BADDR_REG06(.Dout(Addr_wire09), .Din(Addr_wire08), .Clock(Clock))	;
BufReg14B				BADDR_REG07(.Dout(Addr_wire10), .Din(Addr_wire09), .Clock(Clock))	;
BufReg14B				BADDR_REG08(.Dout(Addr_wire11), .Din(Addr_wire10), .Clock(Clock))	;
//BufReg14B				BADDR_REG09(.Dout(Addr_wire12), .Din(Addr_wire11), .Clock(Clock))	;
//BufReg14B				BADDR_REG10(.Dout(Addr_wire13), .Din(Addr_wire12), .Clock(Clock))	;
BufReg14B				BADDR_REG11(.Dout(ADDR_OUT), .Din(Addr_wire11), .Clock(Clock))	;


endmodule	
