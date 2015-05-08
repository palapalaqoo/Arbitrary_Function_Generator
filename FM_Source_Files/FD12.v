////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : FD12.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:21
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/FD12.sch FD12.vf
//Design Name: FD12
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 100 ps / 10 ps

module FD8CE_HXILINX_FD12(Q, C, CE, CLR, D);

   
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
`timescale 100 ps / 10 ps

module FD4CE_HXILINX_FD12(Q0, Q1, Q2, Q3, C, CE, CLR, D0, D1, D2, D3);
   
   output             Q0;
   output             Q1;
   output             Q2;
   output             Q3;

   input 	      C;	
   input 	      CE;	
   input 	      CLR;	
   input              D0;
   input              D1;
   input              D2;
   input              D3;
   
   reg                Q0;
   reg                Q1;
   reg                Q2;
   reg                Q3;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  {Q3, Q2, Q1, Q0} <= 4'b0000;
	else if (CE)
          {Q3, Q2, Q1, Q0} <= {D3, D2, D1, D0};
     end
   
   
endmodule
`timescale 1ns / 1ps

module FD12(C, 
            CE, 
            CLR, 
            D, 
            O);

    input C;
    input CE;
    input CLR;
    input [11:0] D;
   output [11:0] O;
   
   
   FD4CE_HXILINX_FD12 XLXI_1 (.C(C), 
                              .CE(CE), 
                              .CLR(CLR), 
                              .D0(D[0]), 
                              .D1(D[1]), 
                              .D2(D[2]), 
                              .D3(D[3]), 
                              .Q0(O[0]), 
                              .Q1(O[1]), 
                              .Q2(O[2]), 
                              .Q3(O[3]));
   // synthesis attribute HU_SET of XLXI_1 is "XLXI_1_0"
   FD8CE_HXILINX_FD12 XLXI_2 (.C(C), 
                              .CE(CE), 
                              .CLR(CLR), 
                              .D(D[11:4]), 
                              .Q(O[11:4]));
   // synthesis attribute HU_SET of XLXI_2 is "XLXI_2_1"
endmodule
