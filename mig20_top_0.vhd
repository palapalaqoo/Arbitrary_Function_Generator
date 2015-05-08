-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_top_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     :
-------------------------------------------------------------------------------
library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use work.mig20_parameters_0.all;
use UNISIM.VCOMPONENTS.all;

entity mig20_top_0 is
  port(
    wait_200us            : in    std_logic;
    rst_dqs_div_in        : in    std_logic;
    rst_dqs_div_out       : out   std_logic;

    user_input_data       : in    std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
    user_data_mask        : in std_logic_vector(((DATA_MASK_WIDTH*2)-1) downto 0);
    user_output_data      : out   std_logic_vector(((2*DATA_WIDTH)-1)
                                                   downto 0) := (others => 'Z');
    user_data_valid       : out   std_logic;
    user_input_address    : in    std_logic_vector(((ROW_ADDRESS +
                                                     COL_AP_WIDTH + BANK_ADDRESS)-1) downto 0);
    user_command_register : in    std_logic_vector(2 downto 0);
    burst_done            : in    std_logic;
    auto_ref_req          : out   std_logic;
    user_cmd_ack          : out   std_logic;
    init_done              : out   std_logic;
    ar_done               : out   std_logic;
    ddr2_dqs              : inout std_logic_vector((DATA_STROBE_WIDTH -1) downto 0);
    ddr2_dqs_n         : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
 
    ddr2_dq               : inout std_logic_vector((DATA_WIDTH-1) downto 0)
                                                             := (others => 'Z');
    ddr2_cke              : out   std_logic;
    ddr2_cs_n             : out   std_logic;
    ddr2_ras_n            : out   std_logic;
    ddr2_cas_n            : out   std_logic;
    ddr2_we_n             : out   std_logic;
   ddr2_dm           : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    ddr2_ba               : out   std_logic_vector((BANK_ADDRESS-1) downto 0);
    ddr2_a                : out   std_logic_vector((ROW_ADDRESS-1) downto 0);
    ddr2_odt              : out   std_logic;
    ddr2_ck               : out   std_logic_vector((CLK_WIDTH-1) downto 0);
    ddr2_ck_n             : out   std_logic_vector((CLK_WIDTH-1) downto 0);
  clk_tb                : out  std_logic;
    clk90_tb          : out  std_logic;
    sys_rst_tb        : out std_logic;
    sys_rst90_tb          : out  std_logic;
    sys_rst180_tb         : out  std_logic;
    clk_int               : in    std_logic;
    clk90_int             : in    std_logic;
    delay_sel_val         : in    std_logic_vector(4 downto 0);
    sys_rst               : in    std_logic;
    sys_rst90             : in    std_logic;
    sys_rst180            : in    std_logic
    );

end mig20_top_0;

