---
title: 'Arrays'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 950
draft: false
---

Een range kan stijgend of dalend gekozen worden:

* x(2 to 6)
* y(7 downto 0) 

We kunnen verwijzen naar individuele elementen door een index te gebruiken:

* x(4)
* y(7)


<div class="multicolumn">
    <div class="column">

Voorbeeld:
{{% highlight vhdl %}}
entity and_or_poort is
    port(   a_vec: in bit_vector(2 downto 0);
            c_vec: out bit_vector(0 to 1));
end and_or_poort;
architecture arch of and_or_poort is
    signal c_intern: bit;
begin
    c_intern <= a_vec(2) and a_vec(1);
    c_vec(1) <= c_intern or a_vec(0);
    c_vec(0) <= c_intern:
end arch;
{{% /highlight %}}

</div>
<div class="column">

{{% figure src=/images/zelfstudie/arrays.png %}}

</div>
</div>

## Toekenning van arrays

<div class="multicolumn">
    <div class="column" style="width:60%">
Toekenning gebeurt op basis van positie, niet op basis van index.

Voorbeeld:
{{% highlight vhdl %}}
signal x: bit_vector(2 to 6);
signal y: bit_vector(7 downto 3);
...
x <= y;
{{% /highlight %}}

</div>
<div class="column"style="width:30%">
{{% figure src=/images/zelfstudie/arrays_toekenning.png %}}
</div>
</div>

#### Voorbeelden van de toekenning van de individuele elementen van een samengesteld type:

{{% highlight vhdl %}}
signal y, z: bit_vector(3 downto 0);
signal a, b: bit;
signal byte: bit_vector(7 downto 0);
{{% /highlight %}}

* Op basis van positie:
{{% highlight vhdl %}}
z <= (a, '1', b, '0'); -- z wordt dan a1b0 met a en b een waarde 0 of 1
{{% /highlight %}}

* op basis van index:
{{% highlight vhdl %}}
byte <= (7 => '1', 4 downto 2 => a, 6 => b, others => '0'); -- byte wordt dan 1b0aaa00
{{% /highlight %}}

#### Voorbeeld van de toekenning van een waarde:
{{% highlight vhdl %}}
z <= " 1010" ;
{{% /highlight %}}

#### Voorbeelden van samenvoeginstructies:
{{% highlight vhdl %}}
z <= a & '1' & b & '0';
byte <= y & z;
{{% /highlight %}}

#### Voorbeelden van de gedeeltelijke toekenning van een array:
{{% highlight vhdl %}}
signal a, z: bit_vector(3 downto 0);
signal b: bit;
signal byte: bit_vector(7 downto 0);
...
byte(5 downto 2) <= a;
z(1 downto 0) <= '0' & b;
{{% /highlight %}}

#### De richting van de deeltoekenning moet dezelfde zijn als de richting van de declaratie.
* Correct voorbeeld:
{{% highlight vhdl %}}
signal a: bit_vector(3 downto 0);
signal byte: bit_vector(7 downto 0);
...
byte(5 downto 2) <= a;
{{% /highlight %}}

* Foutief voorbeeld:
{{% highlight vhdl %}}
signal z: bit_vector(3 downto 0);
signal b: bit;
...
z(0 to 1) <= '0' & b; -- dit geeft een error!
{{% /highlight %}}

## Aliases

Aliases zijn verwijzingen naar reeds gedefinieerde signals, die de code beter begrijpbaar maken.
{{% highlight vhdl %}}
signal adres: bit_vector(31 downto 0);
alias top_adres: bit_vector(3 downto 0) is adres(31 downto 28);
alias adres_bank: bit_vector(3 downto 0) is adres(27 downto 24);
alias rij_adres: bit_vector(11 downto 0) is adres(24 downto 12);
{{% /highlight %}}
