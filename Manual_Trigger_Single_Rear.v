`timescale	1ns/1ps

module	Manual_Trigger_Single_Rear(STrig_out, STrig_in, Clock, EN)	;

output	STrig_out	;
reg	STrig_out	;

input	STrig_in	;
wire	STrig_in	;

input	EN	;
wire	EN	;

input	Clock	;
wire	Clock	;



reg	STemp	;
reg	ANTemp	;
//assign	ANTemp = (STrig_in ^ STemp) & STemp	;


always	@(posedge	Clock)
	begin
		if ( EN == 1'b1 )
			begin
				STemp <= STrig_in	;
				ANTemp <= (STrig_in ^ STemp) & STemp	;
			end
		else
			begin
				STemp <= 1'b0	;
				ANTemp <= 1'b0	;
			end
	end

always	@(posedge	Clock)
	begin
		if ( EN == 1'b1 )
			begin
				if ( ANTemp == 1'b1 )
					begin
						STrig_out <= ~STrig_out	;
					end
				else
					begin
						STrig_out <= STrig_out	;
					end
			end
		else
			begin
				STrig_out <= 1'b0	;
			end
	end

endmodule




