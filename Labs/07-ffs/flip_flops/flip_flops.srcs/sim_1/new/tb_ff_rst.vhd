----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 12:05:37 PM
-- Design Name: 
-- Module Name: tb_ff_rst - Behavioral
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

entity tb_ff_rst is
--  Port ( );
end tb_ff_rst;

architecture Behavioral of tb_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    signal s_rst        : std_logic;
    signal s_clk_100MHz : std_logic;
    signal s_d          : std_logic;
    signal s_q          : std_logic;
    signal s_q_bar      : std_logic;

begin
    uut_d_ff_rst : entity work.d_ff_rst
    port map(
        rst   => s_rst,
        clk   => s_clk_100MHz,
        d     => s_d,
        q     => s_q,
        q_bar => s_q_bar    
    );
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop
            s_clk_100MHZ <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHZ <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen: process
    begin
        s_rst <= '0';
        wait for 40 ns;
        
        s_rst <= '1';
        wait for 20 ns;
        
        s_rst <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus: process
    begin
        report "Stimulus process started" severity note;
        
        --d sequence
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        --d sequence
        
        -- check reset on rising edge;
        wait for 5 ns;
        assert(s_q = '0' and s_q_bar = '1')
        report "There was an error while asserting s_q = '0' and s_q_bar = '1'" severity error;
        
        --d sequence
        wait for 5 ns;
        s_d <= '0';
        wait for 10 ns;
        --/d sequence
        
        -- check when d = '0' on rising edge;
        wait for 5 ns;
        assert(s_q = '0' and s_q_bar = '1')
        report "There was an error while asserting s_q = '0' and s_q_bar = '1'" severity error;
        
         --d sequence
        wait for 5 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        --/d sequence
        
        -- check when d = '1' on rising edge;
        wait for 7 ns;
        assert(s_q = '1' and s_q_bar = '0')
        report "There was an error while asserting s_q = '1' and s_q_bar = '0'" severity error;
        
        --/d sequence
        wait for 3 ns;
        s_d <= '0';
        wait for 10 ns;
        --/d sequence
        
        report "Stimulus process finished" severity note;
        wait;
        
    end process p_stimulus;
end Behavioral;
