---
title: 'Packages'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 60
draft: false
---

## Zelf-gedefinieerde packages

Per default worden zelfgemaakte bouwblokken opgeslagen in de library work. In deze library kunnen we zelf packages definiëren.

#### Voorbeeld van een zelf-gedefinieerde package:

{{% highlight vhdl %}}
package and_or_xor_pack is
    component and_or_poort is
        port(   a, b, d: in bit;
                e: out bit);
    end component;
end package;
{{% /highlight %}}

Als we deze package toevoegen, hoeven we de component declaratie niet meer te doen.

{{% highlight vhdl %}}
library work;
use work.and_or_xor_pack.all;

entity and_or_xor_poort ...
architecture ... -- zonder component declaratie
{{% /highlight %}}

## "std_logic_1164"  package

De package " std_logic_1164"  in library " ieee"  bevat o.a. de types " std_ulogic"  en " std_logic" .

{{% highlight vhdl %}}
package std_logic_1164 is
type std_ulogic is (
    'U',  -- Uninitialized : flipflop waar nog nooit in is geschreven
    'X',  -- Forcing Unknown
    '0',  -- Forcing 0 : rechtstreeks aan grond
    '1',  -- Forcing 1 : rechtstreeks aan voeding
    'Z',  -- High Impedance
    'W',  -- Weak Unknown
    'L',  -- Weak 0 : via weerstand aan grond
    'H',  -- Weak 1 : via weerstand aan voeding
    '-',  -- Don't Care
);

subtype std_logic is resolved std_ulogic;

type std_ulogic_vector
    is array (NATURAL range <>) of std_ulogic;
type std_logic_vector
    is array (NATURAL range <>) of std_logic;
...
{{% /highlight %}}

{{% notice warning %}}
We gebruiken <b> altijd "std_logic" </b> in de plaats van "bit".
{{% /notice %}}


## "std_logic_unsigned"  en "std_logic_signed" 

In de package <strong> std_logic_unsigned </strong> in de library ieee worden std_logic_vectors beschouwd als positieve binaire getallen <strong> zonder tekenbit </strong>.

In de package <strong> std_logic_signed </strong> in de library ieee worden std_logic_vectors beschouwd als getallen in <strong> 2's complement </strong> notatie.

De volgende functies staan o.a. beschreven in de packages: +, -, *, <, <=, >, >=, =, /=, shl, shr, conv_integer

#### opteller
We zouden een opteller kunnen bouwen a.d.h.v. half/full adders. Het voordeel van VHDL is dat we het hardware-ontwerp ook op een hoger niveau kunnen beschrijven. In het geval van de opteller kunnen we gewoon '+' gebruiken. Daarvoor moeten we eerst verwijzen naar de juiste 'package' in de juiste 'library' en moeten we groepjes van bits zien als 'arrays'.

 We kunnen dus op de volgende manier een 4-bit opteller maken in VHDL:

{{% highlight vhdl %}}
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity opteller is
    port(   a, b: in std_logic_vector(3 downto 0);
            c: out std_logic_vector(3 downto 0));
end opteller;

architecture arch of opteller is
begin
    c <= a + b;
end arch;
{{% /highlight %}}

{{% notice warning %}}
De lengtes van a, b en c moeten hetzelfde zijn, dus de carry-out wordt niet berekend!
{{% /notice %}}

Als we de carry-out ook willen berekenen, kunnen we de lengte van c met 1 bit vergroten, maar dan moeten we intern de lengte van a en b ook vergroten:

{{% highlight vhdl %}}
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity opteller is
    port(    a, b: in std_logic_vector(3 downto 0);
            c: out std_logic_vector(4 downto 0));
end opteller;

architecture arch of opteller is
    signal a_long, b_long: std_logic_vector(4 downto 0);
begin
    a_long <= '0' & a;
    b_long <= '0' & b;
    c <= a_long + b_long;
end arch;
{{% /highlight %}}

#### aftrekker

<div class="multicolumn">
    <div class="column" style="width:55%">

Met behulp van de package std_logic_unsigned kunnen we ook aftrekkingen uitvoeren.
De ingangen worden dan beschouwd als positieve binaire getallen zonder tekenbit.
Als het resultaat kleiner wordt dan nul, wordt er terug vanaf het maximum naar beneden geteld, alsof alle getallen zich op een cirkel bevinden. Dat komt overeen met 2's complement notatie. 
Voor optelling en aftrekking maakt het niet uit of we std_logic_unsigned of std_logic_signed gebruiken.
Voor >, >=, <, <= maakt het wel uit.

{{% highlight vhdl %}}
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity opteller is
    port(   a, b: in std_logic_vector(3 downto 0);
            c: out std_logic_vector(3 downto 0));
end opteller;

architecture arch of opteller is
begin
    c <= a - b;
end arch;
{{% /highlight %}}

</div>
<div class="column" style="width:40%">

{{% figure src="/images/zelfstudie/aftrekker_cirkel.png" %}}

</div>
</div>

#### Opteller/aftrekker



We gebruiken de bit "op_af"  om te bepalen of we gaan optellen of aftrekken. <br/>
Als de bit gelijk is aan 0, tellen we op. <br/>

Als de bit gelijk is aan 1, trekken we af. <br/>

Voor een if-else hebben we een process nodig. Daar komen we in de <a href="../../020_next_step/060_processen/" >les </a> nog op terug.


{{% highlight vhdl %}}
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity opteller_aftrekker is
    port(   a, b: in std_logic_vector(3 downto 0);
            c: out std_logic_vector(3 downto 0);
            op_af: in std_logic);
end opteller_aftrekker;

architecture arch of opteller_aftrekker is
begin
    p: process(a, b, op_af)
    begin
        if op_af = '0' then
            c <= a + b;
        else
            c <= a - b;
        end if;
    end process;
end arch;

{{% /highlight %}}

