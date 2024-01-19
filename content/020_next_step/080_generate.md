---
title: 'Generate'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 80
draft: false
---

Een generate is handig als je vaak VHDL-code moet herhalen. Meestal kan je dan een generate statement gebruiken om te voorkomen dat je te veel moet kopiëren en plakken.

De generate gaat in dit voorbeeld van 0 tot 6 omdat 6+1 al 7 is, wat het laatste element van de array is.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity generate_example is
  Port (A_vector: in std_logic_vector(7 downto 0);
        Y_vector: out std_logic_vector(7 downto 0));
end generate_example;

architecture Behavioral of generate_example is

begin

  GEN : for i in 0 to 6 generate
    Y_vector(i) <= A_vector(i) AND A_vector(i+1);
  end generate;
    
end Behavioral;
```

{{% figure src="/images/screenshot_generate.png" title="Schematische voorstelling"  %}}

{{% notice note %}}
Vivado kan een schematische voorstelling maken van de hardware beschrijving met RTL analysis elaborate design.
{{% /notice %}}