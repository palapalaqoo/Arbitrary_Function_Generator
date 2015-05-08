////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : EXT_Triger.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:20
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/EXT_Triger.sch EXT_Triger.vf
//Design Name: EXT_Triger
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module EXT_Triger(CLK, 
                  CLR, 
                  EXT_Triger, 
                  Triger_int_ext, 
                  Triger_Pos_Neg, 
                  Tout);

    input CLK;
    input CLR;
    input EXT_Triger;
    input Triger_int_ext;
    input Triger_Pos_Neg;
   output Tout;
   
   wire XLXN_2;
   wire XLXN_3;
   wire XLXN_10;
   wire XLXN_11;
   wire XLXN_12;
   wire XLXN_13;
   wire XLXN_15;
   wire XLXN_16;
   wire XLXN_17;
   
   FD XLXI_1 (.C(CLK), 
              .D(EXT_Triger), 
              .Q(XLXN_2));
   defparam XLXI_1.INIT = 1'b0;
   FD XLXI_2 (.C(CLK), 
              .D(XLXN_2), 
              .Q(XLXN_3));
   defparam XLXI_2.INIT = 1'b0;
   XOR2 XLXI_3 (.I0(XLXN_3), 
                .I1(XLXN_2), 
                .O(XLXN_13));
   AND2 XLXI_4 (.I0(XLXN_13), 
                .I1(EXT_Triger), 
                .O(XLXN_16));
   FDCP XLXI_5 (.C(XLXN_10), 
                .CLR(CLR), 
                .D(XLXN_10), 
                .PRE(XLXN_15), 
                .Q(XLXN_11));
   defparam XLXI_5.INIT = 1'b0;
   MUXCY XLXI_6 (.CI(XLXN_11), 
                 .DI(XLXN_12), 
                 .S(Triger_int_ext), 
                 .O(Tout));
   GND XLXI_7 (.G(XLXN_10));
   VCC XLXI_8 (.P(XLXN_12));
   AND2B1 XLXI_9 (.I0(EXT_Triger), 
                  .I1(XLXN_13), 
                  .O(XLXN_17));
   MUXCY XLXI_10 (.CI(XLXN_17), 
                  .DI(XLXN_16), 
                  .S(Triger_Pos_Neg), 
                  .O(XLXN_15));
endmodule
