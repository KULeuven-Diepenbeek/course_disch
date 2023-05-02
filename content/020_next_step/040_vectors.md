---
title: 'Vectors'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 40
draft: false
---

Soms moet of wil je met **arrays** of **groepen van bits** werken. Natuurlijk gaat dit ook in **VHDL** en dit noemt dan **vectors**. Als we een array van 8 bits willen dan doen we dat zoals in onderstaande regel.

```vhdl
std_logic_vector(7 downto 0);
```

Als illustratie hoe vectors werken kan je onderstaand voorbeeldje bekijken.
```vhdl

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vector_example is
  Port (A_vector: in std_logic_vector(7 downto 0);
        Y_vector: out std_logic_vector(7 downto 0));
end vector_example;

architecture Behavioral of vector_example is

begin

    Y_vector(7) <= A_vector(0) AND A_vector(1);
    Y_vector(6 downto 0) <= A_vector(7 downto 1);
    
end Behavioral;

```


{{% notice note %}}
Iedere beschrijving die gemaakt wordt in VHDL (of Verilog) kan een hardware schema van gemaakt worden.
{{% /notice %}}
