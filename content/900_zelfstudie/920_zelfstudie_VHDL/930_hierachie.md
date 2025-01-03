---
title: 'Hiërarchie'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 930
draft: false
---

het is mogelijk om een hiërarchie in te bouwen. Een bouwblok kan een instantie van een andere bouwblok bevatten.


<div class="multicolumn">
    <div class="column">

{{< highlight vhdl >}}
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_or_xor_poort is
port(   a, b, c, d: in STD_LOGIC;
        e: out STD_LOGIC);
end and_or_xor_poort;

architecture arch of and_or_xor_poort is
    -- declaratie van and_or poort
    component and_or_poort is
    port(   a, b, d: in STD_LOGIC;
            e: out STD_LOGIC);
    end component;

    signal f: STD_LOGIC;
begin
    -- instantie van and_or poort
    inst_and_or_poort: component and_or_poort
        port map(   a => b,
                    b => a,
                    d => c,
                    e => f);

    e <= d xor f;

end arch;

{{< /highlight >}}

</div>
<div class="column">
    {{% figure src="/images/zelfstudie/and_or_xor.png" %}}
</div>
</div>

Een component moet eerst gedeclareerd zijn alvorens hem te instantiëren. De component declaratie heeft dezelfde ports als de entity
declaratie van het bijhorend bouwblok.

Als alternatief, kan de instantiatie ook beschreven worden als volgt:
```vhdl
inst_and_or_poort: component and_or_poort port map(b, a, c, f);
```
In het voorbeeld hieboven, worden signalen toegekend op **volgorde**, bv: het eerste signaal tussen de ( ) aan de eerste port van de declaratie, enz.

{{% notice note %}}

Als oefening kan je zelf eens de volgende componenten maken<br/>
• and-poort<br/>
• or-poort<br/>
• invertor<br/>
• een multiplexer die gebruikt maakt van bovenstaande componenten<br/>
Dit kan je dan zelf eens simuleren in Vivado

{{% /notice %}}

