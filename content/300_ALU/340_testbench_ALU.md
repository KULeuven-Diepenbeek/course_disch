---
title: 'Opdracht - testbench ALU'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 340
draft: false
---

Om de juiste werking van de ALU te verifiëren, wordt er opnieuw gebruikt gemaakt van een testbench. Het is een goed idee om tijdens het ontwikkelen van de ALU meteen de functionaliteit te testen. Hiervoor kunnen er heel gericht bepaalde instructies ingesteld worden. Om bijvoorbeeld 12 + 3 te doen weet je dat inputs de volgende moeten zijn:
{{% multiHcolumn %}}
{{% column %}}
* X wordt 12
* Y wordt 3
* de instructie voor de optelling is 
    * zx is '0'
    * nx is '0'
    * zy is '0'
    * ny is '0'
    * f is '1'
    * no is '0'
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/300/sim_PSTIM.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

Op deze manier kan je stapsgewijs de testbench opbouwen. Geef hierbij extra aandacht aan de **randgevallen**. Als jouw implementatie 12 + 3 correct kan berekenen, is de kans groot dat 13 + 3 ook wel zal lukken. De randgevallen zijn het echter wel waard om expliciet te testen. Kan jouw ALU 0xFFFF + 0xFFFF correct berekenen? Of -1 - 1?

Wanneer je denkt alle implementaties gedaan te hebben, kan je een grotere testbench los laten op jouw design. Een voorbeeld hiervan kan je <a href="/hdlsrc/300/alu_tb.vhd" download>hier</a> downloaden. Deze testbench is, zoals je misschien al vermoedde, **gegenereerd**. Voor de verbetering van de opdracht wordt een soortgelijke testbench gebruikt.

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/300/sim_PSTIM_2.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
Deze aangeleverde testbench controleert bovendien of de uitgang gelijk is aan de "juiste" uitgang. Hiervoor moet het resultaat kloppen, maar ook de zero en negative flags.

Na 1ns wordt elk van de 3 uitgangen vergeleken. Indien een waarde niet overeenkomt met de verwachte uitgang, wordt hiervan een melding gemaakt in de console.

#### Tellers
De testbench heeft 6 tellers die bijgehouden worden. Deze tellen het aantal juiste en foute operaties voor de uitgang en de 2 flags.

Op het einde van de testbench worden deze tellers in de *console* geprint om een overzicht te krijgen.

{{% /column %}}
{{% /multiHcolumn %}}

{{% figure src="/images/300/testbench_outcome.png" title="Voorbeeld van de rapportering" %}}

<!-- {{< include_file "/static/hdlsrc/300/alu_tb.vhd" "vhdl" >}} -->
{{% notice warning %}}
Voor de verbetering van deze taak wordt een soortgelijke testbench gebruikt. Er wordt enkel gekeken naar de *rapportering*.
{{% /notice %}}