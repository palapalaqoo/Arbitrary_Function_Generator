-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_data_write0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : Data write operation performed through the pipelines in this
--               module.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
use work.mig20_parameters_0.all;

entity mig20_data_write_0 is
  port(
    user_input_data    : in  std_logic_vector((2*DATA_WIDTH-1) downto 0);
    user_data_mask     : in  std_logic_vector((2*DATA_MASK_WIDTH-1) downto 0);
    clk90              : in  std_logic;
    write_enable       : in  std_logic;
    write_en_val       : out std_logic;
    data_mask_f        : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    data_mask_r        : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    write_data_falling : out std_logic_vector((DATA_WIDTH-1) downto 0);
    write_data_rising  : out std_logic_vector((DATA_WIDTH-1) downto 0)
    );
end mig20_data_write_0;

architecture arc of mig20_data_write_0 is


  signal write_en_P1       : std_logic;  -- write enable Pipeline stage
  signal write_en_P2       : std_logic;
  signal write_en_int      : std_logic;
  signal write_data0       : std_logic_vector((2*DATA_WIDTH-1) downto 0);
  signal write_data1       : std_logic_vector((2*DATA_WIDTH-1) downto 0);
  signal write_data2       : std_logic_vector((2*DATA_WIDTH-1) downto 0);
  signal write_data3       : std_logic_vector((2*DATA_WIDTH-1) downto 0);
  signal write_data4       : std_logic_vector((2*DATA_WIDTH-1) downto 0);
  signal write_data_m0     : std_logic_vector ((2*DATA_MASK_WIDTH-1) downto 0);
  signal write_data_m1     : std_logic_vector ((2*DATA_MASK_WIDTH-1) downto 0);
  signal write_data_m2     : std_logic_vector ((2*DATA_MASK_WIDTH-1) downto 0);
  signal write_data_m3     : std_logic_vector ((2*DATA_MASK_WIDTH-1) downto 0);
  signal write_data_m4     : std_logic_vector ((2*DATA_MASK_WIDTH-1) downto 0);

  signal write_data90       : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal write_data90_1     : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal write_data90_2     : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal write_data_m90     : std_logic_vector ((DATA_MASK_WIDTH-1) downto 0);
  signal write_data_m90_1   : std_logic_vector ((DATA_MASK_WIDTH-1) downto 0);
  signal write_data_m90_2   : std_logic_vector ((DATA_MASK_WIDTH-1) downto 0);

  signal write_data270     : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal write_data270_1   : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal write_data270_2   : std_logic_vector((DATA_WIDTH-1) downto 0);

  signal write_data_m270   : std_logic_vector ((DATA_MASK_WIDTH-1) downto 0);
  signal write_data_m270_1 : std_logic_vector ((DATA_MASK_WIDTH-1) downto 0);
  signal write_data_m270_2 : std_logic_vector ((DATA_MASK_WIDTH-1) downto 0);

  

  attribute syn_preserve : boolean;
  attribute syn_preserve of write_data0 : signal is true;
  attribute syn_preserve of write_data1 : signal is true;
  attribute syn_preserve of write_data2 : signal is true;
  attribute syn_preserve of write_data3 : signal is true;
  attribute syn_preserve of write_data4 : signal is true;

  attribute syn_preserve of write_data_m0 : signal is true;
  attribute syn_preserve of write_data_m1 : signal is true;
  attribute syn_preserve of write_data_m2 : signal is true;
  attribute syn_preserve of write_data_m3 : signal is true;
  attribute syn_preserve of write_data_m4 : signal is true;

  attribute syn_preserve of write_data90   : signal is true;
  attribute syn_preserve of write_data90_1 : signal is true;
  attribute syn_preserve of write_data90_2 : signal  is true;

  attribute syn_preserve of write_data270   : signal is true;
  attribute syn_preserve of write_data270_1 : signal is true;
  attribute syn_preserve of write_data270_2 : signal is true;

begin

  write_data0   <= user_input_data;
  write_data_m0 <= user_data_mask;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      write_data1   <= write_data0;
      write_data_m1 <= write_data_m0;
      write_data2   <= write_data1;
      write_data_m2 <= write_data_m1;
      write_data3   <= write_data2;
      write_data_m3 <= write_data_m2;
      write_data4   <= write_data3;
      write_data_m4 <= write_data_m3;
    end if;
  end process;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      write_data90        <= write_data4((DATA_WIDTH-1) downto 0); 
      write_data_m90      <= write_data_m4((DATA_MASK_WIDTH-1) downto 0);
      write_data90_1     <= write_data90;
      write_data_m90_1   <= write_data_m90;
      write_data90_2      <= write_data90_1;
      write_data_m90_2 <= write_data_m90_1;

    end if;
  end process;


  process(clk90)
  begin
    if clk90'event and clk90 = '0' then
      write_data270     <= write_data4((DATA_WIDTH*2-1) downto DATA_WIDTH);
      write_data_m270   <= write_data_m4((DATA_MASK_WIDTH*2-1) downto DATA_MASK_WIDTH);
      write_data270_1 <= write_data270;
      write_data270_2   <= write_data270_1;
      write_data_m270_1 <= write_data_m270;
      write_data_m270_2 <= write_data_m270_1;

    end if;
  end process;

  write_data_rising  <= write_data270_2;
  write_data_falling <= write_data90_2;
  data_mask_r        <= write_data_m270_2;
  data_mask_f        <= write_data_m90_2; 

-- write enable for data path
  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      write_en_P1 <= write_enable;
      write_en_P2 <= write_en_P1;
    end if;
  end process;

-- write enable for data path
  process(clk90)
  begin
    if clk90'event and clk90 = '0' then
      write_en_int <= write_en_P2;
      write_en_val <= write_en_P1;
    end if;
  end process;

end arc;
