`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:45 06/10/2008 
// Design Name: 
// Module Name:    RW_SELECTER 
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
module RW_SELECTER(
    READ_IN,
    WRITE_IN,
    CMD_IN_W,
    ADDR_IN_W,
    DATA_IN_W,
	 BURST_DONE_W,
    CMD_IN_R,
    ADDR_IN_R,
    DATA_IN_R,	
	 BURST_DONE_R,	
	 CMD_OUT,
    ADDR_OUT,
    DATA_OUT,
	 BURST_DONE_OUT
    );
    input READ_IN;
    input WRITE_IN;	 
	 input [2:0] CMD_IN_W;
    input [25:0] ADDR_IN_W;
    input [31:0] DATA_IN_W;
	 input BURST_DONE_W;
    input [2:0] CMD_IN_R;
    input [25:0] ADDR_IN_R;
    input [31:0] DATA_IN_R;	
	 input BURST_DONE_R;	
	 output [2:0] CMD_OUT;
    output [25:0] ADDR_OUT;
    output [31:0] DATA_OUT;
	 output BURST_DONE_OUT; 

			//if read ,then,CMD_OUT=CMD_IN_R,if write,CMD_OUT=CMD_IN_W...
assign CMD_OUT=((READ_IN)&(~WRITE_IN))? CMD_IN_R:(((~READ_IN)&(WRITE_IN))? CMD_IN_W:3'b0 ); 
assign ADDR_OUT=((READ_IN)&(~WRITE_IN))? ADDR_IN_R:(((~READ_IN)&(WRITE_IN))? ADDR_IN_W:0 );
assign DATA_OUT=DATA_IN_W;
assign BURST_DONE_OUT=((READ_IN)&(~WRITE_IN))? BURST_DONE_R:(((~READ_IN)&(WRITE_IN))? BURST_DONE_W:1'b0 );
//assign BURST_DONE_OUT=( (READ_IN)&(~WRITE_IN))? BURST_DONE_R:BURST_DONE_W;








endmodule
