////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : mux32.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:28
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/mux32.sch mux32.vf
//Design Name: mux32
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module mux32(CI, 
             DI, 
             S, 
             O);

    input [47:0] CI;
    input [47:0] DI;
    input S;
   output [47:0] O;
   
   
   MUXCY XLXI_1 (.CI(CI[47]), 
                 .DI(DI[47]), 
                 .S(S), 
                 .O(O[47]));
   MUXCY XLXI_2 (.CI(CI[46]), 
                 .DI(DI[46]), 
                 .S(S), 
                 .O(O[46]));
   MUXCY XLXI_3 (.CI(CI[45]), 
                 .DI(DI[45]), 
                 .S(S), 
                 .O(O[45]));
   MUXCY XLXI_4 (.CI(CI[44]), 
                 .DI(DI[44]), 
                 .S(S), 
                 .O(O[44]));
   MUXCY XLXI_37 (.CI(CI[39]), 
                  .DI(DI[39]), 
                  .S(S), 
                  .O(O[39]));
   MUXCY XLXI_38 (.CI(CI[38]), 
                  .DI(DI[38]), 
                  .S(S), 
                  .O(O[38]));
   MUXCY XLXI_39 (.CI(CI[37]), 
                  .DI(DI[37]), 
                  .S(S), 
                  .O(O[37]));
   MUXCY XLXI_40 (.CI(CI[36]), 
                  .DI(DI[36]), 
                  .S(S), 
                  .O(O[36]));
   MUXCY XLXI_41 (.CI(CI[31]), 
                  .DI(DI[31]), 
                  .S(S), 
                  .O(O[31]));
   MUXCY XLXI_42 (.CI(CI[30]), 
                  .DI(DI[30]), 
                  .S(S), 
                  .O(O[30]));
   MUXCY XLXI_43 (.CI(CI[29]), 
                  .DI(DI[29]), 
                  .S(S), 
                  .O(O[29]));
   MUXCY XLXI_44 (.CI(CI[28]), 
                  .DI(DI[28]), 
                  .S(S), 
                  .O(O[28]));
   MUXCY XLXI_45 (.CI(CI[23]), 
                  .DI(DI[23]), 
                  .S(S), 
                  .O(O[23]));
   MUXCY XLXI_46 (.CI(CI[22]), 
                  .DI(DI[22]), 
                  .S(S), 
                  .O(O[22]));
   MUXCY XLXI_47 (.CI(CI[21]), 
                  .DI(DI[21]), 
                  .S(S), 
                  .O(O[21]));
   MUXCY XLXI_48 (.CI(CI[20]), 
                  .DI(DI[20]), 
                  .S(S), 
                  .O(O[20]));
   MUXCY XLXI_49 (.CI(CI[43]), 
                  .DI(DI[43]), 
                  .S(S), 
                  .O(O[43]));
   MUXCY XLXI_50 (.CI(CI[42]), 
                  .DI(DI[42]), 
                  .S(S), 
                  .O(O[42]));
   MUXCY XLXI_51 (.CI(CI[41]), 
                  .DI(DI[41]), 
                  .S(S), 
                  .O(O[41]));
   MUXCY XLXI_52 (.CI(CI[40]), 
                  .DI(DI[40]), 
                  .S(S), 
                  .O(O[40]));
   MUXCY XLXI_53 (.CI(CI[35]), 
                  .DI(DI[35]), 
                  .S(S), 
                  .O(O[35]));
   MUXCY XLXI_54 (.CI(CI[34]), 
                  .DI(DI[34]), 
                  .S(S), 
                  .O(O[34]));
   MUXCY XLXI_55 (.CI(CI[33]), 
                  .DI(DI[33]), 
                  .S(S), 
                  .O(O[33]));
   MUXCY XLXI_56 (.CI(CI[32]), 
                  .DI(DI[32]), 
                  .S(S), 
                  .O(O[32]));
   MUXCY XLXI_57 (.CI(CI[27]), 
                  .DI(DI[27]), 
                  .S(S), 
                  .O(O[27]));
   MUXCY XLXI_58 (.CI(CI[26]), 
                  .DI(DI[26]), 
                  .S(S), 
                  .O(O[26]));
   MUXCY XLXI_59 (.CI(CI[25]), 
                  .DI(DI[25]), 
                  .S(S), 
                  .O(O[25]));
   MUXCY XLXI_60 (.CI(CI[24]), 
                  .DI(DI[24]), 
                  .S(S), 
                  .O(O[24]));
   MUXCY XLXI_61 (.CI(CI[19]), 
                  .DI(DI[19]), 
                  .S(S), 
                  .O(O[19]));
   MUXCY XLXI_62 (.CI(CI[18]), 
                  .DI(DI[18]), 
                  .S(S), 
                  .O(O[18]));
   MUXCY XLXI_63 (.CI(CI[17]), 
                  .DI(DI[17]), 
                  .S(S), 
                  .O(O[17]));
   MUXCY XLXI_64 (.CI(CI[16]), 
                  .DI(DI[16]), 
                  .S(S), 
                  .O(O[16]));
   MUXCY XLXI_97 (.CI(CI[15]), 
                  .DI(DI[15]), 
                  .S(S), 
                  .O(O[15]));
   MUXCY XLXI_98 (.CI(CI[14]), 
                  .DI(DI[14]), 
                  .S(S), 
                  .O(O[14]));
   MUXCY XLXI_99 (.CI(CI[13]), 
                  .DI(DI[13]), 
                  .S(S), 
                  .O(O[13]));
   MUXCY XLXI_100 (.CI(CI[12]), 
                   .DI(DI[12]), 
                   .S(S), 
                   .O(O[12]));
   MUXCY XLXI_101 (.CI(CI[11]), 
                   .DI(DI[11]), 
                   .S(S), 
                   .O(O[11]));
   MUXCY XLXI_102 (.CI(CI[10]), 
                   .DI(DI[10]), 
                   .S(S), 
                   .O(O[10]));
   MUXCY XLXI_103 (.CI(CI[9]), 
                   .DI(DI[9]), 
                   .S(S), 
                   .O(O[9]));
   MUXCY XLXI_104 (.CI(CI[8]), 
                   .DI(DI[8]), 
                   .S(S), 
                   .O(O[8]));
   MUXCY XLXI_105 (.CI(CI[7]), 
                   .DI(DI[7]), 
                   .S(S), 
                   .O(O[7]));
   MUXCY XLXI_106 (.CI(CI[6]), 
                   .DI(DI[6]), 
                   .S(S), 
                   .O(O[6]));
   MUXCY XLXI_107 (.CI(CI[5]), 
                   .DI(DI[5]), 
                   .S(S), 
                   .O(O[5]));
   MUXCY XLXI_108 (.CI(CI[4]), 
                   .DI(DI[4]), 
                   .S(S), 
                   .O(O[4]));
   MUXCY XLXI_109 (.CI(CI[3]), 
                   .DI(DI[3]), 
                   .S(S), 
                   .O(O[3]));
   MUXCY XLXI_110 (.CI(CI[2]), 
                   .DI(DI[2]), 
                   .S(S), 
                   .O(O[2]));
   MUXCY XLXI_111 (.CI(CI[1]), 
                   .DI(DI[1]), 
                   .S(S), 
                   .O(O[1]));
   MUXCY XLXI_112 (.CI(CI[0]), 
                   .DI(DI[0]), 
                   .S(S), 
                   .O(O[0]));
endmodule
