----------------------------------------------------------------------------------
-- Company: LTH
-- Engineer: Simon Uwalaka & Fuad Mammadzada
-- 
-- Create Date: 02/06/2024 09:37:00 AM
-- Design Name: Matrix Multiplier Unit Top module Testbench
-- Module Name: tb_jollof_top - Behavioral
-- Project Name: Jollof
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

entity tb_jollof_top is
--  Port ( );
end tb_jollof_top;

architecture Behavioral of tb_jollof_top is

    component jollof_top is
    
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           input_data : in STD_LOGIC_VECTOR (7 downto 0);
           valid_input : in STD_LOGIC;
           read_ram : in STD_LOGIC;
           read_data_out : out STD_LOGIC_VECTOR (8 downto 0);
           finish : out STD_LOGIC);
           
    end component jollof_top;

    signal clk: std_logic:= '0';
    signal rst: std_logic:= '1';
    signal input_data: std_logic_vector (7 downto 0);
    signal read_ram: std_logic:= '0';
    signal read_data_out: std_logic_vector (8 downto 0);
    signal finish: std_logic;
    signal valid_input: std_logic;
    signal delay_sig: std_logic:= '0';

    type state_type is (s_idle, s_give_input, s_wait_calc, s_read_ram);
    signal state_reg, state_next: state_type;
    signal done_flag, done_next: std_logic;
    signal sample_cnt_reg, sample_cnt_next: unsigned(5 downto 0);
    signal rd_cnt_reg, rd_cnt_next: unsigned(8 downto 0);

    constant CLK_PERIOD : time := 10ns;

begin

    DUT_jollof_top: jollof_top 
    port map(
        clk => clk,
        rst => rst,
        input_data => input_data,
        valid_input => valid_input,
        read_ram => read_ram,
        read_data_out => read_data_out,
        finish => finish
        ); 


    clk <= not clk after CLK_PERIOD/2;
    rst <= '0' after 100ns;
    -- valid_input <= '0', '1' after 1700ns, '0' after 1710ns;
    delay_sig <= '1' after 1710ns;

    process(clk, rst)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then 
                state_reg <= s_idle;
                done_flag <= '0';
                sample_cnt_reg <= (others => '0');
                rd_cnt_reg <= (others => '0');
            else 
                state_reg <= state_next;
                done_flag <= done_next;
                sample_cnt_reg <= sample_cnt_next;
                rd_cnt_reg <= rd_cnt_next;
            end if;
        end if;
    end process;

    -- next state and output
    process (state_reg, delay_sig, done_flag, sample_cnt_reg, rd_cnt_reg, finish) is
        file input_stimuli : text open READ_MODE is "/h/dc/o/si3116uw-s/icp1matrix/functional_model_stimuli/input_stimuli.txt";
        file output_results : text open WRITE_MODE is "/h/dc/o/si3116uw-s/icp1matrix/jollof_sim/output.txt";
        variable line_v : line;
        variable input_v : std_logic_vector(7 downto 0);
        variable flag : boolean:= false;
    begin 
        valid_input <= '0';
        read_ram <= '0';
        state_next <= state_reg;
        done_next <= done_flag;
        rd_cnt_next <= rd_cnt_reg;
        sample_cnt_next <= sample_cnt_reg;
        input_data <= (others => '0');

        case state_reg is
            when s_idle =>
                if (done_flag = '1') then
                    state_next <= s_idle;
                    -- finish;
                elsif (delay_sig = '1') then
                    done_next <= '1';
                    state_next <= s_give_input;
                end if;

            when s_give_input =>
                valid_input <= '1';

                if (not endfile(input_stimuli)) then
                    readline(input_stimuli, line_v);
                    read(line_v, input_v);
                    input_data <= input_v;
                    sample_cnt_next <= sample_cnt_reg + 1;

                    if (sample_cnt_reg = 31) then
                        sample_cnt_next <= (others => '0');
                        state_next <= s_wait_calc;
                    else
                        state_next <= s_give_input;
                    end if;
                else 
                    state_next <= s_wait_calc;
                end if;

            when s_wait_calc =>
                input_data <= input_v;
                if (finish = '0') then
                    state_next <= s_wait_calc;
                elsif (endfile(input_stimuli)) then
                    state_next <= s_read_ram;
                    read_ram <= '1';
                else
                    state_next <= s_give_input;
                end if;

            when s_read_ram =>
                read_ram <= '1';

                rd_cnt_next <= rd_cnt_reg + 1;
    
                if rd_cnt_reg < 4 then
                    state_next <= s_read_ram;
                elsif rd_cnt_reg < 320 then
                    write(line_v, read_data_out);
                    if (flag = false) then
                        flag := true;
                    else 
                        flag := false;
                        writeline(output_results, line_v);      
                    end if; 
                    state_next <= s_read_ram;
                else
                    state_next <= s_idle;
                end if;
        end case;
    end process;
end Behavioral;
