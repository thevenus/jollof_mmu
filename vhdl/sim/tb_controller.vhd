----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2024 09:43:25 AM
-- Design Name: 
-- Module Name: tb_controller - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use std.textio.all;
use ieee.std_logic_textio.all;

entity tb_controller is
--  Port ( );
end tb_controller;

architecture Behavioral of tb_controller is
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
    
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal input : std_logic_vector(7 downto 0);
    signal valid_input : std_logic;
    signal dataROM : std_logic_vector(13 downto 0);
    signal addrROM : std_logic_vector(3 downto 0);
    signal p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal loadRAM : STD_LOGIC;
    signal finish : STD_LOGIC;
    
    constant CLK_PERIOD : time := 10ns;
begin
    DUT_controller: controller
    port map(
        clk => clk,
        rst => rst,
        input => input,
        valid_input => valid_input,
        dataROM => dataROM,
        addrROM => addrROM,
        p1 => p1,
        p2 => p2,
        p3 => p3,
        p4 => p4,
        loadRAM => loadRAM,
        finish => finish
    );
    
    DUT_rom: rom
    port map(
        addr => addrROM,
        dout => dataROM     
    );
    
    clk <= not clk after CLK_PERIOD/2;
    rst <= '0' after 100ns;
    valid_input <= '0', '1' after 105ns, '0' after 115ns;
    
    process (clk, rst) is
        variable line_v : line;
        variable input_v : std_logic_vector(7 downto 0);
        file input_stimuli : text open READ_MODE is "/h/dc/o/si3116uw-s/icp1matrix/functional_model_stimuli/input_stimuli.txt";
    begin
        if (rising_edge(clk) and rst = '0') then
            -- file_open(input_stimuli, "/h/d9/n/fu6315ma-s/Documents/icp1matrix/functional_model_stimuli/input_stimuli.txt", READ_MODE);
            if (not endfile(input_stimuli)) then
                readline(input_stimuli, line_v);
                read(line_v, input_v);
                input <= input_v;
                -- report("input: " & to_string(input_v));
            end if;
            -- file_close(input_stimuli);
        end if;
    end process;

end Behavioral;
