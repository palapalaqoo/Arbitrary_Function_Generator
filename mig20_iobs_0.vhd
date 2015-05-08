-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_iobs_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module has the instantiations infrastructure_iobs,
--                data_path_iobs and controller_iobs modules.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mig20_parameters_0.all;


library UNISIM;
use UNISIM.VCOMPONENTS.all;


entity mig20_iobs_0 is
  port(
    clk                : in    std_logic;
    clk90              : in    std_logic;
    ddr_rasb_cntrl     : in    std_logic;
    ddr_casb_cntrl     : in    std_logic;
    ddr_web_cntrl      : in    std_logic;
    ddr_cke_cntrl      : in    std_logic;
    ddr_csb_cntrl      : in    std_logic;
    ddr_address_cntrl  : in    std_logic_vector((ROW_ADDRESS -1) downto 0);
    ddr_ba_cntrl       : in    std_logic_vector((BANK_ADDRESS -1) downto 0);
    ddr_odt_cntrl      : in std_logic;
    rst_dqs_div_int    : in std_logic;
    dqs_reset          : in std_logic;
    dqs_enable         : in std_logic;
    ddr_dqs            : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    ddr_dqs_n         : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
 
    ddr_dq             : inout std_logic_vector((DATA_WIDTH-1) downto 0);
    write_data_falling : in    std_logic_vector((DATA_WIDTH-1) downto 0);
    write_data_rising  : in    std_logic_vector((DATA_WIDTH-1) downto 0);
    write_en_val       : in    std_logic;
    data_mask_f        : in std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    data_mask_r        : in std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    ddr_odt            : out   std_logic;
    ddr2_ck            : out  std_logic_vector((CLK_WIDTH-1)  downto 0);
    ddr2_ck_n          : out  std_logic_vector((CLK_WIDTH-1)  downto 0);
    ddr_rasb           : out   std_logic;
    ddr_casb           : out   std_logic;
    ddr_web            : out   std_logic;
    ddr_ba             : out   std_logic_vector((BANK_ADDRESS -1) downto 0);
    ddr_address        : out   std_logic_vector((ROW_ADDRESS -1) downto 0);
    ddr_cke            : out   std_logic;
    ddr_csb            : out   std_logic;
    rst_dqs_div        : out   std_logic;
    rst_dqs_div_in     : in    std_logic;
    rst_dqs_div_out    : out   std_logic;
    dqs_int_delay_in   : out std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
       ddr_dm           : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    dq                 : out   std_logic_vector((DATA_WIDTH-1) downto 0)
    );
end mig20_iobs_0;


architecture arc of mig20_iobs_0 is

  component mig20_infrastructure_iobs_0
    port(
      ddr2_ck   : out  std_logic_vector((CLK_WIDTH-1)  downto 0);
      ddr2_ck_n : out  std_logic_vector((CLK_WIDTH-1)  downto 0);
      clk0  : in std_logic
      );
  end component;


  component mig20_controller_iobs_0
    port(
      clk0              : in  std_logic;
      ddr_rasb_cntrl    : in  std_logic;
      ddr_casb_cntrl    : in  std_logic;
      ddr_web_cntrl     : in  std_logic;
      ddr_cke_cntrl     : in  std_logic;
      ddr_csb_cntrl     : in  std_logic;
      ddr_address_cntrl : in  std_logic_vector((ROW_ADDRESS -1) downto 0);
      ddr_ba_cntrl      : in  std_logic_vector((BANK_ADDRESS -1) downto 0);
      ddr_odt_cntrl     : in  std_logic;
      rst_dqs_div_int   : in  std_logic;
      ddr_rasb          : out std_logic;
      ddr_casb          : out std_logic;
      ddr_web           : out std_logic;
      ddr_ba            : out std_logic_vector((BANK_ADDRESS -1) downto 0);
      ddr_address       : out std_logic_vector((ROW_ADDRESS -1) downto 0);
      ddr_cke           : out std_logic;
      ddr_csb           : out std_logic;
      ddr_ODT           : out std_logic;
      rst_dqs_div       : out std_logic;
      rst_dqs_div_in    : in  std_logic;
      rst_dqs_div_out   : out std_logic
      );
  end component;


  component mig20_data_path_iobs_0
    port(
      clk                : in    std_logic;
      clk90              : in    std_logic;
      dqs_reset          : in    std_logic;
      dqs_enable         : in    std_logic;
      ddr_dq             : inout std_logic_vector((DATA_WIDTH-1) downto 0);
      ddr_dqs            : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    ddr_dqs_n         : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
 
      write_data_falling : in    std_logic_vector((DATA_WIDTH-1) downto 0);
      write_data_rising  : in    std_logic_vector((DATA_WIDTH-1) downto 0);
      write_en_val       : in    std_logic;
      data_mask_f        : in std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      data_mask_r        : in std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      dqs_int_delay_in   : out std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
         ddr_dm           : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      ddr_dq_val         : out   std_logic_vector((DATA_WIDTH-1) downto 0)
      );
  end component;

begin


  infrastructure_iobs0 : mig20_infrastructure_iobs_0
    port map (
      clk0      => clk,
      ddr2_ck   => ddr2_ck,
      ddr2_ck_n => ddr2_ck_n
      );

  controller_iobs0 : mig20_controller_iobs_0
    port map (
      clk0              => clk,
      ddr_rasb_cntrl    => ddr_rasb_cntrl,
      ddr_casb_cntrl    => ddr_casb_cntrl,
      ddr_web_cntrl     => ddr_web_cntrl,
      ddr_cke_cntrl     => ddr_cke_cntrl,
      ddr_csb_cntrl     => ddr_csb_cntrl,
      ddr_odt_cntrl     => ddr_odt_cntrl,
      ddr_address_cntrl => ddr_address_cntrl((ROW_ADDRESS -1) downto 0),
      ddr_ba_cntrl      => ddr_ba_cntrl((BANK_ADDRESS -1) downto 0),
      rst_dqs_div_int   => rst_dqs_div_int,
      ddr_rasb          => ddr_rasb,
      ddr_casb          => ddr_casb,
      ddr_web           => ddr_web,
      ddr_ba            => ddr_ba((BANK_ADDRESS -1) downto 0),
      ddr_address       => ddr_address((ROW_ADDRESS -1) downto 0),
      ddr_cke           => ddr_cke,
      ddr_csb           => ddr_csb,
      ddr_odt           => ddr_odt,
      rst_dqs_div       => rst_dqs_div,
      rst_dqs_div_in    => rst_dqs_div_in,
      rst_dqs_div_out   => rst_dqs_div_out
      );

  datapath_iobs0 : mig20_data_path_iobs_0
    port map (
      clk                => clk,
      clk90              => clk90,
      dqs_reset          => dqs_reset,
      dqs_enable         => dqs_enable,
      ddr_dqs            => ddr_dqs,
    ddr_dqs_n         => ddr_dqs_n,
      ddr_dq             => ddr_dq,
      write_data_falling => write_data_falling,
      write_data_rising  => write_data_rising,
      write_en_val       => write_en_val,
      data_mask_f        => data_mask_f,
      data_mask_r        => data_mask_r,
      dqs_int_delay_in   => dqs_int_delay_in,
       ddr_dm             =>   ddr_dm,
      ddr_dq_val         => dq
    );

end arc;
