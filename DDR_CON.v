`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:10 10/07/2008 
// Design Name: 
// Module Name:    DDR_CON 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DDR_CON(CLK133,Addr_in, Data_in, Write_in,  Addr_out, Data_out, Write_out,REG_SEL,DDS_PINC,ARB_SEL);
    input [25:0] Addr_in;
    input [15:0] Data_in;
	 input Write_in;
	 input CLK133;		//133M in
    output [25:0] Addr_out;
    output [15:0] Data_out;
    output Write_out;
	 output [3:0]REG_SEL;
	 output [47:0]DDS_PINC;
	 output ARB_SEL;

	 
	reg [15:0]Buf[2:0];//four bufs (16bit),store the data
	reg [47:0]DDS_PINC_BUF;//for chose dds clk,if clk big then 50M then div value from 4,
	reg DDS_PINC_DIV4;
	reg [3:0]REG_SEL;
	reg [7:0]DCM_CNT;
	reg ARB_SEL;

	
	assign Addr_out=Addr_in;	
	assign Write_out=Write_in;
	assign Data_out=Data_in;
	assign DDS_PINC=DDS_PINC_BUF;//
		

	always@(posedge CLK133) 
	begin	
		if(Write_in==0)
		begin
			//=============  DDS ==============================
				//==  L  ==			
			if(Addr_in==26'b10000000000000000010000000)//0x52000080
			begin
				DDS_PINC_BUF[15:0]<=Data_in;
			end
			//==  M  ==
			if(Addr_in==26'b10000000000000000010000010)//52000082
			begin
				DDS_PINC_BUF[31:16]<=Data_in;
			end
				//==  H  ==
			if(Addr_in==26'b10000000000000000010000100)//52000084
			begin
				DDS_PINC_BUF[47:32]<=Data_in;
			end	
		end	
	end



endmodule
