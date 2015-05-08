`timescale	1ns/1ps

module	MOD_WAVE_Counter(CS_OUT, RW_OUT, Clock, Reset)	;

output	CS_OUT, RW_OUT	;
reg	CS_OUT, RW_OUT	;


input	Clock, Reset	;
wire	Clock, Reset	;


always	@(posedge	Clock)
	begin
		if ( Reset == 1'b1 )
			begin
				CS_OUT <= ~CS_OUT	;
				RW_OUT <= 1'b0	;
			end
		else
			begin
				CS_OUT <= 1'b0	;
				RW_OUT <= 1'b0	;
			end
	end

endmodule

