-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_infrastructure_iobs_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module has the FDDRRSE instantiations to the clocks.
-------------------------------------------------------------------------------

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;
use work.mig20_parameters_0.all;

entity mig20_infrastructure_iobs_0 is
  port(
    ddr2_ck   : out  std_logic_vector((CLK_WIDTH-1)  downto 0);
    ddr2_ck_n : out  std_logic_vector((CLK_WIDTH-1)  downto 0);
    clk0      : in std_logic
    );
end mig20_infrastructure_iobs_0;

architecture arc of mig20_infrastructure_iobs_0 is

    signal ddr2_clk_q     : std_logic;
  signal vcc    : std_logic;
  signal gnd    : std_logic;
  signal clk180 : std_logic;

---- **************************************************
---- iob attributes for instantiated FDDRRSE components
---- **************************************************
begin

  gnd    <= '0';
  vcc    <= '1';
  clk180 <= not clk0;
  
--- ***********************************
---- This includes instantiation of the output DDR flip flop
---- for ddr clk's and dimm clk's
---- ***********************************************************

   
 U_clk_i : FDDRRSE 
  port map (
    Q => ddr2_clk_q,
    C0 => clk0,
    C1 => clk180,
    CE => vcc,
    D0 => vcc,
    D1 => gnd,
    R => gnd,
    S => gnd 
    );


  
  

---- ******************************************
---- Ouput BUffers for ddr clk's and dimm clk's
---- ******************************************

    
r_inst : OBUFDS 
	  port map (
        I  => ddr2_clk_q,
        O  => ddr2_ck(0),
        OB => ddr2_ck_n(0)
		);


  
  

end arc;
