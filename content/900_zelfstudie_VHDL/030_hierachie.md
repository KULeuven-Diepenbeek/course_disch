---
title: 'hiërarchie'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 30
draft: false
---

het is mogelijk om een hiërarchie in te bouwen. Een bouwblok kan een instantie van een andere bouwblok bevatten.


<div class="multicolumn">
    <div class="column">

{{< highlight vhdl >}}
entity and_or_xor_poort is
port(   a, b, c, d: in bit;
        e: out bit);
end and_or_xor_poort;

architecture arch of and_or_xor_poort is
    component and_or_poort is --declaratie  van and_or poort
    port(   a, b, d: in bit;
            e: out bit);
    end component;
    signal f: bit;
begin
    inst_and_or_poort: and_or_poort --instantie van and_or poort
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

Alternatief kan ook geïnstantieerd worden als volgt.
```vhdl
inst_and_or_poort: and_or_poort 
port map(b, a, c, f);
```

{{% notice note %}}

Als oefening kan je zelf eens de volgende componenten maken<br/>
• and-poort<br/>
• or-poort<br/>
• invertor<br/>
• een multiplexer die gebruikt maakt van bovenstaande componenten<br/>
Dit kan je dan zelf eens simuleren in Vivado

{{% /notice %}}

