////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.02
//  \   \         Application : xaw2verilog
//  /   /         Filename : GobalCLK.v
// /___/   /\     Timestamp : 08/11/2008 13:22:16
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -st C:\Xilinx92i\bin\nt\TRY\\GobalCLK.xaw C:\Xilinx92i\bin\nt\TRY\\GobalCLK
//Design Name: GobalCLK
//Device: xc3s1400a-fg484-4
//
// Module GobalCLK
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
// Period Jitter (unit interval) for block DCM_SP_INST = 0.15 UI
// Period Jitter (Peak-to-Peak) for block DCM_SP_INST = 0.76 ns
`timescale 1ns / 1ps

module DCM_200M(CLKIN_IN, 
                RST_IN, 
                CLKFX_OUT, 
                CLK0_OUT, 
                CLK0_OUT1, 
                LOCKED_OUT);

    input CLKIN_IN;
    input RST_IN;
   output CLKFX_OUT;
   output CLK0_OUT;
   output CLK0_OUT1;
   output LOCKED_OUT;
   
   wire CLKFB_IN;
   wire CLK0_BUF;
   wire GND_BIT;
   
   assign GND_BIT = 0;
   assign CLK0_OUT = CLKFB_IN;
   assign CLK0_OUT1 = CLK0_BUF;
	  IBUFG CLKIN_IBUFG_INST (.I(CLKIN_IN), 
                           .O(CLKIN_IBUFG));
   BUFG CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(CLKFB_IN));
   DCM_SP DCM_SP_INST (.CLKFB(CLKFB_IN), 
                       .CLKIN(CLKIN_IBUFG), 
                       .DSSEN(GND_BIT), 
                       .PSCLK(GND_BIT), 
                       .PSEN(GND_BIT), 
                       .PSINCDEC(GND_BIT), 
                       .RST(RST_IN), 
                       .CLKDV(), 
                       .CLKFX(CLKFX_OUT), 
                       .CLKFX180(), 
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
   defparam DCM_SP_INST.CLKDV_DIVIDE = 2.0;
   defparam DCM_SP_INST.CLKFX_DIVIDE = 4;		//4  		10
   defparam DCM_SP_INST.CLKFX_MULTIPLY = 15;		//15		2
   defparam DCM_SP_INST.CLKIN_DIVIDE_BY_2 = "FALSE";
   defparam DCM_SP_INST.CLKIN_PERIOD = 18.633;
   defparam DCM_SP_INST.CLKOUT_PHASE_SHIFT = "NONE";
   defparam DCM_SP_INST.DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS";
   defparam DCM_SP_INST.DFS_FREQUENCY_MODE = "LOW";
   defparam DCM_SP_INST.DLL_FREQUENCY_MODE = "LOW";
   defparam DCM_SP_INST.DUTY_CYCLE_CORRECTION = "TRUE";
   defparam DCM_SP_INST.FACTORY_JF = 16'hC080;
   defparam DCM_SP_INST.PHASE_SHIFT = 0;
   defparam DCM_SP_INST.STARTUP_WAIT = "FALSE";
endmodule