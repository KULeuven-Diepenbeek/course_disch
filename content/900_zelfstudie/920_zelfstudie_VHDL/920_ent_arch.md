---
title: 'Entiteiten en architecturen'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 920
draft: false
---
De VHDL code van elk bouwblok bevat een
<ul> 
<li> een lijst van de gebruikte bibliotheken,
<li> interface beschrijving: entity,
<li> functie beschrijving: architecture.
</ul>

## Voorbeeld

{{< include_file "/static/hdlsrc/900/and_or_poort.vhd" "vhdl" >}}

## Entity

De entity bevat de beschrijving van de interface.

```vhdl
entity and_or_poort is
port(   a, b, d: in STD_LOGIC;
        e: out STD_LOGIC);
end and_or_poort;
```

{{% figure src="/images/zelfstudie/entity.png" title="De entity" %}}

### Entity ports

Elke poort heeft:
<ul>
<li> een naam
<ul><li>in dit voorbeeld: a,b,d,e</li></ul>
<li> een mode
<ul><li>in dit voorbeeld: in, out</li></ul>
<li> een type
<ul><li>in dit voorbeeld: STD_LOGIC</li></ul>
</ul>

#### Namen in VHDL

Namen voldoen aan de volgende eisen:

* bestaan uit letters, cijfers en _
* beginnen met een letter
* niet eindigen met een _
* geen twee _ na elkaar
* geen gereserveerde woorden zoals bv. "entity" 

Namen zijn niet case sensitive.

#### Modes van ports

Belangrijkste modes, of *richtingen*:

* in: ingang
* out: uitgang
* inout: in- en uitgang
* buffer: uitgang die intern ook gebruikt wordt
    * voorbeeld: and_or_poort waarbij we c ook als uitgang willen

<div class="multicolumn">
    <div class="column">

{{< highlight vhdl >}}
entity and_or_poort is
port(   a, b, d: in STD_LOGIC;
        c: buffer STD_LOGIC;
        e: out STD_LOGIC);
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

#### Gebruik van buffer 
Het gebruik van de mode buffer kan vermeden worden door een intern signaal aan te maken en dit te verbinden met de uitgang.

Volgende twee codes zijn identiek:

<div class="multicolumn">
    <div class="column">

{{< highlight vhdl >}}
entity and_or_poort is
port(   a, b, d: in STD_LOGIC;
        c: buffer STD_LOGIC;
        e: out STD_LOGIC);
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
port(   a, b, d: in STD_LOGIC;
        c, e: out STD_LOGIC);
end and_or_poort;

architecture arch of and_or_poort is
    signal c_intern: STD_LOGIC;
begin
    c_intern <= a and b;
    e <= c_intern or d;
    c <= c_intern;
end arch;

{{< /highlight >}}        
    </div>
</div>

## Architecture

* De architecture beschrijft het gedrag.
* Een architecture moet verbonden zijn met een specifieke entity.
* Een entity kan meerdere architectures hebbben.

{{< highlight vhdl >}}
architecture arch of and_or_poort is
    signal c: STD_LOGIC;
begin
    c <= a and b;
    e <= c or d;
end arch;

{{< /highlight >}}

{{% figure src="/images/zelfstudie/and_or_schamatic.png"%}}

### Signals

* Om interne data voor te stellen, worden signals gebruikt.
* Een signal is van een bepaald type maar heeft geen mode.
* Namen van signalen:
    * zelfde voorwaarden als namen van entity ports.
* Voorbeeld:
    * signal c: STD_LOGIC

{{< highlight vhdl >}}
architecture arch of and_or_poort is
    signal c: STD_LOGIC;
begin
    c <= a and b;
    e <= c or d;
end arch;
{{< /highlight >}}


## Commentaar in VHDL

Je kan iets in commentaar zetten door er 2 keer een - voor te zetten.

{{< highlight vhdl >}}
-- dit is een regel commentaar
z <= a -- dit kan ook op het einde van de regel
{{< /highlight >}}