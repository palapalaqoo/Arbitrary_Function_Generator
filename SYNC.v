`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:30 08/27/2008 
// Design Name: 
// Module Name:    SYNC 
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
module SYNC(CLK200,ARB_SIZE_IN,SYNC_CNT_IN,START_IN,END_IN,SYNC_OUT,SYNC_VALID);
    input [31:0] ARB_SIZE_IN;//21~0
    input [19:0] SYNC_CNT_IN;
    input [31:0]START_IN;
    input [31:0]END_IN;
	 input SYNC_VALID;
	 input CLK200;
    output SYNC_OUT;
   
	wire [19:0]ONE_WAVE;//20bit,max1M
	assign ONE_WAVE[19:0]=ARB_SIZE_IN[21:2];//size div 4,one waveform,max 20bit(1M)
	reg [19:0]cnt;//max 1M
	wire [19:0]START;//start, max 1M 
	wire [19:0]END;//end,max 1M

	assign START=START_IN[19:0];
	assign END=END_IN[19:0];
	reg RESET_CNT;
	reg SET;
	reg SYNC_OUT;
	wire CLK_SN; 	
	wire ST_EQU;
	wire END_EQU;
	assign ST_EQU=(SYNC_CNT_IN==START)?1:0;
	assign END_EQU=(SYNC_CNT_IN==END)?1:0;
	
	assign CLK_SN=ST_EQU^END_EQU;
	always@(negedge CLK200)
	begin			
		if(ST_EQU)
		begin
			SYNC_OUT<=1;
		end
		if((END_EQU)||(~SYNC_VALID))
		begin
			SYNC_OUT<=0;
		end					
	end





endmodule
