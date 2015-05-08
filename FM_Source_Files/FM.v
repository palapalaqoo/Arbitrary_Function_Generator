////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : FM.vf
// /___/   /\     Timestamp : 04/27/2009 09:01:37
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/FM.sch FM.vf
//Design Name: FM
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module FM(AD, 
          CLR, 
          C_FMCLK, 
          EXT_T, 
          FM, 
          FM_SWEEP, 
          FTW_RAM, 
          FTW1, 
          INT_EXT, 
          MAIN_CLK, 
          RAM_ADDR, 
          RAM_CE, 
          RAM_CLK, 
          RAM_DATA, 
          Sweep_marker, 
          T_Ctrl, 
          T_int_ext, 
          T_Pos_Neg, 
          FMCLK, 
          PHASE_DDS, 
          SYNC, 
          T_out);

    input [11:0] AD;
    input CLR;
    input C_FMCLK;
    input EXT_T;
    input [48:0] FM;
    input FM_SWEEP;
    input [47:0] FTW_RAM;
    input [47:0] FTW1;
    input INT_EXT;
    input MAIN_CLK;
    input [11:0] RAM_ADDR;
    input RAM_CE;
    input RAM_CLK;
    input [11:0] RAM_DATA;
    input [11:0] Sweep_marker;
    input [2:0] T_Ctrl;
    input T_int_ext;
    input T_Pos_Neg;
   output FMCLK;
   output [47:0] PHASE_DDS;
   output SYNC;
   output T_out;
   
   wire [11:0] XLXN_6;
   wire [11:0] XLXN_7;
   wire [11:0] XLXN_8;
   wire [47:0] XLXN_15;
   wire [47:0] XLXN_16;
   wire XLXN_32;
   wire XLXN_33;
   wire XLXN_36;
   wire [47:0] XLXN_61;
   wire XLXN_62;
   wire XLXN_80;
   wire XLXN_93;
   wire [47:0] XLXN_123;
   wire [47:0] XLXN_142;
   wire [59:12] XLXN_143;
   wire [47:0] XLXN_144;
   wire XLXN_146;
   wire XLXN_147;
   wire [47:0] XLXN_148;
   wire XLXN_155;
   wire XLXN_156;
   wire XLXN_158;
   wire XLXN_159;
   wire XLXN_161;
   wire XLXN_162;
   
   MUX12 XLXI_4 (.CI(XLXN_7[11:0]), 
                 .DI(XLXN_6[11:0]), 
                 .S(INT_EXT), 
                 .O(XLXN_8[11:0]));
   mux32 XLXI_5 (.CI(XLXN_61[47:0]), 
                 .DI(FTW1[47:0]), 
                 .S(FM_SWEEP), 
                 .O(XLXN_142[47:0]));
   ADD48 XLXI_6 (.A(FTW_RAM[47:0]), 
                 .B(XLXN_16[47:0]), 
                 .CI(XLXN_162), 
                 .CO(XLXN_158), 
                 .OFL(), 
                 .S(XLXN_15[47:0]));
   FD48CLR XLXI_7 (.C(XLXN_159), 
                   .CE(XLXN_155), 
                   .CLR(XLXN_156), 
                   .D(XLXN_15[47:0]), 
                   .Q(XLXN_16[47:0]));
   SUB48 XLXI_8 (.A(FTW1[47:0]), 
                 .ADD(XLXN_62), 
                 .B(FM[48:0]), 
                 .CO(), 
                 .OFL(), 
                 .S(XLXN_61[47:0]));
   FD12 XLXI_12 (.C(XLXN_159), 
                 .CE(XLXN_33), 
                 .CLR(XLXN_32), 
                 .D(AD[11:0]), 
                 .O(XLXN_6[11:0]));
   DIV XLXI_13 (.CLK(MAIN_CLK), 
                .CLR(XLXN_161), 
                .Q(XLXN_159));
   GND XLXI_18 (.G(XLXN_162));
   GND XLXI_20 (.G(XLXN_32));
   VCC XLXI_21 (.P(XLXN_33));
   VCC XLXI_22 (.P(XLXN_36));
   GND XLXI_25 (.G(XLXN_62));
   MUXCY XLXI_30 (.CI(XLXN_80), 
                  .DI(XLXN_159), 
                  .S(C_FMCLK), 
                  .O(FMCLK));
   GND XLXI_31 (.G(XLXN_80));
   FD48CLR XLXI_33 (.C(MAIN_CLK), 
                    .CE(XLXN_93), 
                    .CLR(CLR), 
                    .D(XLXN_148[47:0]), 
                    .Q(XLXN_123[47:0]));
   VCC XLXI_35 (.P(XLXN_93));
   FD48CLR XLXI_42 (.C(MAIN_CLK), 
                    .CE(XLXN_93), 
                    .CLR(CLR), 
                    .D(XLXN_123[47:0]), 
                    .Q(PHASE_DDS[47:0]));
   ADD48 XLXI_43 (.A(XLXN_142[47:0]), 
                  .B(XLXN_143[59:12]), 
                  .CI(XLXN_146), 
                  .CO(), 
                  .OFL(), 
                  .S(XLXN_144[47:0]));
   FD48CLR XLXI_45 (.C(XLXN_159), 
                    .CE(XLXN_147), 
                    .CLR(CLR), 
                    .D(XLXN_144[47:0]), 
                    .Q(XLXN_148[47:0]));
   GND XLXI_48 (.G(XLXN_146));
   VCC XLXI_49 (.P(XLXN_147));
   triger XLXI_50 (.A(XLXN_8[11:0]), 
                   .B(Sweep_marker[11:0]), 
                   .Input(T_Ctrl[2:0]), 
                   .INT_Triger(XLXN_16[47]), 
                   .SYNC(SYNC), 
                   .Trig_out(T_out));
   INV XLXI_52 (.I(XLXN_155), 
                .O(XLXN_156));
   GND XLXI_53 (.G(XLXN_161));
   EXT_Triger XLXI_56 (.CLK(XLXN_159), 
                       .CLR(XLXN_158), 
                       .EXT_Triger(EXT_T), 
                       .Triger_int_ext(T_int_ext), 
                       .Triger_Pos_Neg(T_Pos_Neg), 
                       .Tout(XLXN_155));
   RAM4K_V2 XLXI_57 (.addra(RAM_ADDR[11:0]), 
                     .addrb(XLXN_16[47:36]), 
                     .clka(RAM_CLK), 
                     .clkb(XLXN_159), 
                     .dina(RAM_DATA[11:0]), 
                     .wea(RAM_CE), 
                     .doutb(XLXN_7[11:0]));
   Multiplier48Bits_V2 XLXI_58 (.a(XLXN_8[11:0]), 
                                .b(FM[47:0]), 
                                .ce(XLXN_36), 
                                .clk(XLXN_159), 
                                .p(XLXN_143[59:12]));
endmodule
