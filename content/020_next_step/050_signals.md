---
title: 'Signals'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 50
draft: true
---

Natuurlijk hebben we soms ook **tussensignalen** nodig in ons project/code. Hiervoor gebruiken we **signals**.
Signals declareer je **na** de **architecture** maar **voor** het **begin** keyword, zoals in het voorbeeld hieronder.


```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signal_example is
  Port (A_vector: in std_logic_vector(7 downto 0);
        Y_vector: out std_logic_vector(7 downto 0));
end signal_example;

architecture Behavioral of signal_example is

    signal tussenresultaat: std_logic;

begin

    tussenresultaat <= A_vector(0) AND A_vector(1);
    Y_vector(7) <= tussenresultaat;
    Y_vector(6 downto 0) <= A_vector(7 downto 1);
    
end Behavioral;
```