---
title: 'Details'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 620
draft: false
---

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice tip %}}
Voordat je (ongetwijfeld met vol enthousiasme) een Vivado project maakt en code begint te schijven, **blijft** het belangrijk om eerst een design te maken!!
{{% /notice %}}

{{% multiHcolumn %}}
{{% column %}}
Hiernaast wordt de volledige set van instructie voor de RISC-V weergeven. Om precies te zijn, dit is de volledige set van instructie voor de basis RISC-V 32i (RV32i) instructies.

In deze lijst zijn er 8 instructies die een effect hebben op de program counter. De eerste 6 gemarkeerde instructies zijn de **conditional branch** instructies: **beq**, **bne**, **blt**, **bge**, **bltu** en **bgeu**.
Bij deze instructies zal er (indien aan de vooropgestelde voorwaarde voldaan is) een **relatieve jump** gebeuren. Het *adres* waarnaar er gesprongen wordt is een *offset* ten opzichte van de huidige waarde van de program counter.
Bij de laatste gemarkeerde instructies kan een **relatieve jump** en een **absolute jump** gedaan worden.

Er kan dus geconcludeerd worden dat, bij een jump, de waarde van de program counter **altijd het resultaat is van een som**:
* van de PC zelf en een offset
* van een register en een offset

Indien er geen jump is, is de waarde van de program counter de som:
* van de PC zelf en de constante 0x4
{{% /column %}}
{{% column %}}
{{% figure src="/images/600/instructions_PC.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}

Met dit inzicht, een blaadje papier met een potlood (en een gom), enkele tassen koffie of thee (of water), kan een design gemaakt worden. Bijvoorbeeld:

{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/600/PC_design_2.png" title="" %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/600/PC_design.png" title="" %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/600/PC_design_3.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}



{{% multiHcolumn %}}
{{% column %}}
Ongeacht de keuze van het design, ziet de entity voor de program counter er (quasi) hetzelfde uit.

* clock en synchrone, actief hoge reset
* twee 32-bit data ingangen
* één 32-bit data uitgang
* 2 controle signalen:
  * **abs_rel_b** is '1' bij een absolute sprong en '0' bij een relatieve
  * **immediate_four_b** is '1' voor een relatieve sprong met offset en '0' bij een (standaard) sprong met 4
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/500/program_counter.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

{{% notice note %}}
Merk ook op dat de **immediate** ingang geen rol speel bij een **absolute jump**
{{% /notice %}}

Een testbench voor de program counter kan je hieronder vinden of <a href="/hdlsrc/500/program_counter_tb.vhd" download>hier</a>  downloaden. Op het einde van de simulatie wordt er een resultaat afgedrukt, zoals in het voorbeeld hieronder.

{{% figure src="/images/600/pc_tb.png" title="" %}}


{{< include_file "/static/hdlsrc/500/program_counter_tb.vhd" "vhdl" >}}