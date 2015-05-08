////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : triger.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:32
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/triger.sch triger.vf
//Design Name: triger
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module triger(A, 
              B, 
              Input, 
              INT_Triger, 
              SYNC, 
              Trig_out);

    input [11:0] A;
    input [11:0] B;
    input [2:0] Input;
    input INT_Triger;
   output SYNC;
   output Trig_out;
   
   wire XLXN_1;
   wire XLXN_2;
   wire XLXN_3;
   wire XLXN_4;
   wire XLXN_5;
   wire XLXN_6;
   wire XLXN_9;
   
   compmc12 XLXI_1 (.A(A[11:0]), 
                    .B(B[11:0]), 
                    .GT(XLXN_2), 
                    .LT(XLXN_3));
   FDCP XLXI_2 (.C(XLXN_1), 
                .CLR(XLXN_2), 
                .D(XLXN_1), 
                .PRE(XLXN_3), 
                .Q(XLXN_4));
   defparam XLXI_2.INIT = 1'b0;
   MUXCY XLXI_3 (.CI(XLXN_4), 
                 .DI(XLXN_5), 
                 .S(Input[0]), 
                 .O(SYNC));
   MUXCY XLXI_4 (.CI(XLXN_9), 
                 .DI(INT_Triger), 
                 .S(Input[2]), 
                 .O(XLXN_5));
   MUXCY XLXI_5 (.CI(XLXN_5), 
                 .DI(XLXN_6), 
                 .S(Input[1]), 
                 .O(Trig_out));
   GND XLXI_6 (.G(XLXN_1));
   GND XLXI_7 (.G(XLXN_6));
   INV XLXI_8 (.I(INT_Triger), 
               .O(XLXN_9));
endmodule
