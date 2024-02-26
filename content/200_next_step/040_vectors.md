---
title: 'Vectors'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 240
draft: false
---

Soms moet of wil je met **arrays** of **groepen van bits** werken. Natuurlijk gaat dit ook in **VHDL** en in VHDL worden dit **vectors** genoemd. Als we een array van 8 bits willen dan beschrijven we dat in één van de twee onderstaande opties.

{{% multiHcolumn %}}
{{% column %}}
{{< highlight vhdl >}}
signal result: std_logic_vector(7 downto 0);
{{< /highlight >}}
{{% /column %}}
{{% column %}}
{{< highlight vhdl >}}
signal outcome: std_logic_vector(0 to 7);
{{< /highlight >}}
{{% /column %}}
{{% /multiHcolumn %}}

{{% figure src="/images/drawio_new_vectors.png" title="Een vector van 8 bits, Little Endian, met LSB en MSB aanduiding"  %}}

Stel dat we het getal 213 willen voorstellen. Hexadecimaal wordt dit 0xD5 en in binaire notatie is dit 0b11010101. Zoals in de meeste moderne Europese talen, lezen we van links naar rechts. Het cijfer **3** in 213 geeft het aantal eenheden mee. Dit cijfer heeft het minste *gewicht* en wordt het minst beduidend genoemd. De meest rechtse bit noemen we deze bit de minst-beduidende bit, of least significant bit (**LSB**), en deze staat rechts. Deze afspraak wordt **Little endian** genoemd. Indien we de LSB links zetten, spreken we van **Big endiann**.

#### Is het sop de kool waard?
Waarom zouden we daar nu moeilijk over doen? Denk eens na over de volgende twee regels C-code.
```C
    unsigned char value_x[3] = {2, 1, 3};
    unsigned char value_y = 213;
```
Hieronder is een mooie illustratie van het verschil. **Laat u niet ver(r)assen door het Endian-monster!**
![Mooie illustratie](https://media.licdn.com/dms/image/D4E22AQGZAvDcKoCWBw/feedshare-shrink_800/0/1704128198851?e=2147483647&v=beta&t=lbP1Y2y3Q41cM0YtPwNrSgNEH5u0h6dNzAknCCq_3BU)
{{< image_courtesy 
  name="ByteByteGo"
  url="https://www.linkedin.com/posts/alexxubyte_systemdesign-coding-interviewtips-activity-7147631723344797696-1PXp/"
  source="LinkedIn"
  >}}


#### Wat is nu het verschil tussen *result* en *outcome* van de hierboven gedeclareerde signalen?

De binaire vector 11010101 blijft altijd hetzelfde, bv de voorlaatste bit is een '0'. Het verschil zit hem in het indexeren. Deze bit is result(1) ofwel outcome(6). De waarde in de vector verandert niet!!

### Voorbeeld

Als voorbeeld van het gebruik van vectoren wordt hieronder de code gegeven voor een 4-bit AND poort

{{% multiHcolumn %}}
{{% column %}}
```vhdl
--------------------------------
-- KU Leuven - ESAT/COSIC - ES&S
--------------------------------
-- Module Name:     4-bit and_gate - Behavioural
-- Project Name:    Digitale elektronische schakelingen 
-- Description:     Een voorbeeld van een 4-bit and-gate.
--                  X geeft een bits-gewijze AND van A en B
--                  Z geeft een 4-bit and van A
-- Revision     Date       Author     Comments
-- v0.1         20240118   VlJo       Initial version
--
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourbit_and_gate is
    port(
        A: IN STD_LOGIC_VECTOR(3 downto 0);
        B: IN STD_LOGIC_VECTOR(3 downto 0);
        X: OUT STD_LOGIC_VECTOR(3 downto 0);
        Z: OUT STD_LOGIC
    );
end entity fourbit_and_gate;

architecture Behavioural of fourbit_and_gate is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal A_i : STD_LOGIC_VECTOR(3 downto 0);
    signal B_i : STD_LOGIC_VECTOR(3 downto 0);
    signal X_i : STD_LOGIC_VECTOR(3 downto 0);
    signal Z_i : STD_LOGIC;

begin

    --------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    --------------------------------
    A_i <= A;
    B_i <= B;
    X <= X_i;
    Z <= Z_i;

    --------------------------------
    -- COMBINATORIAL
    --------------------------------
    Z <= A_i(0) AND A_i(1) AND A_i(2) AND A_i(3);

    X_i(0) <= A_i(0) AND B_i(0);
    X_i(1) <= A_i(1) AND B_i(1);
    X_i(2) <= A_i(2) AND B_i(2);
    X_i(3) <= A_i(3) AND B_i(3);

    -- wat ook mag is:
    --X_i <= A_i AND B_i;


end Behavioural;
```
{{% /column %}}
{{% column %}}

### Nog enkele bijkomende opmerkingen:

* een 4-bit vector moét niet altijd index 0 bevatten: signal voorbeeld : STD_LOGIC_VECTOR(4 downto 1) is ook geldig
* indexen worden geselecteerd met gewone haakjes '(' en ')'
* namen (van poorten, signalen, variabelen, entities, ...) moeten aan bepaalde voorwaarden voldoen:
  * beginnen met een letter
  * mogen voor de rest letters of cijfers bevatten
  * mogen géén spaties of '-'-tekens bevatten
  * een underscore ('_') is toegestaan, maar niet als laatste karakter
  * twee opeenvolgende underscores is niet toegestaan
  * zijn hoofdletter-ongevoelig
  * mogen geen keyword (signal, begin, procedure, ...) zijn 
* er bestaan verschillende manieren om toekenningen te doen: bv "0001" aan Q_i
  * Q_i <= "0001"; -- handig voor hardcoding
  * Q_i <= (0 => '1', others => '0'); -- handig voor langere vectoren
  * Q_i(0) <= '1'; Q_i(1) <= '0'; Q_i(2) <= '0'; Q_i(3) <= '0'; -- handig bij ingewikkeldere designs
{{% /column %}}
{{% /multiHcolumn %}}