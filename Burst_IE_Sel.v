`timescale	1ns/1ps

module	Burst_IE_Sel(IE_out, Int_in, Ext_in, IE_Sel, Clock)	;

output	IE_out	;
reg	IE_out	;

input	Int_in, Ext_in	;
wire	Int_in, Ext_in	;

input	IE_Sel	;
wire	IE_Sel	;

input	Clock	;
wire	Clock	;


wire	IE_temp	;
assign	IE_temp = (IE_Sel) ? Ext_in : Int_in	;


always	@(posedge	Clock)
	begin
		IE_out <= IE_temp	;
	end
	
endmodule
