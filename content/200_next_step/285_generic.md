---
title: 'Generic'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 285
draft: false
---

Sommige studenten hebben misschien al door dat de componenten tot hiertoe niet goed **schaalbaar** zijn. Wat als er nu nood is aan een 6-bit XOR poort? Moeten we dan voor iedere mogelijke breedte een nieuwe component maken? **Nee!** Dit kunnen we oplossen door **generics** te gebruiken. Als voorbeeld hebben we een 8-bit AND poort die generic is en kan schalen.

{{% figure src="/images/generic_and.png" title="Generic AND voorstelling"  %}}

Je kan deze AND poort beschrijven met onderstaand code. De variable N wordt gebruikt als het aantal inputs.

```vhdl
--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     nbit_and - Behavioural
-- Project Name:    Digitale eletronische schakelingen
-- Description:     n-bit AND poort ter illustratie van het gebruik van generics
--
-- Revision     Date       Author     Comments
-- v0.1         20140119   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_and is
    Generic(
        N : integer := 8
    );
    Port (
        A_vector: in std_logic_vector(N-1 downto 0);
        B_vector: in std_logic_vector(N-1 downto 0);
        Z_vector: out std_logic_vector(N-1 downto 0)
    );
end nbit_and;

architecture Behavioral of nbit_and is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal A_vector_i : std_logic_vector(N-1 downto 0);
    signal B_vector_i : std_logic_vector(N-1 downto 0);
    signal Z_vector_i : std_logic_vector(N-1 downto 0)

begin
    --------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    --------------------------------
    A_vector_i <= A_vector;
    B_vector_i <= B_vector;
    Z_vector <= Z_vector_i;

    --------------------------------
    -- COMBINATORIAL
    --------------------------------
    Z_vector_i <= A_vector_i AND B_vector_i;

end Behavioral;
```

{{% notice warning %}}
Voor **integers** wordt er **:=** gebruikt in VHDL.
{{% /notice %}}

Als we dergelijk beschreven AND poort willen gebruiken, kunnen we de N waarde aanpassen. In dit voorbeeld wordt de nbit_and twee maal geïnstantieerd: een keer op 4 en een keer op 91.

```vhdl
...
architecture Behavioral of demo is

    component nbit_and is
        Generic(
            N : integer := 8
        );
        Port (
            A_vector: in std_logic_vector(N-1 downto 0);
            B_vector: in std_logic_vector(N-1 downto 0);
            Z_vector: out std_logic_vector(N-1 downto 0)
        );
    end component nbit_and;

    ...
begin

    mijn_4_bit_and_poort: component nbit_and
        generic map(    N => 4)
        port map (      A_vector => een_vier_bit_a,
                        B_vector => een_vier_bit_b,
                        Z_vector => een_vier_bit_z);
    
    ...

    mijn_91_bit_and_poort: component nbit_and
        generic map(    N => 91)
        port map (      A_vector => een_eenennegentig_bit_a,
                        B_vector => een_eenennegentig_bit_b,
                        Z_vector => een_eenennegentig_bit_z);

    ...
end Behavioral;

```