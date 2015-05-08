-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_fifo_0_wr_en_0.v
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module generate the write enable signal to the fifos,
--               which are driven by negedge of data strobe
-------------------------------------------------------------------------------

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;

entity mig20_fifo_0_wr_en_0 is
  port (
    clk             : in  std_logic;
    reset           : in  std_logic;
    din             : in  std_logic;
    rst_dqs_delay_n : out std_logic;
    dout            : out std_logic
    );

end mig20_fifo_0_wr_en_0;

architecture arc of mig20_fifo_0_wr_en_0 is

  signal din_delay : std_ulogic;
  signal tie_high  : std_ulogic;
  
begin

  rst_dqs_delay_n <= not din_delay;
  dout            <= din or din_delay;
  tie_high        <= '1';

  delay_ff : FDCE
    port map (
      Q   => din_delay,
      C   => clk,
      CE  => tie_high,
      CLR => reset,
      D   => din
      );

end arc;
