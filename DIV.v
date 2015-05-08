////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : DIV.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:18
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/DIV.sch DIV.vf
//Design Name: DIV
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 100 ps / 10 ps

module CB4CE_HXILINX_DIV(CEO, Q0, Q1, Q2, Q3, TC, C, CE, CLR);
   
   parameter TERMINAL_COUNT = 4'b1111;
   
   output             CEO;
   output             Q0;
   output             Q1;
   output             Q2;
   output             Q3;
   output             TC;

   input 	      C;	
   input 	      CE;	
   input 	      CLR;	
   
   reg                Q0;
   reg                Q1;
   reg                Q2;
   reg                Q3;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  {Q3, Q2, Q1, Q0} <= 4'b0000;
	else if (CE)
	  {Q3, Q2, Q1,Q0} <= {Q3, Q2, Q1,Q0} + 1;
     end
   
   assign CEO = TC & CE;
   assign TC = {Q3, Q2, Q1, Q0} == TERMINAL_COUNT;
   
endmodule
`timescale 100 ps / 10 ps

module FTC_HXILINX_DIV(Q, C, CLR, T);
   
   output             Q;

   input 	      C;	
   input 	      CLR;	
   input              T;
   
   reg                Q;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  Q <= 1'b0;
	else if(T)
          Q <= !Q;
     end
   
endmodule
`timescale 1ns / 1ps

module DIV(CLK, 
           CLR, 
           Q);

    input CLK;
    input CLR;
   output Q;
   
   wire XLXN_6;
   wire XLXN_7;
   wire XLXN_9;
   wire XLXN_11;
   wire XLXN_12;
   
   FTC_HXILINX_DIV XLXI_3 (.C(XLXN_6), 
                           .CLR(CLR), 
                           .T(XLXN_9), 
                           .Q(XLXN_12));
   // synthesis attribute HU_SET of XLXI_3 is "XLXI_3_0"
   FDC XLXI_6 (.C(CLK), 
               .CLR(CLR), 
               .D(XLXN_7), 
               .Q(XLXN_6));
   defparam XLXI_6.INIT = 1'b0;
   VCC XLXI_7 (.P(XLXN_9));
   CB4CE_HXILINX_DIV XLXI_8 (.C(CLK), 
                             .CE(XLXN_9), 
                             .CLR(CLR), 
                             .CEO(), 
                             .Q0(), 
                             .Q1(), 
                             .Q2(), 
                             .Q3(), 
                             .TC(XLXN_7));
   // synthesis attribute HU_SET of XLXI_8 is "XLXI_8_1"
   FDC XLXI_9 (.C(CLK), 
               .CLR(CLR), 
               .D(XLXN_12), 
               .Q(XLXN_11));
   defparam XLXI_9.INIT = 1'b0;
   FDC XLXI_10 (.C(CLK), 
                .CLR(CLR), 
                .D(XLXN_11), 
                .Q(Q));
   defparam XLXI_10.INIT = 1'b0;
endmodule
