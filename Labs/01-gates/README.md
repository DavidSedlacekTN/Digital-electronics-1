# Verification of De Morgan's laws of function f(c,b,a)
## Table
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

## Image
![alt text](https://github.com/DavidSedlacekTN/Digital-electronics-1/blob/main/Labs/01-gates/Images/DeMorgansLaws.PNG)

## VHDL code - data from *design.vhd* file
 
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

## Link to EDA playground
Click here [EDA Playground-Exercise nr. 1] (https://www.edaplayground.com/x/grek).

# Verification of Distributive laws
## Image
![alt text](https://github.com/DavidSedlacekTN/Digital-electronics-1/blob/main/Labs/01-gates/Images/DistributiveLaws.PNG)

## VHDL code - data from *design.vhd* file
```VHDL

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        x_i        : in  std_logic;         -- Data input
        y_i        : in  std_logic;         -- Data input
        z_i        : in  std_logic;         -- Data input
        fpos1_o    : out std_logic;         -- first postulate function
        fpos2_o    : out std_logic;         -- second postulate function
        fpos3_o    : out std_logic;         -- third postulate function
        fpos4_o    : out std_logic;         -- fourth postulate function
        fdist1_o   : out std_logic;         -- first distributive function
        fdist2_o   : out std_logic;         -- second distributive function
        fdist3_o   : out std_logic;         -- third distributive function
        fdist4_o   : out std_logic          -- fourth distributive function
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin

    fpos1_o   <=  x_i and (not x_i);
    fpos2_o   <=  x_i or (not x_i);
    fpos3_o   <=  x_i or x_i or x_i;
    fpos4_o   <=  x_i and x_i and x_i;
    fdist1_o  <=  (x_i and y_i) or (x_i and z_i);
    fdist2_o  <=  x_i and (y_i or z_i);   
    fdist3_o  <=  (x_i or y_i) and (x_i or z_i);
    fdist4_o  <=  x_i or (y_i and z_i);   

end architecture dataflow;
```
## Link to EDA playground
Click here [EDA Playground-Exercise nr. 1_Homework] (https://www.edaplayground.com/x/GmGS).



