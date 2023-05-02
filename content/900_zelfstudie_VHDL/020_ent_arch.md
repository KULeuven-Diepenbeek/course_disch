---
title: 'Entiteiten en architecturen'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 20
draft: false
---
De VHDL code van elk bouwblok bevat een
<ul> 
<li> interface beschrijving: entity,
<li> functie beschrijving: architecture.
</ul>

## Voorbeeld

```vhdl
entity and_or_poort is
port(   a, b, d: in bit;
        e: out bit);
end and_or_poort;

architecture arch of and_or_poort is
    signal c: bit;
begin
    c <= a and b;
    e <= c or d;
end arch;
```

## entity

entity = beschrijving van de interface

```vhdl
entity and_or_poort is
port(   a, b, d: in bit;
        e: out bit);
end and_or_poort;
```

{{% figure src="/images/zelfstudie/entity.png" title="entity" %}}

### entity ports

Elke poort heeft:
<ul>
<li> een naam
<ul><li>in dit voorbeeld: a,b,d,e</li></ul>
<li> een mode
<ul><li>in dit voorbeeld: in, out</li></ul>
<li> een type
<ul><li>in dit voorbeeld: bit</li></ul>
</ul>

#### namen in VHDL

Namen voldoen aan de volgende eisen:

* bestaan uit letters, cijfers en _
* beginnen met een letter
* niet eindigen met een _
* geen twee _ na elkaar
* geen gereserveerde woorden zoals bv. "entity" 

Namen zijn niet case sensitive.

#### modes van ports

Belangrijkste modes:

* in: ingang
* out: uitgang
* inout: in- en uitgang
* buffer: uitgang die intern ook gebruikt wordt
    * voorbeeld: and_or_poort waarbij we c ook als uitgang willen

<div class="multicolumn">
    <div class="column">

{{< highlight vhdl >}}
entity and_or_poort is
port(   a, b, d: in bit;
        c: buffer bit;
        e: out bit);
end and_or_poort;

architecture arch of and_or_poort is
begin
    c <= a and b;
    e <= c or d;
end arch;

{{< /highlight >}}
</div> <div class="column">

{{% figure src="/images/zelfstudie/and_or_c_uitgang.png"%}}

</div>
</div>

#### gebruik van buffer 
Het gebruik van de mode buffer kan vermeden worden door
een intern signaal aan te maken en dit te verbinden met de
uitgang.

Volgende twee codes zijn identiek:

<div class="multicolumn">
    <div class="column">

{{< highlight vhdl >}}
entity and_or_poort is
port(   a, b, d: in bit;
        c: buffer bit;
        e: out bit);
end and_or_poort;

architecture arch of and_or_poort is
begin
    c <= a and b;
    e <= c or d;
end arch;

{{< /highlight >}}
</div> <div class="column">
{{< highlight vhdl >}}
entity and_or_poort is
port(   a, b, d: in bit;
        c, e: out bit);
end and_or_poort;

architecture arch of and_or_poort is
    signal c_intern: bit;
begin
    c_intern <= a and b;
    e <= c_intern or d;
    c <= c_intern;
end arch;

{{< /highlight >}}        
    </div>
</div>

## architecture

* De architecture beschrijft het gedrag.
* Een architecture moet verbonden zijn met een specifieke entity.
* Een entity kan meerdere architectures hebbben.

{{< highlight vhdl >}}
architecture arch of and_or_poort is
    signal c: bit;
begin
    c <= a and b;
    e <= c or d;
end arch;

{{< /highlight >}}

{{% figure src="/images/zelfstudie/and_or_schamatic.png"%}}

### signals

* Om interne data voor te stellen, worden signals gebruikt.
* Een signal is van een bepaald type maar heeft geen mode.
* Namen van signalen:
    * zelfde voorwaarden als namen van entity ports.
* Voorbeeld:
    * signal c: bit

{{< highlight vhdl >}}
architecture arch of and_or_poort is
    signal c: bit;
begin
    c <= a and b;
    e <= c or d;
end arch;
{{< /highlight >}}


## commentaar in VHDL

Je kan iets in commentaar zetten door er 2 keer een - voor te zetten.

{{< highlight vhdl >}}
-- dit is een regel commentaar
z <= a -- dit kan ook op het einde van de regel
{{< /highlight >}}