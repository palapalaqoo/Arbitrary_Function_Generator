`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:09 05/29/2008 
// Design Name: 
// Module Name:    InitialDDR2 
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
module InitialDDR2(CLK_in,Wait200_done_in,INIT_DONE_IN,CMD_IN,CMD_out);
	 input CLK_in;
    input Wait200_done_in;
	 input INIT_DONE_IN;
	 input [2:0] CMD_IN;
    output [2:0] CMD_out;
	 reg [2:0] CMD_out1;

	 reg	Wait200_done_in_BUF;
	 reg [4:0]inited;
	 
    initial
	 begin
		#0 inited=0;
	 end
	 //======================================================
	 always@(posedge CLK_in)
	 begin
		Wait200_done_in_BUF<=Wait200_done_in;
	 end
	 
	 always@(negedge CLK_in)	 
	 begin
		if(~Wait200_done_in_BUF)//reset and waiting
		begin
			inited=5'b00001;
			CMD_out1=3'b000;
		end
		if(Wait200_done_in_BUF)
		begin
			if(inited[3]==1)
			begin
				CMD_out1=3'b010;
			end
			else
			begin
				CMD_out1=3'b000;
			end
			inited=inited<<1;
		end


	end	
	//=====================================================

    assign CMD_out=INIT_DONE_IN? CMD_IN:CMD_out1;	 

	 


endmodule
