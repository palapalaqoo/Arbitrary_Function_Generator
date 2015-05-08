-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_infrastructure_top.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module has instantiations clk_dcm and cal_top and generates
--		 reset signals to the design.
-------------------------------------------------------------------------------

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;
use work.mig20_parameters_0.all;

entity mig20_infrastructure_top is
  port(
    reset_in_n         : in  std_logic;
    delay_sel_val1_val : out std_logic_vector(4 downto 0);
    sys_rst_val        : out std_logic;
    sys_rst90_val      : out std_logic;
    clk_int            : in  std_logic;
    clk90_int          : in  std_logic;
    dcm_lock           : in  std_logic;
    sys_rst180_val     : out std_logic;
    wait_200us         : out std_logic
    );

end mig20_infrastructure_top;

architecture arc of mig20_infrastructure_top is

  component mig20_cal_top
    port (
      clk         : in  std_logic;
      clk0dcmlock : in  std_logic;
      reset       : in  std_logic;
      tapfordqs   : out std_logic_vector(4 downto 0)
      );
  end component;

  signal user_rst       : std_logic;
  signal user_cal_rst   : std_logic;
  signal sys_rst_o      : std_logic;
  signal sys_rst_1      : std_logic := '1';
  signal sys_rst        : std_logic;
  signal sys_rst90_o    : std_logic;
  signal sys_rst90_1    : std_logic := '1';
  signal sys_rst90      : std_logic;
  signal sys_rst180_o   : std_logic;
  signal sys_rst180_1   : std_logic := '1';
  signal sys_rst180     : std_logic;
  signal delay_sel_val1 : std_logic_vector(4 downto 0);
  signal clk_int_val1   : std_logic;
  signal clk_int_val2   : std_logic;
  signal clk90_int_val1 : std_logic;
  signal clk90_int_val2 : std_logic;
  signal wait_200us_i   : std_logic;
  signal wait_200us_int : std_logic;
  signal wait_clk90     : std_logic;
  signal wait_clk270    : std_logic;
  signal counter200     : std_logic_vector(15 downto 0);
  signal sys_clk_ibuf   : std_logic;

begin

  sys_rst_val        <= sys_rst;
  sys_rst90_val      <= sys_rst90;
  sys_rst180_val     <= sys_rst180;
  delay_sel_val1_val <= delay_sel_val1;
-- To remove delta delays in the clock signals observed during simulation ,
-- Following signals are used
  clk_int_val1       <= clk_int;
  clk90_int_val1     <= clk90_int;
  clk_int_val2       <= clk_int_val1;
  clk90_int_val2     <= clk90_int_val1;
  user_rst           <= not reset_in_n when RESET_ACTIVE_LOW = '1' else reset_in_n;
  user_cal_rst       <= reset_in_n     when RESET_ACTIVE_LOW = '1' else not reset_in_n;

--For 200us during power up
  process(clk_int_val2)
  begin
    if clk_int_val2'event and clk_int_val2 = '1' then
      if user_rst = '1' or dcm_lock = '0' then
        wait_200us_i   <= '1';
        counter200     <= (others => '0');
      else
        if( counter200 < 33400) then
          wait_200us_i <= '1';
          counter200   <= counter200 + 1;
        else
          counter200   <= counter200;
          wait_200us_i <= '0';
        end if;
      end if;
    end if;
  end process;

  process(clk_int_val2)
  begin
    if clk_int_val2'event and clk_int_val2 = '1' then
      wait_200us <= wait_200us_i;
    end if;
  end process;

  process(clk_int_val2)
  begin
    if clk_int_val2'event and clk_int_val2 = '1' then
      wait_200us_int <= wait_200us_i;
    end if;
  end process;

  process(clk90_int_val2)
  begin
    if clk90_int_val2'event and clk90_int_val2 = '0' then
      if user_rst = '1' or dcm_lock = '0' then
        wait_clk270 <= '1';
      else
        wait_clk270 <= wait_200us_int;
      end if;
    end if;
  end process;

  process(clk90_int_val2)
  begin
    if clk90_int_val2'event and clk90_int_val2 = '1' then
      wait_clk90 <= wait_clk270;
    end if;
  end process;

  process(clk_int_val2)
  begin
    if clk_int_val2'event and clk_int_val2 = '1' then
      if user_rst = '1' or dcm_lock = '0' or wait_200us_int = '1' then
        sys_rst_o <= '1';
        sys_rst_1 <= '1';
        sys_rst   <= '1';
      else
        sys_rst_o <= '0';
        sys_rst_1 <= sys_rst_o;
        sys_rst   <= sys_rst_1;
      end if;
    end if;
  end process;

  process(clk90_int_val2)
  begin
    if clk90_int_val2'event and clk90_int_val2 = '1' then
      if user_rst = '1' or dcm_lock = '0' or wait_clk90 = '1' then
        sys_rst90_o <= '1';
        sys_rst90_1 <= '1';
        sys_rst90   <= '1';
      else
        sys_rst90_o <= '0';
        sys_rst90_1 <= sys_rst90_o;
        sys_rst90   <= sys_rst90_1;
      end if;
    end if;
  end process;

  process(clk_int_val2)
  begin
    if clk_int_val2'event and clk_int_val2 = '0' then
      if user_rst = '1' or dcm_lock = '0' or wait_clk270 = '1' then
        sys_rst180_o <= '1';
        sys_rst180_1 <= '1';
        sys_rst180   <= '1';
      else
        sys_rst180_o <= '0';
        sys_rst180_1 <= sys_rst180_o;
        sys_rst180   <= sys_rst180_1;
      end if;
    end if;
  end process;

  cal_top0 : mig20_cal_top
    port map (
      clk         => clk_int_val2,
      clk0dcmlock => dcm_lock,
      reset       => user_cal_rst,
      tapfordqs   => delay_sel_val1
      );

end arc;
