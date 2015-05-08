-------------------------------------------------------------------------------
-- Copyright (c) 2005-2007 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : $Name: i+IP+131489 $
--  \   \        Application        : MIG
--  /   /        Filename           : mig20_data_read_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2007/09/21 15:23:18 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : ram8d modules are instantiated for Read data FIFOs. ram8d is
--               each 8 bits or 4 bits depending on number data bits per strobe.
--               Each strobe  will have two instances, one for rising edge data
--               and one for falling edge data.
-------------------------------------------------------------------------------
library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;
use work.mig20_parameters_0.all;

entity mig20_data_read_0 is
  port(
    clk90             : in  std_logic;
    reset90         : in  std_logic;
    ddr_dq_in         : in  std_logic_vector((DATA_WIDTH-1) downto 0);
    read_valid_data_1 : in  std_logic;
    fifo_0_wr_en      : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    fifo_1_wr_en      : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    fifo_0_wr_addr    : in std_logic_vector((4*DATA_STROBE_WIDTH)-1 downto 0);
    fifo_1_wr_addr    : in std_logic_vector((4*DATA_STROBE_WIDTH)-1 downto 0);
    dqs_delayed_col0  : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    dqs_delayed_col1  : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    user_output_data  : out std_logic_vector((2*DATA_WIDTH-1) downto 0);
    fifo0_rd_addr_val : out std_logic_vector(3 downto 0);
    fifo1_rd_addr_val : out std_logic_vector(3 downto 0)
    );
end mig20_data_read_0;

architecture arc of mig20_data_read_0 is

  component mig20_rd_gray_cntr
    port (
      clk90    : in  std_logic;
      reset90  : in  std_logic;
      cnt_en   : in  std_logic;
      rgc_gcnt : out std_logic_vector(3 downto 0)
      );
  end component;

  component mig20_ram8d_0 is
    port (
      DOUT  : out std_logic_vector((DATABITSPERSTROBE -1) downto 0);
      WADDR : in  std_logic_vector(3 downto 0);
      DIN   : in  std_logic_vector((DATABITSPERSTROBE -1) downto 0);
      RADDR : in  std_logic_vector(3 downto 0);
      WCLK0 : in  std_logic;
      WCLK1 : in  std_logic;
      WE    : in  std_logic
      );
  end component;

  signal read_valid_data_1_r  : std_logic;
  signal read_valid_data_1_r1 : std_logic;
  signal fifo0_rd_addr        : std_logic_vector(3 downto 0);
  signal fifo1_rd_addr        : std_logic_vector(3 downto 0);

  signal first_sdr_data       : std_logic_vector((2*DATA_WIDTH-1) downto 0);
  signal reset90_r          : std_logic;
  signal fifo0_rd_addr_r      : std_logic_vector((4*DATA_STROBE_WIDTH-1) downto 0);
  signal fifo1_rd_addr_r      : std_logic_vector((4*DATA_STROBE_WIDTH-1) downto 0);
  signal fifo_0_data_out      : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal fifo_1_data_out      : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal fifo_0_data_out_r    : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal fifo_1_data_out_r    : std_logic_vector((DATA_WIDTH-1) downto 0);
  signal dqs_delayed_col0_n   : std_logic_vector((DATA_STROBE_WIDTH -1) downto 0);
  signal dqs_delayed_col1_n   : std_logic_vector((DATA_STROBE_WIDTH -1) downto 0);

  attribute syn_noprune  : boolean;
  attribute syn_preserve : boolean;

  attribute syn_noprune of fifo0_rd_addr_r   : signal is true;
  attribute syn_noprune of fifo1_rd_addr_r   : signal is true;
  attribute syn_preserve of fifo0_rd_addr_r  : signal is true;
  attribute syn_preserve of fifo1_rd_addr_r  : signal is true;

