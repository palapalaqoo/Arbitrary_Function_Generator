`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:32 05/23/2008 
// Design Name: 
// Module Name:    V1 
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
module V1(Addr_in, Addr_out,DataBus,Dout,CS,Write,Write_out);
    input [25:0] Addr_in;
    output [25:0] Addr_out;
	 output [15:0] Dout;					//used for writing
	 input Write;
	 input CS;
	 input [15:0] DataBus;
	 output Write_out;

	 
	 assign Addr_out=Addr_in; 	
	 assign Write_out=(~CS)? Write:1;//if cs=0;Writ_out=Write
	 assign Dout=DataBus;

endmodule
