////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : ADDSUB48.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:16
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/ADDSUB48.sch ADDSUB48.vf
//Design Name: ADDSUB48
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale  100 ps / 10 ps

module ADSU16_HXILINX_ADDSUB48 (CO, OFL, S, A, ADD, B, CI);

   
   output             CO;
   output             OFL;
   output [15:0]      S;

   input  [15:0]      A;
   input  	      ADD;
   input  [15:0]      B;
   input              CI;

   reg    [16:0]      adsu_tmp;  

   always @ (A, ADD, B, CI) 
   begin
      if(ADD)
         adsu_tmp = A + B + CI;
      else
         adsu_tmp = A - (!CI) - B;
   end

   assign S   =  adsu_tmp[15:0];
   assign CO  =  ADD ? adsu_tmp[16] : ~adsu_tmp[16];
   assign OFL =  ADD ? ( (A[15] & B[15] & (~S[15])) | ((~A[15]) & (~B[15]) & S[15]) ) : ( (A[15] & (~B[15]) & (~S[15])) | ((~A[15]) & B[15] & S[15]) );

endmodule
`timescale 1ns / 1ps

module ADDSUB48(A, 
                ADD, 
                B, 
                CI, 
                CO, 
                OFL, 
                S);

    input [47:0] A;
    input ADD;
    input [47:0] B;
    input CI;
   output CO;
   output OFL;
   output [47:0] S;
   
   wire XLXN_5;
   wire XLXN_9;
   
   ADSU16_HXILINX_ADDSUB48 XLXI_1 (.A(A[15:0]), 
                                   .ADD(ADD), 
                                   .B(B[15:0]), 
                                   .CI(CI), 
                                   .CO(XLXN_5), 
                                   .OFL(), 
                                   .S(S[15:0]));
   // synthesis attribute HU_SET of XLXI_1 is "XLXI_1_0"
   ADSU16_HXILINX_ADDSUB48 XLXI_2 (.A(A[31:16]), 
                                   .ADD(ADD), 
                                   .B(B[31:16]), 
                                   .CI(XLXN_5), 
                                   .CO(XLXN_9), 
                                   .OFL(), 
                                   .S(S[31:16]));
   // synthesis attribute HU_SET of XLXI_2 is "XLXI_2_1"
   ADSU16_HXILINX_ADDSUB48 XLXI_3 (.A(A[47:32]), 
                                   .ADD(ADD), 
                                   .B(B[47:32]), 
                                   .CI(XLXN_9), 
                                   .CO(CO), 
                                   .OFL(OFL), 
                                   .S(S[47:32]));
   // synthesis attribute HU_SET of XLXI_3 is "XLXI_3_2"
endmodule
