////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : MUX12.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:27
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/MUX12.sch MUX12.vf
//Design Name: MUX12
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module MUX12(CI, 
             DI, 
             S, 
             O);

    input [11:0] CI;
    input [11:0] DI;
    input S;
   output [11:0] O;
   
   
   MUXCY XLXI_1 (.CI(CI[11]), 
                 .DI(DI[11]), 
                 .S(S), 
                 .O(O[11]));
   MUXCY XLXI_2 (.CI(CI[10]), 
                 .DI(DI[10]), 
                 .S(S), 
                 .O(O[10]));
   MUXCY XLXI_3 (.CI(CI[9]), 
                 .DI(DI[9]), 
                 .S(S), 
                 .O(O[9]));
   MUXCY XLXI_4 (.CI(CI[8]), 
                 .DI(DI[8]), 
                 .S(S), 
                 .O(O[8]));
   MUXCY XLXI_6 (.CI(CI[7]), 
                 .DI(DI[7]), 
                 .S(S), 
                 .O(O[7]));
   MUXCY XLXI_7 (.CI(CI[6]), 
                 .DI(DI[6]), 
                 .S(S), 
                 .O(O[6]));
   MUXCY XLXI_8 (.CI(CI[5]), 
                 .DI(DI[5]), 
                 .S(S), 
                 .O(O[5]));
   MUXCY XLXI_9 (.CI(CI[4]), 
                 .DI(DI[4]), 
                 .S(S), 
                 .O(O[4]));
   MUXCY XLXI_10 (.CI(CI[3]), 
                  .DI(DI[3]), 
                  .S(S), 
                  .O(O[3]));
   MUXCY XLXI_11 (.CI(CI[2]), 
                  .DI(DI[2]), 
                  .S(S), 
                  .O(O[2]));
   MUXCY XLXI_12 (.CI(CI[1]), 
                  .DI(DI[1]), 
                  .S(S), 
                  .O(O[1]));
   MUXCY XLXI_13 (.CI(CI[0]), 
                  .DI(DI[0]), 
                  .S(S), 
                  .O(O[0]));
endmodule
