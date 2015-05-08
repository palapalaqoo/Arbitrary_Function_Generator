`timescale	1ns/1ps

module	Triangle_RAM_DEC(WN_OUT, Addr_IN, Clock)	;

output	WN_OUT	;
reg	WN_OUT	;

input	[14:0]	Addr_IN	;
wire	[14:0]	Addr_IN	;

input	Clock	;
wire	Clock	;



//Decode range from 0x2000800 to 0x2000FFE.............(A0)LSB is disable...........**Comment**......
//10_0000_0000_0000_1

always	@(posedge	Clock)
	begin
		if ( Addr_IN == 15'b100_0000_0000_0001 )
			begin
				WN_OUT	<= 1'b1	;
			end
		else
			begin
				WN_OUT <= 1'b0	;
			end
	end

endmodule
