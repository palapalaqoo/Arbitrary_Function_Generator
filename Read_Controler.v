`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:55 05/29/2008 
// Design Name: 
// Module Name:    Read_Controler 
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
module Read_Controler(Init_done,DCM_200M,DAC_ACT,CLK_in, CLK_in_90, CMD_ACK_in,ar_req,ar_done, Readed_data_in, Data_valid_in, CMD_out, Addr_out, Burst_done_out, Data_out,READ_OUT,SYNC_CNT_OUT,ARB_SIZE32_IN,SYNC_VAILD);
    input Init_done;
	 input DCM_200M;
	 input DAC_ACT;
    input CLK_in;
	 input CLK_in_90;
    input CMD_ACK_in;
	 input ar_req;
	 input ar_done;
    input [31:0] Readed_data_in;
    input Data_valid_in;
	 input [31:0]ARB_SIZE32_IN;//only using [21:0]bits,from 0~size of arb -1;
    output [2:0] CMD_out;
    output [25:0] Addr_out;
    output Burst_done_out;
    output [15:0] Data_out;
	 output READ_OUT;
	 output [19:0]SYNC_CNT_OUT; 
	 output SYNC_VAILD;


	 reg [31:0]Readed_data_in_buf;
    reg Burst_done_out;
	 reg [25:0]Addr_out;
	 reg [15:0]Data_out;
	 reg SYNC_VAILD;
	 reg address_set_0;
	 
	 wire [19:0]	ADDR_CNT_MAX_VAL;//=ARB_SIZE32_IN[21:2],compare with AddrBuf0,20bit
	 reg [19:0] AddrBuf0;   //4m addressing AddrBuf0->AddrBuf1->Addr_out
	 reg [19:0] AddrBuf1;
	 reg [19:0] Addr_Save;//if ar_req occurs at cmd_ack = 0! then reload it

	 reg last_A8;
	 reg [4:0]read_ack;
	 reg [4:0]CMD_ACT_CNT;
	 reg [1:0]SUB_ACT;
	 reg RETURN_0;
	 reg ROW_CHANGED;
	 
	 reg [31:0]MEMORY[1023:0];//1024*32bit=1k*16bit buff
	 reg [9:0]M_WRITE_CNT;//memory write count,0~1024,10bit, 1k*32=2k*16 pointer
	 reg [10:0]M_READ_CNT;//memory read count,0~1024*2,11bit,M_READ_CNT[10:1]	used to compare with M_WRITE_CNT
	 //4M cnt=21bit cnt *32bit databus.
	 reg M_OUTPUT;//OUTPUT data;
	
	 reg [31:0]M_BUF;	 
	 reg [19:0]SYNC_CNT_OUT;//sync count,4M,10bit,
	 reg SYNC_CNT_ACT;
	 
	 reg [11:0]MARKER_DELAY;//MARKER_DELAY becouse of DAC feture
	//========================================================================
	localparam	OFF	=	3'b000;
	localparam	ON		=	3'b001;
	localparam 	SUSPEND_BURST0	=	3'b010;
	localparam	SUSPEND_BURST1	=	3'b011;
	localparam 	SUSPEND_WAIT	=	3'b100;
	
	reg [2:0]   CS;                  //current_state
	
	(* KEEP="TRUE" *)wire ROW_STOP;
	reg AR_STOP;
	reg M_STOP;
	reg CHANGED_ROW;
	wire CHANGED_ROW_STOP;
	wire ADDR_MAX_DONE;
	reg DIV_2_CLK;
	(* KEEP="TRUE" *)wire STOP;				//
	reg [2:0]CMD_out;
	reg BURST_ONCE_DONE;
	reg [2:0]DELAY;
	reg [4:0]DAC_OFF_DELAY;
	reg DACSTOP;
	reg BURST_0;
	reg DAC_ACT0;
	
	initial
	begin 
	DIV_2_CLK=0;
	AR_STOP=0;
	M_STOP=0;
	CHANGED_ROW=0;
	AddrBuf0=0;
	BURST_ONCE_DONE=0;
	DAC_OFF_DELAY=0;
	DACSTOP=0;
	end
	
	
	//STOP					//becouse of while stop at 0xFE, then next read will be 0xFF,and row stop will always high!
	assign STOP=ROW_STOP|DACSTOP|AR_STOP|M_STOP|CHANGED_ROW_STOP ;
	assign ROW_STOP=Addr_out[13]!=AddrBuf0[8]? 1:0;	
	assign READ_OUT=DAC_OFF_DELAY[4];
	assign ADDR_CNT_MAX_VAL=ARB_SIZE32_IN[21:2];//20bit		
	assign ADDR_MAX_DONE=(AddrBuf0==ADDR_CNT_MAX_VAL)? 1:0;
	assign CHANGED_ROW_STOP=CHANGED_ROW&(AddrBuf0==0);
	
//##############  CLK   ############################################
	always@(posedge CLK_in)
	begin	
		//DIV_2_CLK 
		DIV_2_CLK<=~DIV_2_CLK;	
	end	
//#############################################################	
	always@(negedge CLK_in)		
	begin	
		//ar req
		if(ar_req==1)
		begin
			AR_STOP<=1;
		end						
		if(ar_done) 
			AR_STOP<=0;
		//#############################################################
		if(DIV_2_CLK==1)
		begin		
			if(DAC_OFF_DELAY[4]==0)
				CS<=OFF;
			else 
			begin
				if(CS==ON&&STOP==1)
					CS<=SUSPEND_BURST0;
				else	if(CS==SUSPEND_BURST0)
					CS<=SUSPEND_BURST1;					
				else	if(CS==SUSPEND_BURST1)
					CS<=SUSPEND_WAIT;
				else	if(((CS==SUSPEND_WAIT&&CMD_ACK_in==0&&STOP==0)||(CS==OFF&&STOP==0))&&DAC_ACT==1)
					CS<=ON;	
				else		
					CS<=CS;
			end	
			
			//cmd------------------------------------------
			if(CS==ON)
				CMD_out<=3'b110;
			else
				CMD_out<=3'b000;
			
			//burst---------------------------------------
			if(CS==SUSPEND_BURST0||CS==SUSPEND_BURST1)
				Burst_done_out<=1;
			else
				Burst_done_out<=0;
				
			//addr---------//row					//col			//col[1:0] //bank										 
			Addr_out<={1'b0,AddrBuf1[19:8],1'b0,AddrBuf1[7:0],2'b00,2'b00};	
			AddrBuf1<=AddrBuf0;
			// STOPS,  only ar stop not in here -----------------------------------------	
			if(DAC_ACT==1)
				DAC_OFF_DELAY<=5'b11111;
			else
				DAC_OFF_DELAY<=DAC_OFF_DELAY<<1;
			DACSTOP<=(DAC_OFF_DELAY[4]==1&&DAC_OFF_DELAY[0]==0)? 1:0;
			M_STOP<=(((M_READ_CNT[10]==1)&&(M_WRITE_CNT[9:5]==5'b01111))||((M_READ_CNT[10]==0)&&(M_WRITE_CNT[9:5]==5'b11111)))? 1:0;		
					
			//CHANGED_ROW_STOP
			if(ROW_STOP==1)
				CHANGED_ROW<=1;
			if(DAC_ACT==0||(CHANGED_ROW_STOP==1))		
				CHANGED_ROW<=0;

			//addr
			if(CS==ON&&STOP==0)
			begin
				if(ADDR_MAX_DONE==1)
					AddrBuf0<=0;	
				else
					AddrBuf0<=AddrBuf0+1;			
			end
			else if(CS==SUSPEND_BURST0&&CMD_ACK_in==0)
				AddrBuf0<=Addr_Save;	
			else if(CS==OFF)
				AddrBuf0<=0;	
			else
				AddrBuf0<=AddrBuf0;	

			if(CS!=ON)
				Addr_Save<=AddrBuf0;
				
		end	
//###################################################################################		
		

	end	
	//------------------------------------------------------
	//--------------------------------------------------	

			
	always@(negedge CLK_in_90)
	begin
		DAC_ACT0<=DAC_ACT;//becouse of fail constriant
		if(Data_valid_in==1)
		begin	
				M_WRITE_CNT<=M_WRITE_CNT+1;
				MEMORY[M_WRITE_CNT]<=Readed_data_in;	//32bit				
		end
		if(DAC_ACT0==0)
				M_WRITE_CNT<=0;
	end
	
	
	always@(posedge DCM_200M)
	begin
		//======== while W CNT > 3'b111
		if(DAC_ACT==0)
		begin
			M_OUTPUT<=0;	
			M_READ_CNT<=0;			
		end	
		else if(M_WRITE_CNT[8:6]==3'b111)
		begin
			M_OUTPUT<=1;
		end

		// output
		if(M_OUTPUT==1)
		begin
			if(M_READ_CNT[0]==1)
				M_BUF<=MEMORY[M_READ_CNT[10:1]];
			else
				M_BUF<=M_BUF;
			Data_out<=M_READ_CNT[0]==0?	M_BUF[15:0]:M_BUF[31:16];			
			M_READ_CNT<=M_READ_CNT+1;		
		end
		else
		begin
			M_BUF<=0;
			Data_out<=0;
		end	
				
		//MARKER_DELAY
		if(M_OUTPUT==0)
			MARKER_DELAY<=12'b111111111111;
		else
			MARKER_DELAY<=MARKER_DELAY<<1;
			
		//marker				
		if(M_OUTPUT==1)
		begin
			if(MARKER_DELAY[11]==0)
				SYNC_CNT_OUT<=(SYNC_CNT_OUT==0)? 	ARB_SIZE32_IN[21:2] : SYNC_CNT_OUT-1;
			else
				SYNC_CNT_OUT<=SYNC_CNT_OUT;
			if(MARKER_DELAY[10]==0)	
			SYNC_VAILD<=1;//for first sync 
		end	
		else
		begin
			SYNC_CNT_OUT<=ARB_SIZE32_IN[21:2];
			SYNC_VAILD<=0;
		end	
			
	end
	//==========================================================================
	//==========================================================================
	//==========================================================================
	//==========================================================================
	//==========================================================================
	
	

endmodule
