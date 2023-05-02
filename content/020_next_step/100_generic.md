---
title: 'Generic'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 100
draft: false
---

Oplettende studenten hebben door dat de ripple carry adder niet goed **schaalbaar** is. Wat als de getallen nu 16 of 32 bits worden in een andere toepassing? Dit kunnen we oplossen door **generics** te gebruiken. Als voorbeeld hebben we een 8-bit AND poort die generic is en kan schalen.

{{% figure src="/images/generic_and.png" title="Generic AND voorstelling"  %}}

Je kan deze AND poort beschrijven met onderstaand code. De variable N wordt gebruikt als het aantal inputs.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity AND_operation is
  generic(N : integer := 8);
  Port (A_vector: in std_logic_vector(N-1 downto 0);
        B_vector: in std_logic_vector(N-1 downto 0);
        Y_vector: out std_logic_vector(N-1 downto 0));
end AND_operation;

architecture Behavioral of AND_operation is

begin


GEN : for i in 0 to N-1 generate
    Y_vector(i) <= A_vector(i) AND B_vector(i);
end generate;

end Behavioral;
```

{{% notice warning %}}
Voor **integers** wordt er **:=** gebruikt in VHDL.
{{% /notice %}}

Als we deze AND poort dan gebruiken kunnen we de N waarde aanpassen. In dit voorbeeld zetten we de N op 16.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gebruik_and is
 Port (A_vector: in std_logic_vector(15 downto 0);
       B_vector: in std_logic_vector(15 downto 0);
       Y_vector: out std_logic_vector(15 downto 0));
end gebruik_and;

architecture Behavioral of gebruik_and is

component AND_operation is
  generic(N : integer);
  Port (A_vector: in std_logic_vector(N-1 downto 0);
        B_vector: in std_logic_vector(N-1 downto 0);
        Y_vector: out std_logic_vector(N-1 downto 0));
end component;

begin

    AND_instantie: AND_operation
        generic map(N => 16)
        port map (  A_vector => A_vector,
                    B_vector => B_vector,
                    Y_vector => Y_vector);


end Behavioral;

```