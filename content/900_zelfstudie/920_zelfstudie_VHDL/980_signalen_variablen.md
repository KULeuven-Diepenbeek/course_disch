---
title: 'Signalen vs. variabelen'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 980
draft: false
---

<div class="multicolumn">

<div class="column">

{{% md %}}

**Signalen**:

* nemen de nieuwe waarde aan na een vertraging,
* hebben een hardware equivalent,
* worden toegekend met " <=" .

{{% /md %}}

</div>

<div class="column">

{{% md %}}



**Variabelen**:

* nemen de nieuwe waarde onmiddellijk aan,
* hebben géén hardware equivalent,
* worden toegekend met " :=" ,
* komen enkel voor in een proces.

{{% /md %}}

</div>

</div>


### Signalen

Volgende beschrijvingen leiden tot **dezelfde implementatie**:

<div class="multicolumn">

<div class="column">

{{% md %}}

```vhdl
architecture arch of vb1 is
    signal o1, o2, o3: std_logic;
begin
    p: process(a, b, c, d, o1, o2, o3)
    begin
        q <= not o3;
        o1 <= a and b;
        o2 <= c and d;
        o3 <= o1 or o2;
    end process;
end arch;
```


{{% /md %}}

</div>

<div class="column">

{{% md %}}

```vhdl
architecture arch of vb2 is
    signal o1, o2, o3: std_logic;
begin
    q <= not o3;
    o1 <= a and b;
    o2 <= c and d;
    o3 <= o1 or o2;
end arch;
```

{{% /md %}}

</div>

<div class="column">

{{% md %}}

```vhdl
architecture arch of vb3 is
begin
    q <= not ((a and b) or (c and d));
end arch;
```

{{% /md %}}

</div>

</div>

Als we de tussenliggende signalen o1, o2 en o3 vergeten in de sensitivity list, is het gedrag niet meer zuiver combinatorisch. Volgend proces leidt dus **niet** tot dezelfde implementatie als de vorige voorbeelden:

```vhdl
architecture arch of vb4 is
    signal o1, o2, o3: std_logic;
begin
    p: process(a, b, c, d)
    begin
        q <= not o3;
        o1 <= a and b;
        o2 <= c and d;
        o3 <= o1 or o2;
    end process;
end arch;
```

<br/>

### Resolutie-functie

<div class="multicolumn">
    <div class="column">
In het volgende voorbeeld worden er twee toekenningen gedaan aan hetzelfde signaal:

{{% highlight vhdl %}}
signal a, b, z: std_logic;
...
z <= a;
z <= b;

{{% /highlight %}}

</div>
<div class="column">

{{% figure src="/images/zelfstudie/resolutie_functie.png" %}}

</div>
</div>

<div class="multicolumn">
    <div class="column" style="width:50%">
De resolutie functie die voorzien is in het type std_logic maakt een keuze tussen a en b op basis van de waarde van a en b.

{{% notice note %}}
De resolutie-functie sluit niet uit dat de synthesetool (die de code omzet in hardware) een foutmelding kan geven.
{{% /notice %}}

</div>
<div class="column" style="width:50%">

{{% figure src="/images/zelfstudie/resolutie_functie_tabel.png" %}}

</div>
</div>

### Variabelen

Als we variabelen gebruiken in plaats van signalen, krijgen we opnieuw dezelfde implementatie:

```vhdl
architecture arch of vb5 is
begin
    p: process(a, b, c, d)
        variable o1, o2, o3;
    begin
        q <= not o3;
        o1 := a and b;
        o2 := c and d;
        o3 := o1 or o2;
    end process;
end arch;
```
{{% notice warning %}}
Voor code die **hardware beschrijft** (a.k.a. synthetiseerbare code) gebruiken we **std_logic**. <br/>
In een testbench kunnen we wel variabelen gebruiken.
{{% /notice %}}

