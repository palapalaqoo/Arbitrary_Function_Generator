///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor      : Xilinx
// \   \   \/     Version     : Jade (J.23)
//  \   \         Description : Xilinx HDL Macro Library
//  /   /                       8-Bit Data Register with Clock Enable and Asynchronous Clear
// /___/   /\     Filename    : FD8CE.v
// \   \  /  \    Timestamp   : Tue Jul 18 2006
//  \___\/\___\
//
// Revision:
//    07/18/06 - Initial version.
// End Revision

`timescale 100 ps / 10 ps

module FD8CE(Q, C, CE, CLR, D);

   
   output [7:0]       Q;

   input 	      C;	
   input 	      CE;	
   input 	      CLR;	
   input  [7:0]       D;
   
   reg    [7:0]       Q;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  Q <= 8'b0000_0000;
	else if (CE)
          Q <= D;
     end
   
   
endmodule
