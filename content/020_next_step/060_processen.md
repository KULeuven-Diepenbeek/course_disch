---
title: 'Processen'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 60
draft: false
---

Vaak wil je **if** gebruiken in de code en als dat het geval is kunnen we een **process** maken. We kunnen niet los zonder process een if statement zetten.

**Processen hebben** een **naam** in dit geval p1 **en** een **sensitivity list**. De sensitivity list is hetgeen dat tussen haakjes staat. Dit geeft aan **wanneer** het **process** moet worden **uitgevoerd**. Voor **combinatorische logica** moeten daar **alle ingangen en tussensignalen** van het process staan. Bij **sequentiële logica** staat daar meestal alleen de **clock** en optioneel een **reset**. 

Onderstaand process is een multiplexer met ingangen A en B. Select pin noemt S. De uitgang noemt Y.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processes_example is
  Port (A: in STD_LOGIC;
        B: in STD_LOGIC;
        S: in STD_LOGIC;
        Y: out STD_LOGIC);
end processes_example;

architecture Behavioral of processes_example is

begin

p1: process(A, B, S)
begin
    if S = '1' then
        Y <= A;
    else
        Y <= B;
    end if;
end process;

end Behavioral;
```

{{% figure src="/images/MUX.png" title="Multiplexer"  %}}