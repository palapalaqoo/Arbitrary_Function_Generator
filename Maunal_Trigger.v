`timescale	1ns/1ps

module	Maunal_Trigger(Trig_Dout, Trig_Ain, Trig_Bin, MNTrig_EN, Clock)	;

output	Trig_Dout	;
reg	Trig_Dout	;

input	Trig_Ain, Trig_Bin	;
wire	Trig_Ain, Trig_Bin	;

input	MNTrig_EN	;
wire	MNTrig_EN	;

input	Clock	;
wire	Clock	;



reg	Temp_Ain, Temp_Bin	;
wire	APTemp, BNTemp	;
reg	CTRLTemp	;


assign	APTemp = (Trig_Ain ^ Temp_Ain) & Trig_Ain	;
assign	BNTemp = (Trig_Bin ^ Temp_Bin) & Temp_Bin	;
//assign	CTRLTemp = APTemp | BNTemp	;



always	@(posedge	Clock)
	begin
		if ( MNTrig_EN == 1'b1 )
			begin
				Temp_Ain <= Trig_Ain	;
				Temp_Bin <= Trig_Bin	;
				CTRLTemp <= APTemp | BNTemp	;
			end
		else
			begin
				Temp_Ain <= 1'b0	;
				Temp_Bin	<= 1'b0	;
				CTRLTemp <= 1'b0	;
			end
	end
	
always	@(posedge	Clock)
	begin
		if ( MNTrig_EN == 1'b1 )
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
		


