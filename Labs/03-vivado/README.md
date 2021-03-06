# Lab 3: Introduction to Vivado

## 1. Preparation task

### Inputs
| **Switch tag** | **Connects to pin** | **Connects via** |
| :-: | :-: | :-: |
| SW0 | J15 | 10kΩ Resistor(R35) |
| SW1 | L16 | 10kΩ Resistor(R37) |
| SW2 | M13 | 10kΩ Resistor(R38) |
| SW3 | R15 | 10kΩ Resistor(R40) |
| SW4 | R17 | 10kΩ Resistor(R42) |
| SW5 | T18 | 10kΩ Resistor(R43) |
| SW6 | U18 | 10kΩ Resistor(R46) |
| SW7 | R13 | 10kΩ Resistor(R48) |
| SW8 | T8 | 10kΩ Resistor(R56) |
| SW9 | U8 | 10kΩ Resistor(R58) |
| SW10 | R16 | 10kΩ Resistor(R64) |
| SW11 | T13 | 10kΩ Resistor(R66) | 
| SW12 | H6 | 10kΩ Resistor(R68) |
| SW13 | U12 | 10kΩ Resistor(R69) |
| SW14 | U11 | 10kΩ Resistor(R71) |
| SW15 | V10 | 10kΩ Resistor(R73) |

### Outputs
| **LED tag** | **Connects to pin** | **Connects via** |
| :-: | :-: | :-: |
| LED0 | H17 | 330Ω Resistor(R33) |
| LED1 | K15 | 330Ω Resistor(R34) |
| LED2 | J13 | 330Ω Resistor(R36) |
| LED3 | N14 | 330Ω Resistor(R39) |
| LED4 | R18 | 330Ω Resistor(R41) |
| LED5 | V17 | 330Ω Resistor(R44) |
| LED6 | U17 | 330Ω Resistor(R47) |
| LED7 | U16 | 330Ω Resistor(R50) |
| LED8 | V16 | 330Ω Resistor(R52) |
| LED9 | T15 | 330Ω Resistor(R54) |
| LED10 | U14 | 330Ω Resistor(R57) |
| LED11 | T16 | 330Ω Resistor(R65) | 
| LED12 | V15 | 330Ω Resistor(R67) |
| LED13 | V14 | 330Ω Resistor(R70) |
| LED14 | V12 | 330Ω Resistor(R72) |
| LED15 | V11 | 330Ω Resistor(R74) |

## 2. Two-bit wide 4-to-1 multiplexer

### VHDL architecture *from `mux_2bit_4to1.vhd`*

```VHDL
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
```

### VHDL stimulus process *from `tb_mux_2bit_4to1.vhd`*

```VHDL
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        -- First test values
        s_d   <= "00"; s_c   <= "00"; s_b   <= "00"; s_a   <= "00";
        s_sel <= "00"; wait for 100 ns;
        
        s_a   <= "01"; wait for 100 ns;
        s_b   <= "01"; wait for 100 ns;
        
        s_sel <= "01"; wait for 100 ns;
        s_c   <= "01"; wait for 100 ns;
        s_b   <= "11"; wait for 100 ns;
        
        s_d   <= "10"; s_c   <= "11"; s_b   <= "01"; s_a   <= "00";
        s_sel <= "10"; wait for 100 ns;
        
        s_d   <= "10"; s_c   <= "11"; s_b   <= "00"; s_a   <= "01";
        s_sel <= "10"; wait for 100 ns;
        
        s_d   <= "10"; s_c   <= "11"; s_b   <= "01"; s_a   <= "00";
        s_sel <= "11"; wait for 100 ns;
             
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

### Simulated time waveforms

![Waveforms](Images/Waveforms.PNG)

## Vivado tutorial for basic operations

| **Name of operation** | **Method** | **Comments** |
| :-: | :-: | :-: |
| Project creation | Go to: *File/Project/New* → *Next* → Fill in: Project name, Directory → *Next* → Select: *RTL Project* → *Next* → Select Target language: *VHDL*, Select Simulator language: *VHDL*, Click: *Create file* → Select File type: *VHDL*, Fill in: Name → *OK* → *Next* → *(optional Constraints)* → *Next* → Go to *Boards* → Choose board → *Finish* → *OK*| - |
| Adding more source files | In project go to: *File/Add Sources* → Choose: *Add or create design sources* → Click: *Create file* → Select File type: *VHDL*, Fill in File name → *OK* → *Finnish* → *OK* | - |
| Adding testbench file | In project go to: *File/Add Sources* → Choose: *Add or create simulation sources* → Click: *Create file* → Select File type: *VHDL*, Fill in File name → *OK* → *Finnish* → *OK* | - |
| Run simulation | In project go to: *Flow/Run Simulation/Run Behavioral Simulation* | Do not forget to change Radix to Binary form |
| Adding XDC Constraints | In project go to: *File/Add Sources* → Choose: *Add or create constraints* → Click: *Create file* → Select File type: *XDC*, Fill in File name → *OK* → *Finnish*| [Click here](https://github.com/Digilent/digilent-xdc) for some referential XDCs |