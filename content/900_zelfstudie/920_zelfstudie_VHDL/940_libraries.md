---
title: 'Libraries'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 940
draft: false
---

<div class="multicolumn">
    <div class="column">

Een library kan meerdere packages bevatten.

Een package bevat 1 of meer van onderstaande middelen.
<ul>
<li> types </li>
<li> constanten </li>
<li> functies </li>
<li> procedures </li>
<li> component declaraties </li>
</ul>

Een VHDL module kan gebruik maken van 1 of meerdere packages <br/>
Voorbeeld:
{{% highlight vhdl %}}
library library1;
use library1.pack2.all;
library library2;
use library2.pack4.all;

entity ...
architecture...
{{% /highlight %}}

</div>
<div class="column">

{{% figure src=/images/zelfstudie/packages.png %}}

</div>
</div>

## "std" library

Een verwijzing naar de package "standard" in de library "std" is steeds impliciet aanwezig. <br/>
Volgende twee codes zijn identiek.

<div class="multicolumn">
    <div class="column" style="width: 40%">
{{% highlight vhdl %}}
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
{{% /highlight %}}
</div>
<div class="column" style="width: 60%">    
{{% highlight vhdl %}}
library std;
use std.standard.all; -- geeft aan wat we precies willen gebruiken van deze package
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
{{% /highlight %}}
</div>
</div>

Een stuk code van de standard package.

{{% highlight vhdl %}}
package STANDARD is
    --opsomming types
    type BOOLEAN is (FALSE, TRUE);
    type BIT is ('0', '1');

    type CHARACTER is ( -- opsomming ASCII characters);
    type INTEGER is range -- implementation defined;

    --arrays: samengestelde types waarvan de range moet ingesteld worden
    type STRING is array (POSITIVE range <>) of CHARACTER;
    type BIT_VECTOR is array (NATURAL range <>) of BIT;
    ...

end STANDARD;
{{% /highlight %}}