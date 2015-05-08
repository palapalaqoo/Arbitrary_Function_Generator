-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : %module_name.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module has the instantiations for infrastructure_top and
--                                                       main modules.
-------------------------------------------------------------------------------

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use UNISIM.VCOMPONENTS.all;

entity mig20 is
  port (
    cntrl0_ddr2_dq                       : inout  std_logic_vector(15 downto 0);
    cntrl0_ddr2_a                        : out  std_logic_vector(12 downto 0);
    cntrl0_ddr2_ba                       : out  std_logic_vector(1 downto 0);
    cntrl0_ddr2_cke                      : out std_logic;
    cntrl0_ddr2_cs_n                     : out std_logic;
    cntrl0_ddr2_ras_n                    : out std_logic;
    cntrl0_ddr2_cas_n                    : out std_logic;
    cntrl0_ddr2_we_n                     : out std_logic;
    cntrl0_ddr2_odt                      : out std_logic;
    cntrl0_ddr2_dm                       : out  std_logic_vector(1 downto 0);
    cntrl0_rst_dqs_div_in                : in std_logic;
    cntrl0_rst_dqs_div_out               : out std_logic;
    reset_in_n                           : in std_logic;
    cntrl0_burst_done                    : in std_logic;
    cntrl0_init_done                     : out std_logic;
    cntrl0_ar_done                       : out std_logic;
    cntrl0_user_data_valid               : out std_logic;
    cntrl0_auto_ref_req                  : out std_logic;
    cntrl0_user_cmd_ack                  : out std_logic;
    cntrl0_user_command_register         : in  std_logic_vector(2 downto 0);
    cntrl0_clk_tb                        : out std_logic;
    cntrl0_clk90_tb                      : out std_logic;
    cntrl0_sys_rst_tb                    : out std_logic;
    cntrl0_sys_rst90_tb                  : out std_logic;
    cntrl0_sys_rst180_tb                 : out std_logic;
    cntrl0_user_output_data              : out  std_logic_vector(31 downto 0);
    cntrl0_user_input_data               : in  std_logic_vector(31 downto 0);
    cntrl0_user_data_mask                : in  std_logic_vector(3 downto 0);
    cntrl0_user_input_address            : in  std_logic_vector(25 downto 0);
    clk_int                              : in std_logic;
    clk90_int                            : in std_logic;
    dcm_lock                             : in std_logic;
    cntrl0_ddr2_dqs                      : inout  std_logic_vector(1 downto 0);
    cntrl0_ddr2_dqs_n                    : inout  std_logic_vector(1 downto 0);
    cntrl0_ddr2_ck                       : out  std_logic_vector(0 downto 0);
    cntrl0_ddr2_ck_n                     : out  std_logic_vector(0 downto 0)
    );

end mig20;

architecture arc_mem_interface_top of mig20 is

component mig20_top_0  port (
   ddr2_dq                        : inout  std_logic_vector(15 downto 0);
   ddr2_a                         : out  std_logic_vector(12 downto 0);
   ddr2_ba                        : out  std_logic_vector(1 downto 0);
   ddr2_cke                       : out std_logic;
   ddr2_cs_n                      : out std_logic;
   ddr2_ras_n                     : out std_logic;
   ddr2_cas_n                     : out std_logic;
   ddr2_we_n                      : out std_logic;
   ddr2_odt                       : out std_logic;
   ddr2_dm                        : out  std_logic_vector(1 downto 0);
   rst_dqs_div_in                 : in std_logic;
   rst_dqs_div_out                : out std_logic;
   burst_done                     : in std_logic;
   init_done                      : out std_logic;
   ar_done                        : out std_logic;
   user_data_valid                : out std_logic;
   auto_ref_req                   : out std_logic;
   user_cmd_ack                   : out std_logic;
   user_command_register          : in  std_logic_vector(2 downto 0);
   clk_tb                         : out std_logic;
   clk90_tb                       : out std_logic;
   sys_rst_tb                     : out std_logic;
   sys_rst90_tb                   : out std_logic;
   sys_rst180_tb                  : out std_logic;
   user_output_data               : out  std_logic_vector(31 downto 0);
   user_input_data                : in  std_logic_vector(31 downto 0);
   user_data_mask                 : in  std_logic_vector(3 downto 0);
   user_input_address             : in  std_logic_vector(25 downto 0);
   ddr2_dqs                       : inout  std_logic_vector(1 downto 0);
   ddr2_dqs_n                     : inout  std_logic_vector(1 downto 0);
   ddr2_ck                        : out  std_logic_vector(0 downto 0);
   ddr2_ck_n                      : out  std_logic_vector(0 downto 0);
   clk_int                        : in std_logic;
   clk90_int                      : in std_logic;
   wait_200us                     : in std_logic;   
   sys_rst                        : in std_logic;   
   sys_rst90                      : in std_logic;   
   sys_rst180                     : in std_logic;   
   delay_sel_val                  : in std_logic_vector(4 downto 0)

   );
