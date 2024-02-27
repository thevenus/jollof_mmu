----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2024 09:20:57 AM
-- Design Name: 
-- Module Name: jollof_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jollof_top is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           input_data : in std_logic_vector (7 downto 0);
           valid_input : in std_logic;
           read_ram : in std_logic;
           read_data_out : out std_logic_vector (8 downto 0);
           finish : out std_logic);
end jollof_top;

architecture Behavioral of jollof_top is

    component controller is 
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           valid_input : in STD_LOGIC;
           dataROM : in STD_LOGIC_VECTOR (13 downto 0);
           addrROM : out STD_LOGIC_VECTOR (3 downto 0);
           p1 : out STD_LOGIC_VECTOR (17 downto 0);
           p2 : out STD_LOGIC_VECTOR (17 downto 0);
           p3 : out STD_LOGIC_VECTOR (17 downto 0);
           p4 : out STD_LOGIC_VECTOR (17 downto 0);
           loadRAM : out STD_LOGIC;
           finish : out STD_LOGIC);
    end component;
    
    component rom is
        Port ( addr : in std_logic_vector(3 downto 0);
           dout : out std_logic_vector(13 downto 0));
    end component;

    component ram_ctrl is
        Port (
            clk: in std_logic;
            rst: in std_logic;
            load: in std_logic;
            start_read: in std_logic;
            read_data_sram: in std_logic_vector(31 downto 0);
            ready_sram: in std_logic;
            product1: in std_logic_vector(17 downto 0);
            product2: in std_logic_vector(17 downto 0);
            product3: in std_logic_vector(17 downto 0);
            product4: in std_logic_vector(17 downto 0);
            dataRAM: out std_logic_vector(31 downto 0);
            read_data_out: out std_logic_vector(8 downto 0);
            addressRAM: out std_logic_vector(7 downto 0);
            web: out std_logic;
            load_done: out std_logic
            );
    end component;
     
    component sram_wrapper is 
        port(
            clk: in std_logic;
            cs_n: in std_logic;  -- Active Low
            we_n: in std_logic;  --Active Low
            address: in std_logic_vector(7 downto 0);
            ry: out std_logic;
            write_data: in std_logic_vector(31 downto 0);
            read_data: out std_logic_vector(31 downto 0));
    end component;

    component CPAD_S_74x50u_IN            --input PAD
    port (
      COREIO : out std_logic;
      PADIO  : in  std_logic);
    end component;

    component CPAD_S_74x50u_OUT           --output PAD
    port (
      COREIO : in  std_logic;
      PADIO  : out std_logic);
    end component;

    signal dataROM : std_logic_vector(13 downto 0);
    signal addrROM : std_logic_vector(3 downto 0);
    signal p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal loadRAM : STD_LOGIC;
    signal addressRAM: std_logic_vector(7 downto 0);
    signal dataRAM: std_logic_vector(31 downto 0);
    signal web: std_logic;
    signal sram_read_data_out: std_logic_vector(31 downto 0);
    signal ready: std_logic;
    signal cs_n: std_logic;
    signal load_done: std_logic;
    signal calc_finish: std_logic;
    
    -- PAD SIGNALS
    signal clk_pad: std_logic;
    signal rst_pad: std_logic;
    signal input_data_pad : std_logic_vector (7 downto 0);
    signal valid_input_pad : std_logic;
    signal read_ram_pad : std_logic;
    signal read_data_out_pad : std_logic_vector (8 downto 0);
    signal finish_pad : std_logic;

begin

    cs_n <= '0';

    clkpad : CPAD_S_74x50u_IN
    port map (
      COREIO => clk_pad,
      PADIO  => clk
    );

    rstpad : CPAD_S_74x50u_IN
    port map (
      COREIO => rst_pad,
      PADIO  => rst
    );

    InPads : for i in 0 to 7 generate
    InPad : CPAD_S_74x50u_IN
      port map (
        COREIO => input_data_pad(i),
        PADIO  => input_data(i));
    end generate InPads;

    validpad : CPAD_S_74x50u_IN
    port map (
      COREIO => valid_input_pad,
      PADIO  => valid_input
    );

    readpad : CPAD_S_74x50u_IN
    port map (
      COREIO => read_ram_pad,
      PADIO  => read_ram
    );

    OutPads : for i in 0 to 8 generate
    OutPad : CPAD_S_74x50u_OUT
      port map (
        COREIO => read_data_out_pad(i),
        PADIO  => read_data_out(i));
    end generate OutPads;

    finishpad : CPAD_S_74x50u_OUT
      port map (
        COREIO => finish_pad,
        PADIO  => finish
    );

    Controller_inst : controller
        port map(
            clk => clk_pad,
            rst => rst_pad,
            input => input_data_pad,
            valid_input => valid_input_pad,
            dataROM => dataROM,
            addrROM => addrROM,
            p1 => p1,
            p2 => p2,
            p3 => p3,
            p4 => p4,
            loadRAM => loadRAM,
            finish => calc_finish
        ); 

    ROM_inst: rom
        port map(
            addr => addrROM,
            dout => dataROM     
        );
        
    RAM_ctrl_inst: ram_ctrl
        port map (
            clk => clk_pad,
            rst => rst_pad,
            product1 => p1,
            product2 => p2,
            product3 => p3,
            product4 => p4,
            dataRAM => dataRAM,
            addressRAM => addressRAM,
            web => web,
            load => loadRAM,
            start_read => read_ram_pad,
            read_data_sram => sram_read_data_out,
            read_data_out => read_data_out_pad,
            ready_sram => ready,
            load_done => load_done 
        );
        
     SRAM_wrapper_inst: sram_wrapper
        port map(
            clk => clk_pad,
            cs_n => cs_n,
            we_n => web,
            address => addressRAM,
            ry => ready,
            write_data => dataRAM,
            read_data => sram_read_data_out          
        );
    
    finish_pad <= calc_finish and load_done;

end Behavioral;
