-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_ram8d_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module instantiates RAM16X1 premitives. There will be 8 or 4 RAM16X1
--               instances depending on the number of data bits per strobe.
-------------------------------------------------------------------------------

library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use UNISIM.VCOMPONENTS.all;
use work.mig20_parameters_0.all;

entity mig20_ram8d_0 is
  port (
    dout  : out std_logic_vector((DATABITSPERSTROBE -1) downto 0);
    waddr : in  std_logic_vector(3 downto 0);
    din   : in  std_logic_vector((DATABITSPERSTROBE -1) downto 0);
    raddr : in  std_logic_vector(3 downto 0);
    wclk0 : in  std_logic;
    wclk1 : in  std_logic;
    we    : in  std_logic
    );
end mig20_ram8d_0;

architecture arc of mig20_ram8d_0 is

begin

  fifo_bit0 : RAM16X1D
    port map (
	  DPO    => dout(0),
      A0     => waddr(0),
      A1     => waddr(1),
      A2     => waddr(2),
      A3     => waddr(3),
      D      => din(0),
      DPRA0  => raddr(0),
      DPRA1  => raddr(1),
      DPRA2  => raddr(2),
      DPRA3  => raddr(3),
      WCLK   => wclk1,
      SPO    => OPEN,
      WE     => we 
	  );

  fifo_bit1 : RAM16X1D
    port map (
	  DPO    => dout(1),
      A0     => waddr(0),
      A1     => waddr(1),
      A2     => waddr(2),
      A3     => waddr(3),
      D      => din(1),
      DPRA0  => raddr(0),
      DPRA1  => raddr(1),
      DPRA2  => raddr(2),
      DPRA3  => raddr(3),
      WCLK   => wclk0,
      SPO    => OPEN,
      WE     => we 
	  );

  fifo_bit2 : RAM16X1D
    port map (
	  DPO    => dout(2),
      A0     => waddr(0),
      A1     => waddr(1),
      A2     => waddr(2),
      A3     => waddr(3),
      D      => din(2),
      DPRA0  => raddr(0),
      DPRA1  => raddr(1),
      DPRA2  => raddr(2),
      DPRA3  => raddr(3),
      WCLK   => wclk1,
      SPO    => OPEN,
      WE     => we 
	  );

  fifo_bit3 : RAM16X1D
    port map (
	  DPO    => dout(3),
      A0     => waddr(0),
      A1     => waddr(1),
      A2     => waddr(2),
      A3     => waddr(3),
      D      => din(3),
      DPRA0  => raddr(0),
      DPRA1  => raddr(1),
      DPRA2  => raddr(2),
      DPRA3  => raddr(3),
      WCLK   => wclk0,
      SPO    => OPEN,
      WE     => we 
	  );

fifo_bit4 : RAM16X1D
    port map (
	  DPO    => dout(4),
      A0     => waddr(0),
      A1     => waddr(1),
      A2     => waddr(2),
      A3     => waddr(3),
      D      => din(4),
      DPRA0  => raddr(0),
      DPRA1  => raddr(1),
      DPRA2  => raddr(2),
      DPRA3  => raddr(3),
      WCLK   => wclk1,
      SPO    => OPEN,
      WE     => we 
	  );

  fifo_bit5 : RAM16X1D
    port map (
	  DPO    => dout(5),
      A0     => waddr(0),
      A1     => waddr(1),
      A2     => waddr(2),
      A3     => waddr(3),
      D      => din(5),
      DPRA0  => raddr(0),
      DPRA1  => raddr(1),
      DPRA2  => raddr(2),
      DPRA3  => raddr(3),
      WCLK   => wclk0,
      SPO    => OPEN,
      WE     => we 
	  );

  fifo_bit6 : RAM16X1D
    port map (
	  DPO    => dout(6),
      A0     => waddr(0),
      A1     => waddr(1),
      A2     => waddr(2),
      A3     => waddr(3),
      D      => din(6),
      DPRA0  => raddr(0),
      DPRA1  => raddr(1),
      DPRA2  => raddr(2),
      DPRA3  => raddr(3),
      WCLK   => wclk1,
      SPO    => OPEN,
      WE     => we 
	  );

  fifo_bit7 : RAM16X1D
    port map (
	  DPO    => dout(7),
      A0     => waddr(0),
      A1     => waddr(1),
      A2     => waddr(2),
      A3     => waddr(3),
      D      => din(7),
      DPRA0  => raddr(0),
      DPRA1  => raddr(1),
      DPRA2  => raddr(2),
      DPRA3  => raddr(3),
      WCLK   => wclk0,
      SPO    => OPEN,
      WE     => we 
	  );

end arc;
