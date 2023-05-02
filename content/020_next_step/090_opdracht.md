---
title: 'Opdracht 2: Ripple carry adder'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 90
draft: false
---

De bedoeling is nu om een **8 bit ripple-carry adder** te maken. Voor als je vergeten bent hoe een full adder en half adder eruit ziet, kan je kijken naar onderstaande schema's. Bij een ripple-carry adder wordt de C out van de eerste adder doorgegeven aan de tweede adder. We werken in little endian.

Het is **niet** de bedoeling dat je de + operator gebruikt van "std_logic_unsigned"  of "std_logic_signed"!


{{% figure src="/images/half_adder.png" title="Half adder"  %}}
{{% figure src="/images/full_adder.png" title="Full adder"  %}}
{{% figure src="/images/ripple_carry_adder.png" title="ripple carry adder"  %}}

{{% notice warning %}}
Het is altijd een goed idee om eerst een tekening te maken voordat je begint met typen.
{{% /notice %}}

## testbench

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_adder is
--  Port ( );
end tb_adder;

architecture Behavioral of tb_adder is

component adder is
  Port (A_vector: in std_logic_vector(7 downto 0);
        B_vector: in std_logic_vector(7 downto 0);
        Y_vector: out std_logic_vector(7 downto 0));
end component;

signal A_vector, B_vector, Y_vector : std_logic_vector(7 downto 0);

begin

DUT: adder port map(
    A_vector => A_vector,
    B_vector => B_vector,
    Y_vector => Y_vector
);

 PSTIM: process
  begin
    A_vector <= "00000000";
    B_vector <= "00000000";
    wait for 10ns;
    assert (Y_vector = "00000000") report "ADDER werkt niet" severity failure;
    
    wait for 10ns;    
    A_vector <= "00000001";
    B_vector <= "00000000";
    wait for 10ns;
    assert (Y_vector = "00000001") report "ADDER werkt niet" severity failure;
    
    wait for 10ns;    
    A_vector <= "00000000";
    B_vector <= "00000001";
    wait for 10ns;
    assert (Y_vector = "00000001") report "ADDER werkt niet" severity failure;
    
    wait for 10ns;    
    A_vector <= "00000001";
    B_vector <= "00000001";
    wait for 10ns;
    assert (Y_vector = "00000010") report "ADDER werkt niet" severity failure;
    
    wait for 10ns;    
    A_vector <= "11111111";
    B_vector <= "00000001";
    wait for 10ns;
    assert (Y_vector = "00000000") report "ADDER werkt niet" severity failure;
    
    wait for 10ns;    
    A_vector <= "11111111";
    B_vector <= "00000001";
    wait for 10ns;
    assert (Y_vector = "00000000") report "ADDER werkt niet" severity failure;
    
    wait for 10ns;    
    A_vector <= "11111111";
    B_vector <= "11111111";
    wait for 10ns;
    assert (Y_vector = "11111110") report "ADDER werkt niet" severity failure;
        
    
    wait;
  end process;

end Behavioral;
```