end component;

  component mig20_infrastructure_top
    port (
      reset_in_n                     : in std_logic;
      clk_int                        : in std_logic;
      clk90_int                      : in std_logic;
      dcm_lock                       : in std_logic;
      wait_200us         : out std_logic;
      delay_sel_val1_val : out std_logic_vector(4 downto 0);
      sys_rst_val        : out std_logic;
      sys_rst90_val      : out std_logic;
      sys_rst180_val     : out std_logic
      );
    end component;

  signal sys_rst    : std_logic;
  signal wait_200us : std_logic;
  signal sys_rst90  : std_logic;
  signal sys_rst180 : std_logic;
  signal clk_0      : std_logic;
  signal clk90_0    : std_logic;
  signal delay_sel  : std_logic_vector(4 downto 0);

begin

top_00 :    mig20_top_0 port map (
   ddr2_dq                        => cntrl0_ddr2_dq,
   ddr2_a                         => cntrl0_ddr2_a,
   ddr2_ba                        => cntrl0_ddr2_ba,
   ddr2_cke                       => cntrl0_ddr2_cke,
   ddr2_cs_n                      => cntrl0_ddr2_cs_n,
   ddr2_ras_n                     => cntrl0_ddr2_ras_n,
   ddr2_cas_n                     => cntrl0_ddr2_cas_n,
   ddr2_we_n                      => cntrl0_ddr2_we_n,
   ddr2_odt                       => cntrl0_ddr2_odt,
   ddr2_dm                        => cntrl0_ddr2_dm,
   rst_dqs_div_in                 => cntrl0_rst_dqs_div_in,
   rst_dqs_div_out                => cntrl0_rst_dqs_div_out,
   burst_done                     => cntrl0_burst_done,
   init_done                      => cntrl0_init_done,
   ar_done                        => cntrl0_ar_done,
   user_data_valid                => cntrl0_user_data_valid,
   auto_ref_req                   => cntrl0_auto_ref_req,
   user_cmd_ack                   => cntrl0_user_cmd_ack,
   user_command_register          => cntrl0_user_command_register,
   clk_tb                         => cntrl0_clk_tb,
   clk90_tb                       => cntrl0_clk90_tb,
   sys_rst_tb                     => cntrl0_sys_rst_tb,
   sys_rst90_tb                   => cntrl0_sys_rst90_tb,
   sys_rst180_tb                  => cntrl0_sys_rst180_tb,
   user_output_data               => cntrl0_user_output_data,
   user_input_data                => cntrl0_user_input_data,
   user_data_mask                 => cntrl0_user_data_mask,
   user_input_address             => cntrl0_user_input_address,
   ddr2_dqs                       => cntrl0_ddr2_dqs,
   ddr2_dqs_n                     => cntrl0_ddr2_dqs_n,
   ddr2_ck                        => cntrl0_ddr2_ck,
   ddr2_ck_n                      => cntrl0_ddr2_ck_n,
   clk_int                        => clk_int,
   clk90_int                      => clk90_int,
   wait_200us                     => wait_200us,
   delay_sel_val                  => delay_sel,
   sys_rst                        => sys_rst,
   sys_rst90                      => sys_rst90,
   sys_rst180                     => sys_rst180
   );


  infrastructure_top0 : mig20_infrastructure_top
    port map (
      wait_200us         => wait_200us,
      delay_sel_val1_val => delay_sel,
      sys_rst_val        => sys_rst,
      sys_rst90_val      => sys_rst90,
      sys_rst180_val     => sys_rst180,
      reset_in_n                     => reset_in_n,
      clk_int                        => clk_int,
      clk90_int                      => clk90_int,
      dcm_lock                       => dcm_lock
      );

end arc_mem_interface_top;
