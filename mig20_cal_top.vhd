-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_cal_to.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module has the instantiations cal_ctl and tap_dly.
-------------------------------------------------------------------------------

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;

entity mig20_cal_top is
  port(
    clk         : in  std_logic;
    clk0dcmlock : in  std_logic;
    reset       : in  std_logic;
    tapfordqs   : out std_logic_vector(4 downto 0)
    );
end mig20_cal_top;

architecture arc of mig20_cal_top is

  component mig20_cal_ctl
    port (
      clk       : in  std_logic;
      reset     : in  std_logic;
      flop2     : in  std_logic_vector(31 downto 0);
      tapfordqs : out std_logic_vector(4 downto 0)
      );
  end component;

  component mig20_tap_dly
    port (
      clk   : in  std_logic;
      reset : in  std_logic;
      tapin : in  std_logic;
      flop2 : out std_logic_vector(31 downto 0)
      );
  end component;

  signal fpga_rst  : std_logic;
  signal flop2_val : std_logic_vector(31 downto 0);

begin

  fpga_rst <= (not reset) or (not clk0dcmlock);

  cal_ctl0 : mig20_cal_ctl
    port map(
      clk       => clk,
      reset     => fpga_rst,
      flop2     => flop2_val,
      tapfordqs => tapfordqs
      );

  tap_dly0 : mig20_tap_dly
    port map (
      clk   => clk,
      reset => fpga_rst,
      tapin => clk,
      flop2 => flop2_val
      );

end arc;
