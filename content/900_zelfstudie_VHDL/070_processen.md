---
title: 'Processen'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 70
draft: false
---

## Structuur van een proces

 Een proces wordt uitgevoerd wanneer een signaal in de sensitivity lijst van  waarde verandert. <br/>
Signalen worden geupdated aan het einde van het proces. <br/> 
Voorbeeld van een proces met een if-then-else statement: multiplexer.

<div class="multicolumn">
    <div class="column" style="width:60%">

{{% highlight vhdl %}}
library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port(   a, b, s: in std_logic;
            z: out std_logic);
end mux;

architecture arch of mux is
begin
    p1: process(a, b, s) -- a, b, s is de sensitiviy lijst
    begin
        if s = '1' then
            z <= a;
        else
            z <= b;
        end if;
    end process;
end arch;

{{% /highlight %}}

</div>
<div class="column" style="width:40%">

{{% figure src=/images/zelfstudie/mux.png %}}

</div>
</div>


## Toekenningen in processen

Volgende processen leiden tot dezelfde implementatie:

<div class="multicolumn">
    <div class="column" style="width:50%">

{{% highlight vhdl %}}
p1: process(a, b)
begin
    y <= a;
    y <= b;
end process;
{{% /highlight %}}

</div>
<div class="column" style="width:50%">

{{% highlight vhdl %}}
p1: process(b)
begin
    y <= b;
end process;
{{% /highlight %}}

</div>
</div>

Wanneer een van de signalen in de sensitivity list van het proces verandert, wordt het proces van begin tot einde doorlopen. Wanneer het proces helemaal doorlopen is, wacht het op een nieuwe verandering van de signalen in de sensitity list. Pas wanneer het proces in deze wachtfase terechtkomt, gebeurt de eigenlijke toekenning van de signalen. Daarom overschrijft de tweede uitdrukking de eerste in process p1.


Volgende processen leiden **niet** tot dezelfde implementatie:

<div class="multicolumn">
    <div class="column" style="width:50%">

{{% highlight vhdl %}}
p1: process(b)
begin
    a <= b;
    c <= a;
end process;

{{% /highlight %}}

</div>
<div class="column" style="width:50%">

{{% highlight vhdl %}}
p2: process(a, b)
begin
    a <= b;
    c <= a;
end process;
{{% /highlight %}}

</div>
</div>

Wat gebeurt er wanneer b van waarde verandert?

* In p1: Het proces wordt doorlopen. Daarna gebeuren alle toekenningen. In dit geval wordt b toegekend aan a en op hetzelfde moment wordt de oude waarde van a toegekend aan c. Er wordt dus een geheugenwerking gecreëerd.

* In p2: Het proces wordt doorlopen. Daarna gebeuren alle toekenningen. In dit geval wordt b toegekend aan a en op hetzelfde moment wordt de oude waarde van a toegekend aan c. Omdat a in de sensitivity list staat, wordt het proces opnieuw doorlopen en wordt daarna b opnieuw toegekend aan a en wordt de nieuwe waarde van a toegekend aan c. Deze werking is zuiver combinatorisch.

#### Modelleren van combinatorische processen
Volgende processen leiden to dezelfde implementatie:

<div class="multicolumn">
    <div class="column" style="width:50%">

{{% highlight vhdl %}}
p1: process(a, b)
begin
    c <= "00";
    if a = '1' then
        c <= "01";
    elsif b = '1' then
        c <= "11";
    end if;
end process;
{{% /highlight %}}

</div>
<div class="column" style="width:50%">

{{% highlight vhdl %}}
p2: process(a, b)
begin
    if a = '1' then
        c <= "01";
    elsif b = '1' then
        c <= "11";
    else
        c <= "00";    
    end if;
end process;
{{% /highlight %}}

</div>
</div>

### Meerdere processen binnen een ontwerp

<div class="multicolumn">
    <div class="column" style="width:50%">

{{% highlight vhdl %}}
architecture arch_example of example is
begin
    p1: process(-- sensitivity list)
    begin
        -- sequentiële statements
    end process;
    p2: process(-- sensitivity list)
    begin
        -- sequentiële statements
    end process;
    p3: process(-- sensitivity list)
    begin
        -- sequentiële statements
    end process;
end arch_example;
{{% /highlight %}}

Een ingang van een proces kan een uitgang van een ander proces zijn.


</div>
<div class="column" style="width:35%">

