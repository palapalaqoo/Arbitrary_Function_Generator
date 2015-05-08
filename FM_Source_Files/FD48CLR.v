////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : FD48CLR.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:22
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/FD48CLR.sch FD48CLR.vf
//Design Name: FD48CLR
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 100 ps / 10 ps

module FD16CE_HXILINX_FD48CLR(Q, C, CE, CLR, D);

   
   output [15:0]      Q;

   input 	      C;	
   input 	      CE;	
   input 	      CLR;	
   input  [15:0]      D;
   
   reg    [15:0]      Q;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  Q <= 16'b0000_0000_0000_0000;
	else if (CE)
          Q <= D;
     end
   
   
endmodule
`timescale 1ns / 1ps

module FD48CLR(C, 
               CE, 
               CLR, 
               D, 
               Q);

    input C;
    input CE;
    input CLR;
    input [47:0] D;
   output [47:0] Q;
   
   
   FD16CE_HXILINX_FD48CLR XLXI_1 (.C(C), 
                                  .CE(CE), 
                                  .CLR(CLR), 
                                  .D(D[15:0]), 
                                  .Q(Q[15:0]));
   // synthesis attribute HU_SET of XLXI_1 is "XLXI_1_0"
   FD16CE_HXILINX_FD48CLR XLXI_4 (.C(C), 
                                  .CE(CE), 
                                  .CLR(CLR), 
                                  .D(D[31:16]), 
                                  .Q(Q[31:16]));
   // synthesis attribute HU_SET of XLXI_4 is "XLXI_4_1"
   FD16CE_HXILINX_FD48CLR XLXI_5 (.C(C), 
                                  .CE(CE), 
                                  .CLR(CLR), 
                                  .D(D[47:32]), 
                                  .Q(Q[47:32]));
   // synthesis attribute HU_SET of XLXI_5 is "XLXI_5_2"
endmodule
