-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_s3_dm_iob_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module instantiates DDR IOB output flip-flops, and an
--               output buffer for the data mask bits.
-------------------------------------------------------------------------------

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;
use work.mig20_parameters_0.all;

entity mig20_s3_dm_iob_0 is
  port (
    ddr_dm       : out std_logic;   --Data mask output
    mask_falling : in std_logic;    --Mask output on falling edge
    mask_rising  : in std_logic;    --Mask output on rising edge
    clk90        : in std_logic
    );
end mig20_s3_dm_iob_0;

architecture arc of mig20_s3_dm_iob_0 is

--***********************************************************************\
-- Internal signal declaration
--***********************************************************************/

  signal mask_o : std_logic;
  signal gnd    : std_logic;
  signal vcc    : std_logic;
  signal clk270 : std_logic;
begin

  gnd    <= '0';
  vcc    <= '1';
  clk270 <= not clk90;

-- Data Mask Output during a write command

  DDR_DM0_OUT : FDDRRSE
    port map (
      Q  => mask_o,
      C0 => clk270,
      C1 => clk90,
      CE => vcc,
      D0 => mask_rising,
      D1 => mask_falling,
      R  => gnd,
      S  => gnd
      );

  DM1_OBUF : OBUF
    port map (
      I => mask_o,
      O => ddr_dm
      );
  
end arc;
