# Table
| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |

# Image
![alt text](https://github.com/DavidSedlacekTN/Digital-electronics-1/blob/main/Labs/01-gates/Images/DeMorgansLaws.PNG)

# VHDL code - data from *design.vhd* file
 
```VHDL
library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i     : in  std_logic;         -- Data input
        b_i     : in  std_logic;         -- Data input
        c_i	    : in  std_logic;		 -- Data input
        for_o   : out std_logic;         -- OR output function
        fnand_o : out std_logic;         -- NAND output function
        fnor_o  : out std_logic          -- XOR output function         
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    for_o    <=  ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o  <=  not(not((not b_i) and a_i) and (not((not c_i) and (not b_i))));
    fnor_o   <=  (not(b_i or not(a_i))) or (not(c_i or b_i));

end architecture dataflow;
```

# Link to EDA playground
Click here [EDA Playground] (https://www.edaplayground.com/x/grek).


