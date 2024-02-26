---
title: 'Testbench ALU'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 340
draft: false
---

De testbench om te testen of de ALU werkt is deze. Deze testbench wordt ook gebruikt om de opdracht te verbeteren!

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

entity tb_ALU is
--  Port ( );
end tb_ALU;

architecture Behavioral of tb_ALU is
    component ALU is
      Port (zx, nx, zy, ny, f, no: in std_logic ;
            x, y: in std_logic_vector(15 downto 0);
            z : out std_logic_vector(15 downto 0);
            zr, ng: out std_logic);
    end component;
    
    signal zx, nx, zy, ny, f, no:  std_logic ;
    signal x, y:  std_logic_vector(15 downto 0);
    signal z :  std_logic_vector(15 downto 0);
    signal zr, ng:  std_logic;

    
begin

DUT: ALU port map(
    zx => zx,
    nx => nx,
    zy => zy,
    ny => ny,
    f => f,
    no => no,
    x => x,
    y => y,
    z => z,
    zr => zr,
    ng => ng
);

PROC: process begin
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '0';
    x <= "0000000000000000";
    y <= "0000000000000000";
    
    wait for 10ns;
    
    
    zx <= '1';
    nx <= '0';
    zy <= '1';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 10ns;
    assert (z = "0000000000000000") report "0 werkt niet" severity failure;
    assert (zr = '1') report "zr werkt niet" severity failure;
    wait for 10ns;
    
    zx <= '1';
    nx <= '1';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    x <= "0000000011111111";
    y <= "0011100111100110";
    wait for 10ns;
    assert (z = "0000000000000001") report "1 werkt niet" severity failure;
    wait for 10ns;
    
    zx <= '1';
    nx <= '1';
    zy <= '1';
    ny <= '0';
    f  <= '1';
    no <= '0';
    x <= "0000000011111111";
    y <= "0011100111100110";
    wait for 10ns;
    assert (z = "1111111111111111") report "-1 werkt niet" severity failure;
    wait for 10ns;
    
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '0';
    no <= '0';
    x <= "0000110111111110";
    y <= "0011100111100110";
    wait for 10ns;
    assert (z = "0000110111111110") report "x doorlaten werkt niet" severity failure;
    wait for 10ns;
    
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '0';
    x <= "0000110111111110";
    y <= "0011100101100110";
    wait for 10ns;
    assert (z = "0011100101100110") report "y doorlaten werkt niet" severity failure;
    wait for 10ns;    
    
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '0';
    no <= '1';
    x <= "0011111111111111";
    y <= "0011100101100110";
    wait for 10ns;
    assert (z = "1100000000000000") report "niet x werkt niet" severity failure;
    wait for 10ns; 
        
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '1';
    x <= "0011111000001111";
    y <= "0011011111111110";
    wait for 10ns;
    assert (z = "1100100000000001") report "niet y werkt niet" severity failure;
    wait for 10ns;     
    
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    x <= "0000000000000111";
    y <= "0011011111111110";
    wait for 10ns;
    assert (z = "1111111111111001") report "min x werkt niet" severity failure;
    wait for 10ns;    
    
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '1';
    x <= "0000000000000111";
    y <= "0111111111111110";
    wait for 10ns;
    assert (z = "1000000000000010") report "min y werkt niet" severity failure;
    wait for 10ns;      
    
    zx <= '0';
    nx <= '1';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    x <= "0000000000000111";
    y <= "0111111111110110";
    wait for 10ns;
    assert (z = "0000000000001000") report "x+1 werkt niet" severity failure;
    wait for 10ns;    
    
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '1';
    f  <= '1';
    no <= '1';
    x <= "0000000000000111";
    y <= "0111111111111110";
    wait for 10ns;
    assert (z = "0111111111111111") report "y+1 werkt niet" severity failure;
    wait for 10ns;   
    
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '0';
    x <= "0000000000000111";
    y <= "0111111111100000";
    wait for 10ns;
    assert (z = "0111111111100111") report "x+y werkt niet" severity failure;
    wait for 10ns;     
    
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '0';
    x <= "0000111000000111";
    y <= "0111111111100000";
    wait for 10ns;
    assert (z = "0000111000000000") report "x&y werkt niet" severity failure;
    wait for 10ns;     
    
    zx <= '0';
    nx <= '1';
    zy <= '0';
    ny <= '1';
    f  <= '0';
    no <= '1';
    x <= "0000111000000111";
    y <= "0111111111100000";
    wait for 10ns;
    assert (z = "0111111111100111") report "x|y werkt niet" severity failure;
    wait for 10ns;       
    
    zx <= '0';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '1';
    x <= "0000000000000010";
    y <= "0000000000000100";
    wait for 10ns;
    assert (z = "1111111111111110") report "x-y werkt niet" severity failure;
    assert (ng = '1') report "ng werkt niet" severity failure;
    wait for 10ns;      
    
    wait;
end process;

end Behavioral;

```