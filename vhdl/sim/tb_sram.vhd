----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2024 09:37:56 AM
-- Design Name: 
-- Module Name: tb_sram - Behavioral
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

entity tb_sram is
--  Port ( );
end tb_sram;

architecture Behavioral of tb_sram is
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
            web: out std_logic
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
     
     signal clk: std_logic := '0';
     signal rst: std_logic := '1';
     signal product1: std_logic_vector(17 downto 0);
     signal product2: std_logic_vector(17 downto 0);
     signal product3: std_logic_vector(17 downto 0);
     signal product4: std_logic_vector(17 downto 0);
     signal addressRAM: std_logic_vector(7 downto 0);
     signal dataRAM: std_logic_vector(31 downto 0);
     signal web: std_logic;
     signal load: std_logic := '1';
     signal ready: std_logic;
     signal cs_n: std_logic :='0';
     signal dummy_read: std_logic_vector(31 downto 0);
     signal start_read: std_logic;
     signal read_out: std_logic_vector(8 downto 0);
     
    constant clk_period : time :=  4ns;
    constant reset_time : time := 662ns;
begin

clk <= not clk after clk_period/2;
rst <= '0' after 25ns;
load <= not load after 20ns;

    DUT_ram_ctrl: ram_ctrl
        Port map (
            clk => clk,
            rst => rst,
            product1 => product1,
            product2 => product2,
            product3 => product3,
            product4 => product4,
            dataRAM => dataRAM,
            addressRAM => addressRAM,
            web => web,
            load => load,
            start_read => start_read,
            read_data_sram => dummy_read,
            read_data_out => read_out,
            ready_sram => ready
        );
        
     DUT_sram_wrapper: sram_wrapper
        port map(
            clk => clk,
            cs_n => cs_n,
            we_n => web,
            address => addressRAM,
            ry => ready,
            write_data => dataRAM,
            read_data => dummy_read          
    );


    product1 <= "000001000101110010",
                "000001000000111010" after reset_time + 40ns,
                "000001110101100111" after reset_time + 80ns,
                "000000101010111011" after reset_time + 120ns,
                "000000111101111010" after reset_time + 160ns,
                "000000111001110010" after reset_time + 200ns,
                "000001101011010001" after reset_time + 240ns,
                "000000101001000011" after reset_time + 280ns,
                "000000101011110101" after reset_time + 320ns,
                "000000101101100001" after reset_time + 360ns,
                "000001001111101011" after reset_time + 400ns,
                "000000100101001011" after reset_time + 440ns,
                "000000011001110111" after reset_time + 480ns,
                "000000100011010111" after reset_time + 520ns,
                "000000111001011001" after reset_time + 560ns,
                "000000010110110110" after reset_time + 600ns;
                
    product2 <= "000000110000100011",
                "000000110001010100" after reset_time + 40ns,
                "000001001111011100" after reset_time + 80ns,
                "000000010010000111" after reset_time + 120ns,
                "000000100101111010" after reset_time + 160ns,
                "000000100101001001" after reset_time + 200ns,
                "000000111011100000" after reset_time + 240ns,
                "000000010001111101" after reset_time + 280ns,
                "000000101010000011" after reset_time + 320ns,
                "000000110101011011" after reset_time + 360ns,
                "000001011101001011" after reset_time + 400ns,
                "000000010111010010" after reset_time + 440ns,
                "000001001101111000" after reset_time + 480ns,
                "000001001110011111" after reset_time + 520ns,
                "000010001010101111" after reset_time + 560ns,
                "000000110110010000" after reset_time + 600ns;
                
    product3 <= "000000100111110010",
                "000000110010100011" after reset_time + 40ns,
                "000001001011001110" after reset_time + 80ns,
                "000000100010101010" after reset_time + 120ns,
                "000001000011111101" after reset_time + 160ns,
                "000000101111100101" after reset_time + 200ns,
                "000001100011010110" after reset_time + 240ns,
                "000000100000001110" after reset_time + 280ns,
                "000001001111001001" after reset_time + 320ns,
                "000001000101000001" after reset_time + 360ns,
                "000010000010001000" after reset_time + 400ns,
                "000000110001010111" after reset_time + 440ns,
                "000000010111100111" after reset_time + 480ns,
                "000000010011000101" after reset_time + 520ns,
                "000000100011011010" after reset_time + 560ns,
                "000000001011001011" after reset_time + 600ns;
                
    product4 <= "000001001000010100",
                "000001000110100101" after reset_time + 40ns,
                "000010000010001110" after reset_time + 80ns,
                "000000101111010100" after reset_time + 120ns,
                "000000101001110111" after reset_time + 160ns,
                "000000101111100110" after reset_time + 200ns,
                "000001001000111010" after reset_time + 240ns,
                "000000011010010011" after reset_time + 280ns,
                "000000100010001101" after reset_time + 320ns,
                "000000100101100111" after reset_time + 360ns,
                "000000111100100111" after reset_time + 400ns,
                "000000011100110101" after reset_time + 440ns,
                "000000111010010111" after reset_time + 480ns,
                "000000110100011011" after reset_time + 520ns,
                "000001011111011101" after reset_time + 560ns,
                "000000100001001111" after reset_time + 600ns;
                
    start_read <= '0', '1' after reset_time + 700ns;



end Behavioral;
