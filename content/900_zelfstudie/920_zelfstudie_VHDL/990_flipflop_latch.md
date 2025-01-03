---
title: 'Flipflop en latches'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 990
draft: false
---

## D-flipflop

De D-flip-flop is het basiselement van synchrone logica. De data bit wordt opgenomen in het geheugenelement op de stijgende of dalende flank van de klok. De data bit blijft in het geheugenelement aanwezig tot de volgende stijgende of dalende flank van de klok. 

Engelse benamingen: 

* positive/negative edge triggered D-type flip-flop 
* rising/falling edge triggered D-type flip-flop

#### Positieve flank getriggerde D-FF in VHDL

Proces met enkel de klok in de sensitivity list. Klok event komt overeen met de flank. Enkel if, geen else.

<div class="multicolumn">

<div class="column" style="width:60%">

{{% md %}}

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity pos_dff is
port(   d, clk: in std_logic;
        q: out std_logic);
end pos_dff;

architecture arch_pos_dff of pos_dff is
begin
    p_pos_dff: process(clk)
    begin
        if clk'event and clk = '1' then
            q <= d;
        end if;
    end process;
end arch_pos_dff;
```

{{% /md %}}

</div>

<div class="column" style="width:40%">

{{% figure src=/images/900/920_vhdl/D_flipflop_pos.png %}}


</div>
</div>

#### Negatieve flank getriggerde D-FF in VHDL


<div class="multicolumn">

<div class="column" style="width:60%">

{{% md %}}

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity pos_dff is
port(   d, clk: in std_logic;
        q: out std_logic);
end pos_dff;

architecture arch_pos_dff of pos_dff is
begin
    p_pos_dff: process(clk)
    begin
        if clk'event and clk = '0' then
            q <= d;
        end if;
    end process;
end arch_pos_dff;
```
{{% /md %}}

</div>

<div class="column" style="width:40%">

{{% figure src=/images/900/920_vhdl/D_flipflop_neg.png %}}


</div>
</div>


### Extra functies voor klokflanken

In std_logic_1164 zijn de volgende functies gedefinieerd:

* rising_edge
* falling_edge

**Beide kolommen** doen lijken funtioneel **hetzelfde** te doen, maar er is een subtiel verschil. Wanneer er gebruikt gemaakt wordt van het xxxx'event keyword, wilt dat zeggen **er is een verandering in de waarde van xxxx**. Als dit gevolgd wordt door de test *clk = '1'*, wilt dat zeggen dat deze conditie waar is voor elke overgang **naar '1'** (bv: '0' -> '1', maar ook 'X' -> '1' en '-' -> '1')

<div class="multicolumn">

<div class="column">

{{% md %}}

```vhdl
if rising_edge(clk) then
```

```vhdl
if falling_edge(clk) then
```

{{% /md %}}

</div>

<div class="column">

{{% md %}}

```vhdl
if clk'event and clk = '1' then
```

```vhdl
if clk'event and clk = '0' then
```

{{% /md %}}

</div>

</div>

Voor de twee voorbeelden die gebruik maken van functies uit STD_LOGIC_1164, wordt een bepaalde "uitgangspositie" verwacht.

* rising_edge() geeft **true** wanneer een signaal van '0' of 'L' verandert naar '1' of 'H'
* falling_edge() geeft **true** wanneer een signaal van '1' of 'H' verandert naar '0' of 'L' 


## D-latch

Bij een **D-latch** worden de **data binnengenomen** gedurende de **hele periode dat de klok hoog is**. Een ontwerp met **D-flip-flops** is **veel makkelijker te analyseren en managen** dan een ontwerp met D-latches.


#### D-latch in VHDL

{{% md %}}
* proces met klok en data in de sensitivity list
* geen klok event
* enkel if, geen else
{{% /md %}}


```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity dlatch is
    port(   d, clk: in std_logic;
            q: out std_logic);
end dlatch;

architecture arch_dlatch of dlatch is
begin
    p_dlatch: process(clk, d)
    begin
        if clk = '1' then
            q <= d;
        end if;
    end process;
end arch_dlatch;
```

## Ongewenste componenten

#### Ongewenste latches

Als niet alle mogelijkheden voorzien zijn, kan een combinatorisch circuit zich gedragen als een latch. Dit moet steeds vermeden worden.

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fout is
    port(   a, b: in std_logic;
            s: in std_logic_vector(1 downto 0);
            z: out std_logic);
end fout;

architecture arch_fout of fout is
begin
    p_fout: process(a, b, s)
    begin
        if s = "00" then
            z <= a;
        elsif s = "01" then --er is geen beschrijving voor s is 10 of 11
            z <= b;
        end if;
    end process;
end arch_fout;
```



#### Ongewenste registers

Indien we voor een bepaald signaal geen register willen implementeren, moet dat signaal buiten het proces geplaatst worden.

<div class="multicolumn">
<div class="column">


{{% md %}}

```vhdl
seq: process(clk)
begin
    if clk'event and clk = '1' then
        j <= a and b; --register voor j
        i <= j xor k;
    end if;
end process;
```

{{% /md %}}

</div>

<div class="column">

{{% md %}}

```vhdl
seq: process(clk)
begin
    if clk'event and clk = '1' then
        i <= j xor k;
    end if;
end process;

j <= a and b; --geen register voor j
```

{{% /md %}}

</div>

</div>
