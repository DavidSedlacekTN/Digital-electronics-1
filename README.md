# Digital-electronics-1

## Secondary header
*This is a test on emphasis*

### Tertiary header
**This is a test on strong emphasis**

## List
1. First item
   - Sub-first item
2. Second item
   - Sub-second item
3. Third item
   - Sub-third item

## Table
First Header | Second Header
------------ | -------------
Cell nr. 1.1 | Cell nr. 1.2
Cell nr. 2.1 | Cell nr. 2.2

## Link
I built this by using [Github site]:(https://www.github.com/).

## VHDL Source code test/example
```VHDL
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
## Image Test
Here's our logo (hover to see the title text):

Inline-style: 
!(https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")
