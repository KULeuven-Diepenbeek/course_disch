---
title: 'Opdracht - testbench'
chapter: false
weight: 470
pre: "<i class='fas fa-book'></i> "
draft: false
---

Deze testbench wordt gebruikt voor de evaluatie.

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

entity tb_counter is
--  Port ( );
end tb_counter;

architecture Behavioral of tb_counter is

component counter is
  Port (clock,reset, load, inc: in std_logic;
        data_in : in std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0) );
end component;

constant clock_period : time := 10 ns;

signal clock,reset, load, inc: std_logic;
signal data_in : std_logic_vector(15 downto 0);
signal data_out : std_logic_vector(15 downto 0);

begin

DUT: counter
    port map(   data_in => data_in,
                data_out => data_out,
                clock => clock,
                reset => reset,
                load => load,
                inc => inc);
              
CLK: process begin
    clock <= '0';
    wait for clock_period/2;
    clock <= '1';
    wait for clock_period/2; 
end process;                
                
PSTIM: process begin
    data_in <= "0000000000000000";
    reset <= '0';
    load <= '0';
    inc <= '0';
    
    wait for clock_period/8;
    wait for clock_period*2;
    
    data_in <= "0000000000000000";
    reset <= '1';
    load <= '0';
    inc <= '0';
    
    wait for clock_period*2;
    
    assert (data_out = "0000000000000000") report "reset werkt niet" severity failure;
    
    data_in <= "0000000000000000";
    reset <= '0';
    load <= '0';
    inc <= '1';
    
    wait for clock_period;
    
    assert (data_out = "0000000000000001") report "increment werkt niet" severity failure;
    
    wait for clock_period*10;
    
    assert (data_out = "0000000000001011") report "increment werkt niet" severity failure;
    
    data_in <= "0000111000000000";
    reset <= '0';
    load <= '1';
    inc <= '0';    
    
    wait for clock_period;    
    
    assert (data_out = "0000111000000000") report "load werkt niet" severity failure;
    
    
    data_in <= "0000111000000000";
    reset <= '0';
    load <= '0';
    inc <= '1';      
    
    wait for clock_period;    
    
    assert (data_out = "0000111000000001") report "inc na load werkt niet" severity failure;
    
    data_in <= "1111111111111111";
    reset <= '0';
    load <= '1';
    inc <= '0';  
    
    wait for clock_period;    
    
    assert (data_out = "1111111111111111") report "load werkt niet" severity failure;      
 
    data_in <= "1111110011111111";
    reset <= '0';
    load <= '1';
    inc <= '1';  
    
    wait for clock_period;
    
    assert (data_out = "1111110011111111") report "load before increment werkt niet" severity failure;
    
    data_in <= "1111111111111111";
    reset <= '0';
    load <= '1';
    inc <= '0';  
    
    wait for clock_period;    
    
    assert (data_out = "1111111111111111") report "load werkt niet" severity failure;      
 
    data_in <= "1100110011110011";
    reset <= '0';
    load <= '0';
    inc <= '1';  
    
    wait for clock_period;
    
    assert (data_out = "0000000000000000") report "overflow werkt niet" severity failure;           
    
    data_in <= "1100110011111111";
    reset <= '1';
    load <= '1';
    inc <= '1';  
    
    wait for clock_period;
    
    assert (data_out = "0000000000000000") report "reset werkt niet" severity failure;   
    
    data_in <= "1100110011111111";
    reset <= 'H';
    load <= 'L';
    inc <= 'L';  
    
    wait for clock_period;
    
    assert (data_out = "0000000000000000") report "reset werkt niet" severity failure;         
    
    data_in <= "1100110011111111";
    reset <= 'L';
    load <= '0';
    inc <= '1';  
    
    wait for clock_period;
    
    assert (data_out = "0000000000000001") report "iets werkt niet" severity failure;                
    
    data_in <= "1100110011111111";
    reset <= 'X';
    load <= 'L';
    inc <= 'H';  
    
    wait for clock_period;
    
    data_in <= "1100110011111111";
    reset <= '1';
    load <= 'W';
    inc <= 'Z';  
    
    wait for clock_period;
    
    assert (data_out = "0000000000000000") report "reset werkt niet" severity failure;              
    
    wait;        
       
end process;                


end Behavioral;
```