architecture arc of mig20_top_0 is

  component mig20_controller_0
    port(
      auto_ref_req      : out std_logic;
      wait_200us        : in  std_logic;
      clk               : in  std_logic;
      rst0              : in  std_logic;
      rst180            : in  std_logic;
      address           : in  std_logic_vector(((ROW_ADDRESS + COL_AP_WIDTH)-1)
                                               downto 0);
      bank_addr         : in  std_logic_vector((BANK_ADDRESS-1) downto 0);
      command_register  : in  std_logic_vector(2 downto 0);
      burst_done        : in  std_logic;
      ddr_rasb_cntrl    : out std_logic;
      ddr_casb_cntrl    : out std_logic;
      ddr_web_cntrl     : out std_logic;
      ddr_ba_cntrl      : out std_logic_vector((BANK_ADDRESS-1) downto 0);
      ddr_address_cntrl : out std_logic_vector((ROW_ADDRESS-1) downto 0);
      ddr_cke_cntrl     : out std_logic;
      ddr_csb_cntrl     : out std_logic;
      ddr_ODT_cntrl     : out std_logic;
      dqs_enable        : out std_logic;
      dqs_reset         : out std_logic;
      write_enable      : out std_logic;
      rst_calib         : out std_logic;
      rst_dqs_div_int   : out std_logic;
      cmd_ack           : out std_logic;
      init              : out std_logic;
      ar_done           : out std_logic
      );
  end component;

  component mig20_data_path_0
    port(
      user_input_data    : in  std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
      user_data_mask     : in  std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
      clk                : in  std_logic;
      clk90              : in  std_logic;
      reset              : in  std_logic;
      reset90            : in  std_logic;
      write_enable       : in  std_logic;
      rst_dqs_div_in     : in  std_logic;
      delay_sel          : in  std_logic_vector(4 downto 0);
      dqs_int_delay_in   : in  std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      dq                 : in  std_logic_vector((DATA_WIDTH-1) downto 0);
      u_data_val         : out std_logic;
      user_output_data   : out std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
      write_en_val       : out std_logic;
      data_mask_f        : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      data_mask_r        : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      write_data_falling : out std_logic_vector((DATA_WIDTH-1) downto 0);
      write_data_rising  : out std_logic_vector((DATA_WIDTH-1) downto 0)
      );
  end component;

  component mig20_infrastructure
    port(
      clk_int            : in  std_logic;
      rst_calib1         : in  std_logic;
      delay_sel_val      : in  std_logic_vector(4 downto 0);
      delay_sel_val1_val : out std_logic_vector(4 downto 0)
      );
  end component;
  
  component mig20_iobs_0
    port(
      clk                : in    std_logic;
      clk90              : in    std_logic;
      ddr_rasb_cntrl     : in    std_logic;
      ddr_casb_cntrl     : in    std_logic;
      ddr_web_cntrl      : in    std_logic;
      ddr_cke_cntrl      : in    std_logic;
      ddr_csb_cntrl      : in    std_logic;
      ddr_ODT_cntrl      : in    std_logic;
      ddr_address_cntrl  : in    std_logic_vector((ROW_ADDRESS-1) downto 0);
      ddr_ba_cntrl       : in    std_logic_vector((BANK_ADDRESS-1) downto 0);
      rst_dqs_div_int    : in    std_logic;
      dqs_reset          : in    std_logic;
      dqs_enable         : in    std_logic;
      ddr_dqs            : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    ddr_dqs_n         : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
 
      ddr_dq             : inout std_logic_vector((DATA_WIDTH-1) downto 0);
      write_data_falling : in    std_logic_vector((DATA_WIDTH-1) downto 0);
      write_data_rising  : in    std_logic_vector((DATA_WIDTH-1) downto 0);
      write_en_val       : in    std_logic;
      data_mask_f        : in    std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      data_mask_r        : in    std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      ddr_odt            : out   std_logic;
      ddr2_ck            : out   std_logic_vector((CLK_WIDTH-1) downto 0);
      ddr2_ck_n          : out   std_logic_vector((CLK_WIDTH-1) downto 0);
      ddr_rasb           : out   std_logic;
      ddr_casb           : out   std_logic;
      ddr_web            : out   std_logic;
      ddr_ba             : out   std_logic_vector((BANK_ADDRESS-1) downto 0);
      ddr_address        : out   std_logic_vector((ROW_ADDRESS-1) downto 0);
      ddr_cke            : out   std_logic;
      ddr_csb            : out   std_logic;
      rst_dqs_div        : out   std_logic;
      rst_dqs_div_in     : in    std_logic;
      rst_dqs_div_out    : out   std_logic;
      dqs_int_delay_in   : out   std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
   ddr_dm           : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      dq                 : out   std_logic_vector((DATA_WIDTH-1) downto 0)
      );
  end component;
  
  signal rst_calib          : std_logic;
  signal delay_sel          : std_logic_vector(4 downto 0);
  signal write_enable       : std_logic;
  signal dqs_div_rst        : std_logic;
  signal dqs_enable         : std_logic;
  signal dqs_reset          : std_logic;
  signal dqs_int_delay_in   : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
  signal dq                 : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal write_en_val       : std_logic;
  signal data_mask_f        : std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
  signal data_mask_r        : std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
  signal write_data_falling : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal write_data_rising  : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal ddr_rasb_cntrl     : std_logic;
  signal ddr_casb_cntrl     : std_logic;
  signal ddr_web_cntrl      : std_logic;
  signal ddr_ba_cntrl       : std_logic_vector((BANK_ADDRESS-1) downto 0);
  signal ddr_address_cntrl  : std_logic_vector((ROW_ADDRESS-1) downto 0);
  signal ddr_cke_cntrl      : std_logic;
  signal ddr_csb_cntrl      : std_logic;
  signal ddr_odt_cntrl      : std_logic;
  signal rst_dqs_div_int    : std_logic;
  signal user_mask          : std_logic_vector(((DATA_MASK_WIDTH*2)-1) downto 0);

