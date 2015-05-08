-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_parameters_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module has the instantiations s3_dq_iob, s3_dqs_iob and s3_dm_iob modules.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
use work.mig20_parameters_0.all;

entity mig20_data_path_iobs_0 is
  port(
    clk                : in    std_logic;
    clk90              : in    std_logic;
    dqs_reset          : in    std_logic;
    dqs_enable         : in    std_logic;
    ddr_dqs            : inout std_logic_vector((DATA_STROBE_WIDTH -1) downto 0);
    ddr_dqs_n          : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    ddr_dq             : inout std_logic_vector((DATA_WIDTH-1) downto 0);
    write_data_falling : in    std_logic_vector((DATA_WIDTH-1) downto 0);
    write_data_rising  : in    std_logic_vector((DATA_WIDTH-1) downto 0);
    write_en_val       : in    std_logic;
    data_mask_f        : in std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    data_mask_r        : in std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    dqs_int_delay_in   : out std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    ddr_dm           : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    ddr_dq_val         : out   std_logic_vector((DATA_WIDTH-1) downto 0)
    );
end mig20_data_path_iobs_0;

architecture arc of mig20_data_path_iobs_0 is

  component  mig20_s3_dqs_iob
    port(
      clk            : in std_logic;
      ddr_dqs_reset  : in std_logic;
      ddr_dqs_enable : in std_logic;
      ddr_dqs        : inout std_logic;
      ddr_dqs_n      : inout std_logic;
      dqs            : out std_logic
      );
  end component;

  component mig20_s3_dq_iob
    port (
      ddr_dq_inout       : inout std_logic;  --Bi-directional SDRAM data bus
      write_data_falling : in    std_logic;  --Transmit data, output on falling edge
      write_data_rising  : in    std_logic;  --Transmit data, output on rising edge
      read_data_in       : out   std_logic;  -- Received data
      clk90              : in    std_logic;
      write_en_val       : in    std_logic
      );
  end component;

  component   mig20_s3_dm_iob_0
port (
      ddr_dm       : out std_logic;
      mask_falling : in std_logic;
      mask_rising  : in std_logic;
      clk90        : in std_logic      
	  );
end component;

  signal ddr_dq_in  : std_logic_vector((DATA_WIDTH-1) downto 0);

begin

  ddr_dq_val <= ddr_dq_in;

  gen_dm: for dm_i in 0 to DATA_MASK_WIDTH-1 generate
    s3_dm_iob_inst : mig20_s3_dm_iob_0
      port map (
        ddr_dm       => ddr_dm(dm_i),
        mask_falling => data_mask_f(dm_i),
        mask_rising  => data_mask_r(dm_i),
        clk90        => clk90
        );
  end generate;

--***********************************************************************
--    Read Data Capture Module Instantiations
--***********************************************************************
-- DQS IOB instantiations
--***********************************************************************
  
  gen_dqs: for dqs_i in 0 to DATA_STROBE_WIDTH-1 generate
    s3_dqs_iob_inst : mig20_s3_dqs_iob 
      port map (
        clk             => clk,
        ddr_dqs_reset   => dqs_reset,
        ddr_dqs_enable  => dqs_enable,
        ddr_dqs         => ddr_dqs(dqs_i),
        ddr_dqs_n       => ddr_dqs_n(dqs_i),
        dqs             => dqs_int_delay_in(dqs_i)
        );
  end generate;



--******************************************************************************
-- DDR Data bit instantiations
--******************************************************************************

  gen_dq: for dq_i in 0 to DATA_WIDTH-1 generate
    s3_dq_iob_inst : mig20_s3_dq_iob
      port map (
        ddr_dq_inout       => ddr_dq(dq_i),
        write_data_falling => write_data_falling(dq_i),
        write_data_rising  => write_data_rising(dq_i),
        read_data_in       => ddr_dq_in(dq_i),
        clk90              => clk90,
        write_en_val       => write_en_val
        );
  end generate;

end arc;
