`timescale	1ns/1ps

module	DEC_OP_CTRL(CTRL_OUT, ADDR_IN, DATA_IN, Clock)	;

output	[31:0]	CTRL_OUT	;
reg	[31:0]	CTRL_OUT	;

input	[25:0]	ADDR_IN	;
wire	[25:0]	ADDR_IN	;

input	[15:0]	DATA_IN	;
wire	[15:0]	DATA_IN	;

input	Clock	;
wire	Clock	;

reg	[15:0]	DATA_TEMPB16	;
reg	[31:0]	DATA_TEMPB32	;



always	@(posedge	Clock)
	begin
		if ( ADDR_IN == 26'b10_0000_0000_0000_0001_0000_0000 )
			begin
				DATA_TEMPB16 <= DATA_IN	;
			end
		else if ( ADDR_IN == 26'b10_0000_0000_0000_0001_0000_0010 )
			begin
				DATA_TEMPB32 <= {DATA_IN, DATA_TEMPB16}	;
			end
		else
			begin
				DATA_TEMPB32 <= DATA_TEMPB32	;
			end
	end
	
	
always	@(posedge	Clock)
	begin
		CTRL_OUT <= DATA_TEMPB32	;
	end

	

endmodule



