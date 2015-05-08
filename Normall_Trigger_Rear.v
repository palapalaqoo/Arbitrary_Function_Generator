`timescale	1ns/1ps

module	Normal_Trigger_Rear(Trig_Dout, Trig_Ain, NTrig_EN, Clock)	;

output	Trig_Dout	;
reg	Trig_Dout	;

input	Trig_Ain	;
wire	Trig_Ain	;

input	NTrig_EN	;
wire	NTrig_EN	;

input	Clock	;
wire	Clock	;



reg	Temp_Ain	;
wire	APTemp	;
reg	CTRLTemp	;


assign	APTemp = (Trig_Ain ^ Temp_Ain) & Temp_Ain	;
//assign	BNTemp = (Trig_Bin ^ Temp_Bin) & Temp_Bin	;
//assign	CTRLTemp = APTemp | BNTemp	;



always	@(posedge	Clock)
	begin
		if ( NTrig_EN == 1'b1 )
			begin
				Temp_Ain <= Trig_Ain	;			
				CTRLTemp <= APTemp 	;
			end
		else
			begin
				Temp_Ain <= 1'b0	;
				CTRLTemp <= 1'b0	;
			end
	end
	
always	@(posedge	Clock)
	begin
		if ( NTrig_EN == 1'b1 )
			begin
				if ( CTRLTemp == 1'b1 )
					begin
						Trig_Dout <= ~Trig_Dout	;
					end
				else
					begin
						Trig_Dout <= Trig_Dout	;
					end
			end
		else
			begin
				Trig_Dout <= 1'b0	;
			end
	end
	


endmodule
		


