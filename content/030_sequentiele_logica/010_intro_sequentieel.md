---
title: 'Intro Sequentiële logica'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 10
draft: false
---

 
<div class="multicolumn">
  <div class="column" style="width: 80%">
    Vaak hebben we een clock in een design en is timing essentieel. Als we bij combinatorische logica de ingang veranderen duurt het een onbepaalde tijd eer dat de uitgang veranderd. Bij Sequentiële logica gaan we wachten met de ingang uit te lezen tot de stijgende flank van de clock. Als de timings van het design goed zijn dan is de ingang van een systeem altijd stabiel op het moment dat er een stijgende flank van een clock is.

    <br/> <br/>
    We gaan beginnen met een simple <strong>D flip-flop</strong> te maken. Het enigste dat deze flip-flop doet is de ingang herhalen op de uitgang het moment dat er een stijgende flank binnen komt op de clock.
  </div>

  <div class="column" style="width: 20%">
        {{% figure src="/images/D_flipflop.png" title="symbool D flip flop"  %}}
  </div>
</div>


Onderstaand vhdl is een voorbeeld van een flip-flop. Het is hier belangrijk om te zien dat bij het process alleen de clock in de sensitivity list zit.

```vhdl

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_flipflop is
  Port (D, clk: in std_logic;
        Y: out std_logic);
end D_flipflop;

architecture Behavioral of D_flipflop is

begin

SEQ: process(clk)
begin
 
    if clk'event and clk = '1' then
        Y <= D;    
    end if;

end process;
end Behavioral;

```