---
title: 'Intro Sequentiële logica'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 410
draft: false
---

Zoals er eerder al aangehaald worden alle componenten **tegelijkertijd** uitgevoerd. Net zoals op een breadboard, zijn alle componenten en poorten gelijktijdig actief. Wanneer het ontwerp complexer wordt, is het bijna onmogelijk om iets realiseren als er geen *orde* of *volgorde* is. Hiervoor is het **klok-signaal** ontstaan. Dit signaal speelt een soortgelijke rol zoals die van een dirigent bij een concert.

{{% multiHcolumn %}}

{{% column %}}
Als we bij combinatorische logica de ingang veranderen, duurt het een zekere tijd voordat dat de uitgang (mogelijks) verandert. Bij sequentiële logica gaan we wachten met de ingang in te lezen tot de stijgende flank van de clock. Als de timings van het design goed zijn dan is de ingang van een systeem altijd stabiel op het moment dat er een stijgende flank van een clock is.

We gaan beginnen met een simpele <strong>D flip-flop</strong> te maken. Het enige dat deze flip-flop doet is de ingang <i>onthouden</i> op de uitgang tot de volgende stijgende flank van de clock.
{{% /column %}}

{{% column %}}
  {{% figure src="/images/D_flipflop.png" title="symbool D flip flop"  %}}<br/>
  <!-- { signal: 
    [
      {name: "Clock",  wave: '0h.l.h.l.h.l.h.l.h' },
      {name: 'Input',  wave: '1.......0....1....' },
      {name: 'Output', wave: 'x1.......0.....1..' },
]} -->

{{% /column %}}

{{% /multiHcolumn %}}

{{% figure src="/images/wavedrom/ff.png" title="timing D flip flop"  %}}
<!-- { signal: 
    [
      {name: "Clock",           wave: '0h.l.h.l.h.l.h.l.h.l.h.l.' },
      {name: 'Input',           wave: '1...0...1.......0.1......' },
      {name: 'Output', wave: 'x1...0...1.......0...1...' },    
    ]
} -->


Onderstaande vhdl code is een voorbeeld van een flip-flop. Het is hier belangrijk om te zien dat bij het process alleen de clock in de sensitivity list zit.

```vhdl
--------------------------------
-- Revision     Date       Author     Comments
-- v0.1         20240122   VlJo       Initial version
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_flipflop is
    Port (
        clock: in std_logic;
        D: in std_logic;
        Q: out std_logic)
    ;
end D_flipflop;

architecture Behavioral of D_flipflop is

    signal clock_i : std_logic;
    signal D_i : std_logic;
    signal Q_i : std_logic;

begin

    --------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    --------------------------------
    clock_i <= clock;
    D_i <= D;
    Q <= Q_i;

    --------------------------------
    -- SEQUENTIAL
    --------------------------------
    SEQ: process(clock_i)
    begin
 
        if clock_i'event and clock_i = '1' then
            Q_i <= D_i;    
        end if;

    end process;

end Behavioral;
```

Een alternatief voor ```if clock_i'event and clock_i = '1' then``` is ook wel ```if rising_edge(clock_i) then```.