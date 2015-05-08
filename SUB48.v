////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : SUB48.vf
// /___/   /\     Timestamp : 03/20/2009 16:03:30
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family spartan3a -w F:/FPGA/AFG3000_0316_New/SUB48.sch SUB48.vf
//Design Name: SUB48
//Device: spartan3a
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module SUB48(A, 
             ADD, 
             B, 
             CO, 
             OFL, 
             S);

    input [47:0] A;
    input ADD;
    input [48:0] B;
   output CO;
   output OFL;
   output [47:0] S;
   
   
   ADDSUB48 XLXI_4 (.A(A[47:0]), 
                    .ADD(ADD), 
                    .B(B[48:1]), 
                    .CI(B[0]), 
                    .CO(CO), 
                    .OFL(OFL), 
                    .S(S[47:0]));
endmodule
