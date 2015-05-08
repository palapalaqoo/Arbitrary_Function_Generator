////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : xaw2verilog
//  /   /         Filename : DIV4.v
// /___/   /\     Timestamp : 12/02/2009 17:28:41
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -intstyle D:/AFG3000 project/FPGA/AFG3000_FPGA_20091031_BACKUP_CANBEUSE/AFG3000_FPGA_20091031_BACKUP/AFG3000_FPGA_0504_BACKUP/DIV4.xaw -st DIV4.v
//Design Name: DIV4
//Device: xc3s1400a-4fg484
//
// Module DIV4
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
// Period Jitter (unit interval) for block DCM_SP_INST = 0.15 UI
// Period Jitter (Peak-to-Peak) for block DCM_SP_INST = 0.69 ns
`timescale 1ns / 1ps

module DIV4(CLKIN_IN, 
            RST_IN, 
            CLKDV_OUT, 
            CLKFX_OUT, 
            CLKFX180_OUT, 
            CLK0_OUT, 
            LOCKED_OUT);

    input CLKIN_IN;
    input RST_IN;
   output CLKDV_OUT;
   output CLKFX_OUT;
   output CLKFX180_OUT;
   output CLK0_OUT;
   output LOCKED_OUT;
   
   wire CLKDV_BUF;
   wire CLKFB_IN;
   wire CLKFX_BUF;
   wire CLKFX180_BUF;
   wire CLK0_BUF;
   wire GND_BIT;
   
   assign GND_BIT = 0;
   assign CLK0_OUT = CLKFB_IN;
   BUFG CLKDV_BUFG_INST (.I(CLKDV_BUF), 
                         .O(CLKDV_OUT));
   BUFG CLKFX_BUFG_INST (.I(CLKFX_BUF), 
                         .O(CLKFX_OUT));
   BUFG CLKFX180_BUFG_INST (.I(CLKFX180_BUF), 
                            .O(CLKFX180_OUT));
   BUFG CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(CLKFB_IN));
   DCM_SP DCM_SP_INST (.CLKFB(CLKFB_IN), 
                       .CLKIN(CLKIN_IN), 
                       .DSSEN(GND_BIT), 
                       .PSCLK(GND_BIT), 
                       .PSEN(GND_BIT), 
                       .PSINCDEC(GND_BIT), 
                       .RST(RST_IN), 
                       .CLKDV(CLKDV_BUF), 
                       .CLKFX(CLKFX_BUF), 
                       .CLKFX180(CLKFX180_BUF), 
                       .CLK0(CLK0_BUF), 
                       .CLK2X(), 
                       .CLK2X180(), 
                       .CLK90(), 
                       .CLK180(), 
                       .CLK270(), 
                       .LOCKED(LOCKED_OUT), 
                       .PSDONE(), 
                       .STATUS());
   defparam DCM_SP_INST.CLK_FEEDBACK = "1X";
   defparam DCM_SP_INST.CLKDV_DIVIDE = 4.0;
   defparam DCM_SP_INST.CLKFX_DIVIDE = 1;
   defparam DCM_SP_INST.CLKFX_MULTIPLY = 4;
   defparam DCM_SP_INST.CLKIN_DIVIDE_BY_2 = "FALSE";
   defparam DCM_SP_INST.CLKIN_PERIOD = 18.626;
   defparam DCM_SP_INST.CLKOUT_PHASE_SHIFT = "NONE";
   defparam DCM_SP_INST.DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS";
   defparam DCM_SP_INST.DFS_FREQUENCY_MODE = "LOW";
   defparam DCM_SP_INST.DLL_FREQUENCY_MODE = "LOW";
   defparam DCM_SP_INST.DUTY_CYCLE_CORRECTION = "TRUE";
   defparam DCM_SP_INST.FACTORY_JF = 16'hC080;
   defparam DCM_SP_INST.PHASE_SHIFT = 0;
   defparam DCM_SP_INST.STARTUP_WAIT = "FALSE";
endmodule