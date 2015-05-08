`timescale	1ns/1ps

module	Counter8Bits(Dout, Clock, Reset)	;

output	[14:0]	Dout	;
reg	[14:0]	Dout	;

input	Clock, Reset	;
wire	Clock, Reset	;


reg	[14:0]	Count_TV1	;

always	@(posedge	Clock)
	begin
		if ( ( Reset == 1'b1 ) && ( Dout <= Count_TV1 ) )
			begin
				Dout <= Dout + 1'b1	;
			end
		else
			begin
				Dout <= 15'b000_0000_0000_0000	;
			end
	end
	
always	@(posedge	Clock)
	begin
		Count_TV1 <= 15'b111_1110_0111_0110	;   //The Count_TV1 always equal 32734............... 
	end


endmodule