{{% figure src=/images/zelfstudie/meerdere_processen.png %}}

</div>
</div>

#### Voorbeeld if statement
{{% highlight vhdl %}}
library ieee;
use ieee.std_logic_1164.all;
entity if_example is
    port(   a, b, c, x: in std_logic_vector(3 downto 0);
            z: out std_logic_vector(3 downto 0));
end if_example;

architecture arch_if_example of if_example is
begin
    p_if: process(a, b, c, x)
    begin
        if x = " 0000"  then
            z <= a;
        elsif x = " 0101"  then
            z <= b;
        else
            z <= c;
        end if;
    end process;
end arch_if_example;
{{% /highlight %}}


### Case statement
#### Structuur case statement
{{% highlight vhdl %}}
case expression is
    when value_1 =>
    -- toekenning
    when value_2 | value_3 =>
    -- toekenning
    when value_M to value_N =>
    -- toekenning
    when others =>
    -- toekenning
end case;
{{% /highlight %}}

#### Voorbeeld case statement
{{% highlight vhdl %}}
library ieee;
use ieee.std_logic_1164.all;

entity case_example is
    port(   a, b, c, x: in integer range 0 to 15;
            z: out integer range 0 to 15);
end case_example;

architecture arch_case_example of case_example is
begin
    p_case: process(a, b, c, x)
    begin
        case x is
            when 0 to 4 =>
                z <= b;
            when 5 =>
                z <= c;
            when 7|9 =>
                z <= a;
            when others =>
                z <= 0;
        end case;
    end process;
end arch_case_example;

{{% /highlight %}}

#### Concurrente selectieve signaaltoekenning

with-select statement: concurrente versie van de case statement. <br/>
Verschil: slechts één bestemming mogelijk. <br/>
Zelfde regels als bij de case statement


{{% highlight vhdl %}}
entity example is
    port(   a, b, c, x: in integer range 0 to 7;
            z: out integer range 0 to 7);
end example;
{{% /highlight %}}

<div class="multicolumn">
    <div class="column" style="width:50%">

{{% highlight vhdl %}}
architecture arch_example of example is
begin
    p: process(a, b, c, x)
    begin
        case x is -- case in process
            when 0 to 4 =>
                z <= b;
            when 5 =>
                z <= c;
            when others =>
                z <= a;
        end case;
    end process;
end arch_example;
{{% /highlight %}}


</div>
<div class="column" style="width:50%">

{{% highlight vhdl %}}
architecture arch_example of example is
begin
    with x select -- with-select buiten process
        z <=    b when 0 to 4,
                c when 5,
                a when others;
end arch_example;
{{% /highlight %}}

</div>
</div>

#### Concurrente statements

Concurrente statements komen voor buiten een proces.

Voorbeelden van concurrente statements:

* concurrente signaaltoekenning (bv. a <= b),
* conditionele signaaltoekenning (when-else),
* geselectioneerde signaaltoekenning (with-select),
* proces,
* generate statement,
* component instantiatie.

#### Sequentiële statements

Sequentiële statements komen steeds voor binnen een
proces.

Voorbeelden van sequentiële statements:

* case,
* if,
* for loop,
* toekenning van een variabele,
* wait statement.

#### Verschil tussen sensitivity list en wait

* Een proces met een sensitivity list mag geen wait opdracht hebben.
* Een proces met een wait opdracht mag geen sensitivity list hebben.
* Een wait statement is niet synthetiseerbaar en kan dus niet behoren tot
* VHDL-code die op een FPGA geïmplementeerd wordt.
* Een wait statement mag bijvoorbeeld wel in een testbench gebruikt worden.

<div class="multicolumn">
    <div class="column" style="width:50%">

{{% highlight vhdl %}}
p_optelling: process(a, b, cin) -- sensitivity list
begin
    som <= a xor b xor cin;
end process;
{{% /highlight %}}


</div>
<div class="column" style="width:50%">

{{% highlight vhdl %}}
p_optelling: process
begin
    som <= a xor b xor cin;
    wait on a, b, cin; -- wait opdracht
end process;
{{% /highlight %}}

</div>
</div>

#### Wait statements

{{% highlight vhdl %}}
p: process
begin
    wait on a;
    b <= '1';
    wait for 10 ns;
    b <= '0';
    wait until (a = '1');
    b <= '1';
end process;
{{% /highlight %}}

