-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor		    : Xilinx
-- \   \   \/    Version	    : $Name: i+IP+131489 $
--  \   \        Application	    : MIG
--  /   /        Filename	    : mig20_parameters_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created	    : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module has the parameters used in the design
-------------------------------------------------------------------------------

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use UNISIM.VCOMPONENTS.all;

package  mig20_parameters_0  is

constant   DATA_WIDTH                                : INTEGER   :=  16;
constant   DATA_STROBE_WIDTH                         : INTEGER   :=  2;
constant   DATA_MASK_WIDTH                           : INTEGER   :=  2;
constant   CLK_WIDTH                                 : INTEGER   :=  1;
constant   CKE_WIDTH                                 : INTEGER   :=  1;
constant   DEEP_MEMORY                               : INTEGER   :=  1;
constant   ROW_ADDRESS                               : INTEGER   :=  13;
constant   MEMORY_WIDTH                              : INTEGER   :=  8;
constant   REGISTERED                                : INTEGER   :=  0;
constant   COL_AP_WIDTH                              : INTEGER   :=  11;
constant   DATABITSPERSTROBE                         : INTEGER   :=  8;
constant   DATABITSPERMASK                           : INTEGER   :=  8;
constant   NO_OF_CS                                  : INTEGER   :=  1;
constant   RESET_PORT                                : INTEGER   :=  0;
constant   DATA_MASK                                 : INTEGER   :=  1;
constant   WRITE_PIPE_ITR                            : INTEGER   :=  1;
constant   PARAM_WIDTH                               : INTEGER   :=  1;
constant   COLUMN_ADDRESS                            : INTEGER   :=  10;
constant   BANK_ADDRESS                              : INTEGER   :=  2;
constant   LOAD_MODE_REGISTER                        : std_logic_vector(12 downto 0) := "0010100110010";

constant   EXT_LOAD_MODE_REGISTER                    : std_logic_vector(12 downto 0) := "0000000000000";

constant   RESET_ACTIVE_LOW                         : std_logic := '1';
constant   RFC_COUNT_VALUE                            : std_logic_vector(5 downto 0) := "001101";
constant   TWR_COUNT_VALUE                            : std_logic_vector(2 downto 0) := "010";
constant   MAX_REF_WIDTH                                   : INTEGER   :=  11;
constant   MAX_REF_CNT                     : std_logic_vector(10 downto 0) := "10000000001";

end mig20_parameters_0  ;
