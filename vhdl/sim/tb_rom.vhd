----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2024 01:11:13 PM
-- Design Name: 
-- Module Name: tb_rom - Behavioral
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

entity tb_rom is
--  Port ( );
end tb_rom;

architecture Behavioral of tb_rom is
    component rom is
        Port ( addr : in std_logic_vector(3 downto 0);
               dout : out std_logic_vector(13 downto 0));
    end component;
    signal addr : std_logic_vector(3 downto 0);
    signal dout : std_logic_vector(13 downto 0);
begin
    DUT_rom : rom
    port map (
        addr => addr,
        dout => dout
    );
    
    addr <= "0000",
            "0001" after 20ns,
            "0010" after 40ns,
            "0011" after 60ns,
            "0100" after 80ns,
            "0101" after 100ns,
            "0110" after 120ns,
            "0111" after 140ns,
            "1000" after 160ns,
            "1001" after 180ns,
            "1010" after 200ns,
            "1011" after 220ns,
            "1100" after 240ns,
            "1101" after 260ns,
            "1110" after 280ns,
            "1111" after 300ns;
end Behavioral;
