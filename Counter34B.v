`timescale	1ns/1ps

module	Counter34B(Dout, Din, Clock, EN)	;

output	Dout	;
reg	Dout	;

input	[33:0]	Din	;
wire	[33:0]	Din	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;


reg	[33:0]	Count_VT	;
reg	[33:0]	DinVTemp	;



always	@(posedge	Clock)
	begin
		DinVTemp <= Din	;
	end


always	@(posedge	Clock)
	begin
		if ( EN == 1'b0 )
			begin
				Count_VT <= 34'b00_0000_0000_0000_0000_0000_0000_0000	;
			end
		else
			begin
				Count_VT <= Count_VT + 1'b1	;
			end
	end

always	@(posedge	Clock)
	begin
		if ( (Count_VT <= DinVTemp) && (EN == 1'b1) )
			begin
				Dout <= 1'b1	;
			end
		else
			begin
				Dout <= 1'b0	;
			end
	end
	
		
		

endmodule

