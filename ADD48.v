////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : ADD48.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:14
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/ADD48.sch ADD48.vf
//Design Name: ADD48
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale  100 ps / 10 ps

module ADD16_HXILINX_ADD48 (CO, OFL, S, A, B, CI);

   
   output 	       CO;
   output 	       OFL;
   output [15:0]       S;

   input  [15:0]       A;
   input  [15:0]       B;
   input               CI;


   assign   {CO, S} = A + B + CI;
   assign   OFL     = (A[15]&B[15]&(~S[15])) | ((~A[15])&(~B[15])&S[15]); 

endmodule
`timescale 1ns / 1ps

module ADD48(A, 
             B, 
             CI, 
             CO, 
             OFL, 
             S);

    input [47:0] A;
    input [47:0] B;
    input CI;
   output CO;
   output OFL;
   output [47:0] S;
   
   wire XLXN_11;
   wire XLXN_12;
   
   ADD16_HXILINX_ADD48 XLXI_1 (.A(A[15:0]), 
                               .B(B[15:0]), 
                               .CI(CI), 
                               .CO(XLXN_11), 
                               .OFL(), 
                               .S(S[15:0]));
   // synthesis attribute HU_SET of XLXI_1 is "XLXI_1_0"
   ADD16_HXILINX_ADD48 XLXI_2 (.A(A[31:16]), 
                               .B(B[31:16]), 
                               .CI(XLXN_11), 
                               .CO(XLXN_12), 
                               .OFL(), 
                               .S(S[31:16]));
   // synthesis attribute HU_SET of XLXI_2 is "XLXI_2_1"
   ADD16_HXILINX_ADD48 XLXI_3 (.A(A[47:32]), 
                               .B(B[47:32]), 
                               .CI(XLXN_12), 
                               .CO(CO), 
                               .OFL(OFL), 
                               .S(S[47:32]));
   // synthesis attribute HU_SET of XLXI_3 is "XLXI_3_2"
endmodule
