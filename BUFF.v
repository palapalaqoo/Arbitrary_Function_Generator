`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:25 05/27/2008 
// Design Name: 
// Module Name:    BUFF 
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
module BUFF(CLK_DDS_IN,CLK133,Addr_in, Data_in, Write_in,Addr_out, Data_out, Write_enable_out,DAC0_ACT,ARB_SIZE_OUT,SYNC_START,SYNC_END,DCM_RESET,ARB_CLK_S,ARB_SEL);
    input CLK133;//clk_int
	 input [25:0] Addr_in;
    input [15:0] Data_in;
	 input Write_in;
	 input CLK_DDS_IN;
    output [25:0] Addr_out;
    output [63:0] Data_out;
    output Write_enable_out;
	 output DAC0_ACT;
	 output [31:0]ARB_SIZE_OUT;
	 output [31:0]SYNC_START;
	 output [31:0]SYNC_END;
	 output DCM_RESET;
	 output [1:0]ARB_CLK_S;
	 output ARB_SEL;
	// output DDS_WE;
	 wire [25:0] Addr4DDR;
	 
	reg [15:0]Buf[2:0];//four bufs (16bit),store the data
	reg [63:0] Data_out;
	reg [25:0]Addr_out;
	reg DAC0_ACT;
	reg [31:0]ARB_SIZE_OUT;//size of arb,unit=16bit,only 22bit meanfull
	reg [31:0]SYNC_START;
	reg [31:0]SYNC_END;
	reg [9:0]RESET_DCM_BUF;
	reg [1:0]ARB_CLK_S;
	reg ARB_SEL;
	reg Write_enable_out;
	
//	assign Addr4DDR={1'b0,Addr_in[22:11],1'b0,Addr_in[10:1],Addr_in[24:23]};
	assign Addr4DDR={Addr_in[23:11],1'b0,Addr_in[10:1],1'b0,Addr_in[24]};	
						 //row          ,A10 , cow ,       ,no used, bank address using 0 and 1,2 and 3 no used	 	

	wire CLK_RESET;
	assign CLK_RESET=(Write_in==1)?CLK_DDS_IN:~CLK_DDS_IN;
	assign DCM_RESET=RESET_DCM_BUF[9];
	
	always@(posedge CLK_RESET) 
	begin				
		if(Write_in==0)
		begin//52000088
			if(Addr_in==26'b10000000000000000010001000)
			begin
				RESET_DCM_BUF[9:0]<=10'b1111111111;
			end
		end
		else
		begin
			RESET_DCM_BUF<=RESET_DCM_BUF<<1;
		end
	end	
	
	always@(negedge CLK133)
	begin
		if((Addr_in[2:1]==2'b11)&&(Addr_in[25]==0)&&(Write_in==0))
			 Write_enable_out<=0;
		else
			 Write_enable_out<=1;
	
	
		if(Write_in==0)
		begin
			//========== data ===========//==== address out
			if(Addr_in[25]==0)	
			begin
				if(Addr_in[2:1]==2'b00)
					Data_out[15:0]<=Data_in;
				if(Addr_in[2:1]==2'b01)
					Data_out[31:16]<=Data_in;
				if(Addr_in[2:1]==2'b10)
					Data_out[47:32]<=Data_in;
				if(Addr_in[2:1]==2'b11)
				begin
					Data_out[63:48]<=Data_in;
					Addr_out[25:0]<={Addr4DDR[25:4],2'b00,Addr4DDR[1:0]};					
				end	
				ARB_SEL<=1;
			end				
			// ARB total 16+6=22bit,max=4maga 
			//========== size of arb,low words, 0x52000002 16bit=================
			else if(Addr_in==26'b10000000000000000000000010)
			begin
				ARB_SIZE_OUT[15:0]=Data_in;
				ARB_SEL<=1;
			end	
			//high words, 0x52000004 6bit	
			else if(Addr_in==26'b10000000000000000000000100)
			begin
				ARB_SIZE_OUT[31:16]=Data_in;
				ARB_SEL<=1;
			end	
		// SYNC START total 16+3=19bit,max=1maga 
			//low words, 0x52000006 16bit=====================================
			else if(Addr_in==26'b10000000000000000000000110)
			begin
				SYNC_START[15:0]=Data_in;
				ARB_SEL<=1;
			end	
			//0x52000008 3bit		
			else if(Addr_in==26'b10000000000000000000001000)
			begin
				SYNC_START[31:16]=Data_in;
				ARB_SEL<=1;
			end				
		// SYNC END total 16+3=19bit,max=1maga 
			//low words, 0x5200000A 16bit=====================================
			else if(Addr_in==26'b10000000000000000000001010)
			begin
				SYNC_END[15:0]=Data_in;
				ARB_SEL<=1;
			end	
			//0x5200000C 6bit		
			else if(Addr_in==26'b10000000000000000000001100)
			begin
				SYNC_END[31:16]=Data_in;
				ARB_SEL<=1;
			end				
		//=========== dac_act,0x52000000's bit 0 =====================
			else if(Addr_in==26'b10000000000000000000000000)
			begin
				if(Data_in[0]==1)
					DAC0_ACT=1;
				else
					DAC0_ACT=0;	
				ARB_SEL<=1;				
			end
		//========== CLK config,0x5200000E 
			else if(Addr_in==26'b10000000000000000000001110)
			begin
				//1'b00 ad9747
				//1'b01 ad9747*4		
				//1'b11 ad9747*16
				ARB_CLK_S[1:0]<=Data_in[1:0];
				ARB_SEL<=1;
			end
		//======== else =======
			else
			begin
				ARB_SEL<=0;
			end
		end	
	end		



endmodule
