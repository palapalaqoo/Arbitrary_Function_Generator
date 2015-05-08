///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor      : Xilinx
// \   \   \/     Version     : Jade (J.20)
//  \   \         Description : Xilinx HDL Macro Library 
//  /   /                       16-bit cascadable Full Adder with Carry-In, Carry-out
// /___/   /\     Filename    : ADD16.v
// \   \  /  \    Timestamp   : Mon May 08 2006
//  \___\/\___\
//
// Revision:
//    05/08/06 - Initial version.
//    CR# 234574 - 07/25/06 - Modified order of pins, SUM output pin name and logic.
// End Revision

`timescale  100 ps / 10 ps

module ADD16 (CO, OFL, S, A, B, CI);

   
   output 	       CO;
   output 	       OFL;
   output [15:0]       S;

   input  [15:0]       A;
   input  [15:0]       B;
   input               CI;


   assign   {CO, S} = A + B + CI;
   assign   OFL     = (A[15]&B[15]&(~S[15])) | ((~A[15])&(~B[15])&S[15]); 

endmodule
