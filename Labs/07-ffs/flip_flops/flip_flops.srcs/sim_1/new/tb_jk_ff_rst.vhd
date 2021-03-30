----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2021 02:23:43 PM
-- Design Name: 
-- Module Name: tb_jk_ff_rst - Behavioral
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

entity tb_jk_ff_rst is
--  Port ( );
end tb_jk_ff_rst;

architecture Behavioral of tb_jk_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    signal s_rst        : std_logic;
    signal s_clk_100MHz : std_logic;
    signal s_j          : std_logic;
    signal s_k          : std_logic;
    signal s_q          : std_logic;
    signal s_q_bar      : std_logic;

begin
    uut_jk_ff_rst : entity work.jk_ff_rst
    port map(
        rst     => s_rst,
        clk     => s_clk_100MHz,
        j       => s_j,   
        k       => s_k,   
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
        s_rst <= '0';
        wait for 58 ns;
        
        s_rst <= '1';
        wait for 15 ns;
        
        s_rst <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus: process
    begin
        report "Stimulus process started" severity note;
        
        --jk sequence
        wait for 10 ns;
        s_j <= '0';
        s_k <= '0';
        wait for 20 ns;
        s_j <= '0';
        s_k <= '1';
        wait for 20 ns;
        s_j <= '1';
        s_k <= '0';
        wait for 20 ns;
        s_j <= '1';
        s_k <= '1';
        --/jk sequence
        
        --check for Toggle
        wait for 7 ns;
        assert(s_q = '1' and s_q_bar = '0')
        report "There was an error while asserting s_q = '1' and s_q_bar = '0'" severity error;
        
        --jk sequence
        wait for 13 ns;
        s_j <= '0';
        s_k <= '0';
        wait for 20 ns;
        s_j <= '1';
        s_k <= '0';
        --/jk sequence
        
        --check for Set
        wait for 7 ns;
        assert(s_q = '1' and s_q_bar = '0')
        report "There was an error while asserting s_q = '1' and s_q_bar = '0'" severity error;
        
        --jk sequence
        wait for 13 ns;
        s_j <= '0';
        s_k <= '0';
        --/jk sequence
        
        
        --check for No change
        wait for 7 ns;
        assert(s_q = '1' and s_q_bar = '0')
        report "There was an error while asserting s_q = '1' and s_q_bar = '0'" severity error;
        
        --jk sequence
        wait for 13 ns;
        s_j <= '0';
        s_k <= '1';
        wait for 7 ns;
        --/jk sequence
        
        --check for Reset
        assert(s_q = '0' and s_q_bar = '1')
        report "There was an error while asserting s_q = '0' and s_q_bar = '1'" severity error;       
        wait for 13 ns;
        
        report "Stimulus process finished" severity note;
        wait;
        
    end process p_stimulus;

end Behavioral;
