`timescale	1ns/1ps

module	CPU_Data_Addr(FPGA_Data, FPGA_Addr, CPU_NWE, CPU_NCS, CPU_NRD, CPU_Data, CPU_Addr, INOUT_CTRL, FPGA_Clock, FPGA_Reset)	;

output	[15:0]	FPGA_Data	;
reg	[15:0]	FPGA_Data	;

output	[25:0]	FPGA_Addr	;
reg	[25:0]	FPGA_Addr	;

output	INOUT_CTRL	;
reg	INOUT_CTRL	;


input	[15:0]	CPU_Data	;
wire	[15:0]	CPU_Data	;

input	[25:0]	CPU_Addr	;
wire	[25:0]	CPU_Addr	;

input	FPGA_Clock, FPGA_Reset	;
wire	FPGA_Clock, FPGA_Reset	;

input	CPU_NWE, CPU_NCS, CPU_NRD	;
wire	CPU_NWE, CPU_NCS, CPU_NRD	;

reg	[2:0]	NCS_NWE_NRD	;


always	@(posedge	FPGA_Clock)
		begin
			NCS_NWE_NRD = {CPU_NWE, CPU_NCS, CPU_NRD}	;
		end


always	@(posedge	FPGA_Clock)
	begin
		if ( FPGA_Reset == 1'b0 )
			begin
				FPGA_Data <= 16'h0000	;
				FPGA_Addr <= 26'b00_0000_0000_0000_0000_0000_0000	;
				INOUT_CTRL <= 1'b1	;
			end
		else if ( FPGA_Reset == 1'b1 )
			begin
				if ( NCS_NWE_NRD == 3'b001 )
					begin
						FPGA_Data <= CPU_Data	;
						FPGA_Addr <= CPU_Addr	;
						INOUT_CTRL <= 1'b1	;
					end
				else if ( NCS_NWE_NRD == 3'b100 )
					begin
						FPGA_Data <= FPGA_Data	;
						FPGA_Addr <= FPGA_Addr	;
						INOUT_CTRL <= 1'b0	;
					end
				else
					begin
						FPGA_Data <= FPGA_Data	;
						FPGA_Addr <= FPGA_Addr	;
						INOUT_CTRL <= 1'b1	;
					end		
			end
	end

/*		else
			begin
				FPGA_Data <= FPGA_Data	;
				FPGA_Addr <= CPU_Addr	;
			end
	end
*/	
endmodule




