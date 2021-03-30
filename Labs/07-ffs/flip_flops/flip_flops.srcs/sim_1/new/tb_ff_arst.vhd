----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2021 01:54:32 PM
-- Design Name: 
-- Module Name: tb_ff_arst - Behavioral
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

entity tb_ff_arst is
--  Port ( );
end tb_ff_arst;

architecture Behavioral of tb_ff_arst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    signal s_arst       : std_logic;
    signal s_clk_100MHz : std_logic;
    signal s_d          : std_logic;
    signal s_q          : std_logic;
    signal s_q_bar      : std_logic;

begin
    uut_d_ff_arst : entity work.d_ff_arst
    port map(
        arst    => s_arst,
        clk     => s_clk_100MHz,
        d       => s_d,    
        q       => s_q,   
        q_bar   => s_q_bar
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
        s_arst <= '0';
        wait for 58 ns;
        
        s_arst <= '1';
        wait for 15 ns;
        
        s_arst <= '0';
        wait for 38 ns;
        
        s_arst <= '1';
        wait for 14 ns;
        
        s_arst <= '0';
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
        --/d sequence
        
        --check when d = '1' on rising edge
        wait for 7 ns;
        assert(s_q = '1' and s_q_bar = '0')
        report "There was an error while asserting s_q = '1' and s_q_bar = '0'" severity error;
        
        --d sequence
        wait for 3 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 3 ns;
        --/d sequence
        
        --check when d = '0' on rising edge
        wait for 7 ns;
        assert(s_q = '0' and s_q_bar = '1')
        report "There was an error while asserting s_q = '0' and s_q_bar = '1'" severity error;
        
        --d sequence
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        --/d sequence
        
        --check when rst = '1' on rising edge
        wait for 3 ns;
        assert(s_q = '0' and s_q_bar = '1')
        report "There was an error while asserting s_q = '0' and s_q_bar = '1'" severity error;        
        
        --d sequence
        wait for 7 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        --/d sequence
        
        report "Stimulus process finished" severity note;
        wait;
        
    end process p_stimulus;
    
end Behavioral;
