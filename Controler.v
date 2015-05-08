`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:03 05/27/2008 
// Design Name: 
// Module Name:    Controler 
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
module Write_Controler(Addr_in, Data_in,ar_req,ar_done,Write_in, CLK_in, CMD_out, Data_out, Addr_out, Burst_Done_out, CLK_in_90,Init_done,CMD_ack,WRITE_OUT);
    input [25:0] Addr_in;
    input [63:0] Data_in;
	 input ar_req;
	 input Write_in;//0 means wrting
    output [2:0] CMD_out;
    output [31:0] Data_out;
    output [25:0] Addr_out;
    output Burst_Done_out;
	 output WRITE_OUT;
	 input Init_done;
	 input CMD_ack;	 
    input CLK_in_90;
	 input CLK_in;
	 input ar_done;

	reg [2:0]CMD_out;	
	reg Burst_Done_out;
	reg WRITE_OUT;
	reg [11:0]cnt;
	reg [31:0]Data_out;
	reg AR_STOP;
	reg REWRITE;

	assign Addr_out=Addr_in;// addr latched at buff.v
	initial
	begin
			//initial
//		   Burst_Done_out=0;
			cnt=0;
			CMD_out=3'b0;
			#0 WRITE_OUT=0;
			REWRITE=0;
			AR_STOP=0;
	end


	always@(negedge CLK_in)
	begin	
		Burst_Done_out<=cnt[5]|cnt[6];
		WRITE_OUT<=(cnt==0)?0:1;
			
		
		if(ar_req==1)
			AR_STOP<=1;
		if(ar_done==1)
			AR_STOP<=0;
			
		if(AR_STOP==1&&cnt!=0)
			REWRITE<=1;
		if(REWRITE==1&&cnt==0&&AR_STOP==0)
			REWRITE<=0;
			//=========			
			
			if(cnt[1]==1'b1&&AR_STOP==0)
			begin				
				CMD_out<=3'b100;				
			end				
			if(cnt[6]==1'b1)
			begin
				CMD_out<=3'b000;
			end
			if(Init_done==1)
			begin
				if(~Write_in||(REWRITE==1&&cnt==0&&AR_STOP==0))
				begin		
					cnt<=12'b000000000001;	
				end
				else
				begin
					cnt<=cnt<<1;	
				end		
			end				
	end
	
	always@(posedge CLK_in_90)
	begin
			//=========
			//	Data_out<=(cnt[0]==1||cnt[1]==1||cnt[2]==1)?Data_in[31:0]:Data_in[63:32];
			Data_out<=(cnt[0]==1||cnt[1]==1||cnt[2]==1||cnt[3]==1)?Data_in[31:0]:Data_in[63:32];
	end




endmodule
