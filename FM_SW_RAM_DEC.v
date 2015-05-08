`timescale	1ns/1ps

module	FM_SW_RAM_DEC(CONT_OUT, Addr_IN, Clock)	;

output	CONT_OUT	;
reg	CONT_OUT	;

input	[12:0]	Addr_IN	;
wire	[12:0]	Addr_IN	;

input	Clock	;
wire	Clock	;



//Decode range from 0x2002000 to 0x2003FFE.............(A0)LSB is disable...........**Comment**......

always	@(posedge	Clock)
	begin
		if ( Addr_IN == 13'b1_0000_0000_0001 )
			begin
				CONT_OUT	<= 1'b1	;
			end
		else
			begin
				CONT_OUT <= 1'b0	;
			end
	end

endmodule