begin


  clk_tb            <=  clk_int after 1 ps;
  clk90_tb          <=  clk90_int after 1 ps;
  sys_rst_tb        <=  sys_rst;
  sys_rst90_tb      <=  sys_rst90;
  sys_rst180_tb     <=  sys_rst180;
  user_mask        <=   user_data_mask;

  controller0 : mig20_controller_0
  port map (
    auto_ref_req      => auto_ref_req,
    wait_200us        => wait_200us,
    clk               => clk_int,
    rst0              => sys_rst,
    rst180            => sys_rst180,
    address           => user_input_address(((ROW_ADDRESS + COL_AP_WIDTH +
                                              BANK_ADDRESS)-1) downto BANK_ADDRESS),
    bank_addr         => user_input_address(BANK_ADDRESS-1 downto 0),
    command_register  => user_command_register,
    burst_done        => burst_done,
    ddr_rasb_cntrl    => ddr_rasb_cntrl,
    ddr_casb_cntrl    => ddr_casb_cntrl,
    ddr_web_cntrl     => ddr_web_cntrl,
    ddr_ba_cntrl      => ddr_ba_cntrl,
    ddr_address_cntrl => ddr_address_cntrl,
    ddr_cke_cntrl     => ddr_cke_cntrl,
    ddr_csb_cntrl     => ddr_csb_cntrl,
    ddr_odt_cntrl     => ddr_odt_cntrl,
    dqs_enable        => dqs_enable,
    dqs_reset         => dqs_reset,
    write_enable      => write_enable,
    rst_calib         => rst_calib,
    rst_dqs_div_int   => rst_dqs_div_int,
    cmd_ack           => user_cmd_ack,
    init              => init_done,
    ar_done           => ar_done
    );

  data_path0 : mig20_data_path_0
    port map (
      user_input_data    => user_input_data,
      user_data_mask     => user_mask,
      clk                => clk_int,
      clk90              => clk90_int,
      reset              => sys_rst,
      reset90            => sys_rst90,
      write_enable       => write_enable,
      rst_dqs_div_in     => dqs_div_rst,
      delay_sel          => delay_sel,
      dqs_int_delay_in   => dqs_int_delay_in,
      dq                 => dq,
      u_data_val         => user_data_valid,
      user_output_data   => user_output_data,
      write_en_val       => write_en_val,
      data_mask_f        => data_mask_f,
      data_mask_r        => data_mask_r,
      write_data_falling => write_data_falling,
      write_data_rising  => write_data_rising
      );

  infrastructure0 : mig20_infrastructure
    port map (
      clk_int            => clk_int,
      rst_calib1         => rst_calib,
      delay_sel_val      => delay_sel_val,
      delay_sel_val1_val => delay_sel
      );

  iobs0 : mig20_iobs_0
    port map (
      clk                => clk_int,
      clk90              => clk90_int,
      ddr_rasb_cntrl     => ddr_rasb_cntrl,
      ddr_casb_cntrl     => ddr_casb_cntrl,
      ddr_odt_cntrl      => ddr_odt_cntrl,
      ddr_web_cntrl      => ddr_web_cntrl,
      ddr_cke_cntrl      => ddr_cke_cntrl,
      ddr_csb_cntrl      => ddr_csb_cntrl,
      ddr_address_cntrl  => ddr_address_cntrl,
      ddr_ba_cntrl       => ddr_ba_cntrl,
      rst_dqs_div_int    => rst_dqs_div_int,
      dqs_reset          => dqs_reset,
      dqs_enable         => dqs_enable,
      ddr_dqs            => ddr2_dqs,
          ddr_dqs_n            => ddr2_dqs_n,
      ddr_dq             => ddr2_dq,
      write_data_falling => write_data_falling,
      write_data_rising  => write_data_rising,
      write_en_val       => write_en_val,
      data_mask_f        => data_mask_f,
      data_mask_r        => data_mask_r,
      ddr_odt            => ddr2_odt,
      ddr2_ck            => ddr2_ck,
      ddr2_ck_n          => ddr2_ck_n,
      ddr_rasb           => ddr2_ras_n,
      ddr_casb           => ddr2_cas_n,
      ddr_web            => ddr2_we_n,
      ddr_ba             => ddr2_ba,
      ddr_address        => ddr2_a,
      ddr_cke            => ddr2_cke,
      ddr_csb            => ddr2_cs_n,
      rst_dqs_div        => dqs_div_rst,
      rst_dqs_div_in     => rst_dqs_div_in,
      rst_dqs_div_out    => rst_dqs_div_out,
      dqs_int_delay_in   => dqs_int_delay_in,
             ddr_dm             =>   ddr2_dm,
      dq                 => dq
      );

end arc;
