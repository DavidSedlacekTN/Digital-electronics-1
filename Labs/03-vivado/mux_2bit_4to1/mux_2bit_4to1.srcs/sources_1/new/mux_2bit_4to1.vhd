library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration
------------------------------------------------------------------------
entity mux_2bit_4to1 is
    port(
        a_i           : in  std_logic_vector(2 - 1 downto 0); -- DATA A
        b_i           : in  std_logic_vector(2 - 1 downto 0); -- DATA B
        c_i           : in  std_logic_vector(2 - 1 downto 0); -- DATA C
        d_i           : in  std_logic_vector(2 - 1 downto 0); -- DATA D
        sel_i         : in  std_logic_vector(2 - 1 downto 0); -- DATA B
        
        f_o           : out std_logic_vector(2 - 1 downto 0)  -- OUTPUT
    );
end entity mux_2bit_4to1;

------------------------------------------------------------------------
-- Architecture body
------------------------------------------------------------------------
architecture Behavioral of mux_2bit_4to1 is
begin
	f_o <= a_i when (sel_i = "00") else
	       b_i when (sel_i = "01") else
	       c_i when (sel_i = "10") else
	       d_i;
    
end architecture Behavioral;
