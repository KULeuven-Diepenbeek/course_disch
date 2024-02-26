---
title: 'PISO'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 30
draft: false
---

Een parallel in, serial out shift register wordt  gebruikt als ge parallel data hebt en het serieel wil doorsturen. Hier hebben we wel een load signal nodig om de data in te laden en multiplexer om te zorgen dat de data ook in de flip-flops kan geraken.

{{% figure src="/images/Shift_register_piso.png" title="PISO shift register"  %}}

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PISO_shift_register is
  Port (clk, load: in std_logic;
        D_Vector: in std_logic_vector(3 downto 0);
        Y: out std_logic);
end PISO_shift_register;

architecture Behavioral of PISO_shift_register is
    signal buf: std_logic_vector(3 downto 0);

begin

SEQ: process(clk) begin
     if clk'event and clk = '1' then
        if load = '1' then
            buf <= D_vector;
        else
            buf(3 downto 1) <= buf(2 downto 0);
            buf(0) <= '-'; --in de meeste toepassingen maakt het niet uit welke bit er uit komt als de buffer leeg is
        end if;
    end if;    
end process;

Y <= buf(3);    

end Behavioral;
```

{{% notice note %}}
VHDL heeft onderstaande waardes voor std_logic</br>
'U' Uninitialized</br>
'X' Forcing Unknown</br>
'0' Forcing 0</br>
'1' Forcing 1</br>
'Z' High Impedance</br>
'W' Weak Unknown</br>
'L' Weak 0</br>
'H' Weak 1</br>
'-' Don't Care</br>
{{% /notice %}}