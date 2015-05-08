`timescale	1ns/1ps

module	Burst_Gated_Sel(Mux_out, Min1, Min2, Gate_Sel, Clock, Reset)	;

output	Mux_out	;
reg	Mux_out	;

input	Min1, Min2	;
wire	Min1, Min2	;

input	Gate_Sel	;
wire	Gate_Sel	;

input	Clock, Reset	;
wire	Clock, Reset	;


wire	Gate_temp	;
assign	Gate_temp = (Gate_Sel) ? Min2 : Min1	;


always	@(posedge	Clock)
	begin
		if ( Reset == 1'b0 )
			begin
				Mux_out <= 1'b0	;
			end
		else
			begin
				Mux_out <= Gate_temp	;
			end
	end
	
endmodule
