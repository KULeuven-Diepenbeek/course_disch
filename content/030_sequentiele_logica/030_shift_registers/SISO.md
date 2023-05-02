---
title: 'SISO'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 10
draft: false
---

## SISO

Bij een serial in, serial out shift register komt de data erin en iedere clock cyclus wordt het 1 plaats verder geshift. Dus in onderstaand voorbeeld komt de data er na 4 clock cycli terug uit.

{{% figure src="/images/Shift_register_siso.png" title="SISO shift register"  %}}

Natuurlijk zijn er verschillende manier op dit te beschrijven in VHDL. Onderstaande beschrijving is een voorbeeld.
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SISO_shift_register is
  Port (clk: in std_logic;
        D: in std_logic;
        Y: out std_logic);
end SISO_shift_register;

architecture Behavioral of SISO_shift_register is
    signal buf: std_logic_vector(3 downto 0);

begin

SEQ: process(clk) begin
     if clk'event and clk = '1' then
        buf(0) <= D;
        buf(3 downto 1) <= buf(2 downto 0);         
    end if;    
end process;

Y <= buf(3);
    
end Behavioral;
```

{{% notice note %}}
De volgorde dat we de buffer instellen maakt niet uit, want alles wordt tegelijk uitgevoerd in hardware.
{{% /notice %}}