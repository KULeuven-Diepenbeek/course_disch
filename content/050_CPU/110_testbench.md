---
title: 'Opdracht testbench'
chapter: false
weight: 110
pre: "<i class='fas fa-book'></i> "
draft: false
---


```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_cpu is
--  Port ( );
end tb_cpu;

architecture Behavioral of tb_cpu is

component hack_cpu is
  Port (instruction, inM: in std_logic_vector(15 downto 0);
        clock, reset: in std_logic; 
        outM, addressM, PC: out std_logic_vector(15 downto 0);
        writeM: out std_logic);
end component;

signal instruction, inM: std_logic_vector(15 downto 0);
signal clock, reset: std_logic; 
signal outM, addressM, PC: std_logic_vector(15 downto 0);
signal writeM: std_logic;

constant clock_period : time := 10 ns;

begin

DUT: hack_cpu
    port map(   instruction => instruction,
                inM => inM,
                clock => clock,
                reset => reset,
                outM => outM,
                addressM => addressM,
                PC => PC,
                writeM => writeM);
                
CLK: process begin
    clock <= '0';
    wait for clock_period/2;
    clock <= '1';
    wait for clock_period/2; 
end process;   

PSTIM: process begin
    instruction <= "0000000000000000";
    inM <= "0000000000000000";
    reset <= '0';

    wait for clock_period/4;
    
    instruction <= "0000000000000000";
    inM <= "0000000000000000";
    reset <= '1';
    
    wait for clock_period;
    
    assert (PC = "0000000000000000") report "reset werkt niet" severity failure;  
    
    instruction <= "0000000000000010"; --load reg A
    inM <= "0000000000000000";
    reset <= '0';
    
    wait for clock_period;
    
                  --111accccccdddjjj   
    instruction <= "1--0110000011000"; --kopie naar reg D
    inM <= "----------------";
    reset <= '0';
    
    wait for clock_period;
    
    assert (outM = "0000000000000010") report "A register save and load werkt niet" severity failure;  
    
                  --111accccccdddjjj      
    instruction <= "1--0010011011000"; --D-A = 0
    inM <= "----------------";
    reset <= '0';
    
    wait for clock_period/8;
    
    assert (outM = "0000000000000000") report "compute werkt niet" severity failure;  --moet voor de stijgende flank van de clock gecheckd worden. Op de flank wordt de waarde uitgelezen en weggeschreven naar het geheugen
    
    wait for clock_period;
    
    
    
                  --111accccccdddjjj C instructie      
    instruction <= "0000010011011000"; --A instructie
    inM <= "----------------";
    reset <= '0';
    
    wait for clock_period;    

    assert (addressM = "0000010011011000") report "address werkt niet" severity failure; 
    assert (writeM = '0') report "writeM werkt niet" severity failure;   
    
                  --111accccccdddjjj C instructie      
    instruction <= "1001110001001000";
    inM <= x"5555";
    reset <= '0';

    wait for clock_period/8;
    
    assert (outM = x"AAAA") report "inverteer werkt niet" severity failure;  
    assert (writeM = '1') report "writeM werkt niet" severity failure;         
    
    wait for clock_period;    
    wait for clock_period/4; 

                  --111accccccdddjjj C instructie      
    instruction <= "0000010011011110"; --A instructie
    
    wait for clock_period;   

                  --111accccccdddjjj C instructie      
    instruction <= "1--0110000010000"; --kopieer register A naar D 
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "0000000000000010"; --set jump address (A instructie)
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110000000000111"; --jump naar A
    
    wait for clock_period;
    
    assert (PC = "0000000000000010") report "jump werkt niet" severity failure;
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110001100000000"; --vraag D op
    
    wait for clock_period/8;
    
    assert (outM = "0000010011011110") report "D wordt niet onthouden na jump" severity failure;
    
    wait for clock_period;      
    
                  --111accccccdddjjj C instructie      
    instruction <= "0000000000000001"; --A instructie
    
    wait for clock_period;    
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110110111100000"; -- register A + 1    
    
    wait for clock_period;    
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110110111100000"; -- register A + 1
        
    wait for clock_period;    
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110110111100000"; -- register A + 1    
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110110111101000"; -- register A + 1 en output
    
    wait for clock_period/8;
    
    assert (outM = "0000000000000101") report "A+1 werkt niet" severity failure;
         
    wait for clock_period;
         
                  --111accccccdddjjj C instructie      
    instruction <= "0001010011011110"; --A instructie
    
    wait for clock_period;   

                  --111accccccdddjjj C instructie      
    instruction <= "1--0110000010000"; --kopieer register A naar D 
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "0100010111011110"; --A instructie
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110000000001000"; --AND functie    
    
    wait for clock_period/8;
    
    assert (outM = "0000010011011110") report "AND werkt niet" severity failure;          
    
                      --111accccccdddjjj C instructie      
    instruction <= "0001010011011110"; --A instructie
    
    wait for clock_period;   

                  --111accccccdddjjj C instructie      
    instruction <= "1--0110000010000"; --kopieer register A naar D 
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "0100010111011110"; --A instructie
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110010101001000"; --AND functie    
    
    wait for clock_period/8;
    
    assert (outM = "0101010111011110") report "OR werkt niet" severity failure;    
         
                      --111accccccdddjjj C instructie      
    instruction <= "0001010011011110"; --A instructie
    
    wait for clock_period;   

                  --111accccccdddjjj C instructie      
    instruction <= "1--0110000010000"; --kopieer register A naar D 
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "0100010111011110"; --A instructie
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110000010001000"; --PLUS functie    
    
    wait for clock_period/8;
    
    assert (outM = "0101101010111100") report "PLUS werkt niet" severity failure;          
    
                      --111accccccdddjjj C instructie      
    instruction <= "0001010011011110"; --A instructie
    
    wait for clock_period;   

                  --111accccccdddjjj C instructie      
    instruction <= "1--0110000010000"; --kopieer register A naar D 
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "0100010111011110"; --A instructie
    
    wait for clock_period;
    
                  --111accccccdddjjj C instructie      
    instruction <= "1110010011001100"; --MIN functie    
    
    wait for clock_period/8;
        
    assert (outM = "1100111100000000") report "MIN werkt niet" severity failure;
    
    wait for clock_period;
    
    assert (PC = "0100010111011110") report "JUMP werkt niet" severity failure;                  
         
    wait;
end process;        

end Behavioral;

```