begin

  process(clk90)
  begin
    if(clk90'event and clk90='1') then
      reset90_r <= reset90;
    end if;
  end process;

  gen_asgn : for asgn_i in 0 to DATA_STROBE_WIDTH-1 generate
    dqs_delayed_col0_n(asgn_i) <= not dqs_delayed_col0(asgn_i);
    dqs_delayed_col1_n(asgn_i) <= not dqs_delayed_col1(asgn_i);
  end generate;
  
  user_output_data  <= first_sdr_data;
  fifo0_rd_addr_val <= fifo1_rd_addr;
  fifo1_rd_addr_val <= fifo0_rd_addr;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      fifo_0_data_out_r <= fifo_0_data_out;
      fifo_1_data_out_r <= fifo_1_data_out;
    end if;
  end process;

  gen_addr : for addr_i in 0 to DATA_STROBE_WIDTH-1 generate
    process(clk90)
    begin
      if clk90'event and clk90 = '1' then
        fifo0_rd_addr_r((addr_i*4-1)+ 4 downto addr_i*4) <= fifo0_rd_addr;
        fifo1_rd_addr_r((addr_i*4-1)+ 4 downto addr_i*4) <= fifo1_rd_addr;
      end if;
    end process;
  end generate;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if reset90_r = '1' then
        first_sdr_data       <= (others => '0');
        read_valid_data_1_r  <= '0';
        read_valid_data_1_r1 <= '0';
      else
        read_valid_data_1_r  <= read_valid_data_1;
        read_valid_data_1_r1 <= read_valid_data_1_r;
        if (read_valid_data_1_r1 = '1') then
          first_sdr_data <=
            (
         fifo_0_data_out_r(15 downto 8)  &          fifo_0_data_out_r(7 downto 0)  &          fifo_1_data_out_r(15 downto 8)  &          fifo_1_data_out_r(7 downto 0) 
             );
        else
          first_sdr_data <= first_sdr_data;
        end if;
      end if;
    end if;
  end process;

-------------------------------------------------------------------------------
-- fifo_x0_rd_addr and fifo_x1_rd_addr counters ( gray counters )
-------------------------------------------------------------------------------

  fifo0_rd_addr_inst : mig20_rd_gray_cntr
    port map (
      clk90    => clk90,
      reset90  => reset90,
      cnt_en   => read_valid_data_1,
      rgc_gcnt => fifo0_rd_addr
      );
  fifo1_rd_addr_inst : mig20_rd_gray_cntr
    port map (
      clk90    => clk90,
      reset90  => reset90,
      cnt_en   => read_valid_data_1,
      rgc_gcnt => fifo1_rd_addr
      );

  gen_strobe: for strobe_i in 0 to DATA_STROBE_WIDTH-1 generate
    strobe : mig20_ram8d_0
      Port Map (
        DOUT  => fifo_0_data_out((strobe_i*DATABITSPERSTROBE-1)+ DATABITSPERSTROBE downto strobe_i*DATABITSPERSTROBE),
        WADDR => fifo_0_wr_addr((strobe_i*4-1)+4 downto strobe_i*4),
        DIN   => ddr_dq_in((strobe_i*DATABITSPERSTROBE-1)+ DATABITSPERSTROBE downto strobe_i*DATABITSPERSTROBE),
        RADDR => fifo0_rd_addr_r((strobe_i*4-1)+4 downto strobe_i*4),
        WCLK0 => dqs_delayed_col0(strobe_i),
        WCLK1 => dqs_delayed_col1(strobe_i),
        WE    => fifo_0_wr_en(strobe_i)
        );
    strobe_n : mig20_ram8d_0
      Port Map (
        DOUT  => fifo_1_data_out((strobe_i*DATABITSPERSTROBE-1)+ DATABITSPERSTROBE downto strobe_i*DATABITSPERSTROBE),
        WADDR => fifo_1_wr_addr((strobe_i*4-1)+4 downto strobe_i*4),
        DIN   => ddr_dq_in((strobe_i*DATABITSPERSTROBE-1)+ DATABITSPERSTROBE downto strobe_i*DATABITSPERSTROBE),
        RADDR => fifo1_rd_addr_r((strobe_i*4-1)+4 downto strobe_i*4),
        WCLK0 => dqs_delayed_col0_n(strobe_i),
        WCLK1 => dqs_delayed_col1_n(strobe_i),
        WE    => fifo_1_wr_en(strobe_i)
        );
  end generate;

end arc;
