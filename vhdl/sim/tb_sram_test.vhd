----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 03:59:50 PM
-- Design Name: 
-- Module Name: tb_sram_test - Behavioral
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

entity tb_sram_test is
--  Port ( );
end tb_sram_test;

architecture Behavioral of tb_sram_test is

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
    
    signal clk : std_logic := '0';
    signal cs_n : std_logic := '0';
    signal we_n : std_logic;
    signal address: std_logic_vector(7 downto 0);
    signal ry : std_logic;
    signal wdata, rdata : std_logic_vector(31 downto 0);

begin
    sram_dut : sram_wrapper
    port map (
        clk => clk,
        cs_n => cs_n,
        we_n => we_n,
        address => address,
        ry => ry,
        write_data => wdata,
        read_data => rdata
    );
    
    clk <= not clk after 5ns;
    address <= "00000000", "00000001" after 140ns;
    wdata <= "01010101010101010101010101010101", "01010101010101010101010101011111" after 140ns;
    we_n <= '1', '0' after 100ns, '1' after 120ns, '0' after 140ns, '1' after 160ns;

end Behavioral;
