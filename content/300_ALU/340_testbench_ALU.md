---
title: 'Opdracht - testbench ALU'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 340
draft: false
---

Om de juiste werking van de ALU te verifiëren, wordt er opnieuw gebruikt gemaakt van een testbench. Het is een goed idee om tijdens het ontwikkelen van de ALU meteen de functionaliteit te testen. Hiervoor kunnen er heel gericht bepaalde instructies ingesteld worden. Bijvoorbeeld:
{{% multiHcolumn %}}
{{% column %}}
Om 12 + 3 te doen weet je dat inputs de volgende moeten zijn:

* operand1 wordt 12
* operand2 wordt 3
* de instructie voor de optelling is 
    * ALUOp is "100"
    * signed_unsigned_b is '0'
    * arith_logic_b is '0'

De uitgangen van de ALU moeten de volgende zijn:

* result moet 15 zijn ( x"0000000F")
* de equal-vlag moet '0' zijn
* de x_lt_y_u-vlag moet '0' zijn
* de x_lt_y_s-vlag moet '0' zijn

Op deze manier kan je stapsgewijs de testbench opbouwen. Geef hierbij extra aandacht aan de **randgevallen**. Als jouw implementatie 12 + 3 correct kan berekenen, is de kans groot dat 13 + 3 ook wel zal lukken. De randgevallen zijn het echter wel waard om expliciet te testen. Kan jouw ALU 0xFFFFFFFF + 0xFFFFFFFF correct berekenen? Of -1 - (-1)?
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/300/sim_PSTIM.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}


Wanneer je denkt alle implementaties gedaan te hebben, kan je een grotere testbench los laten op jouw design. Een voorbeeld hiervan kan je <a href="/hdlsrc/300/alu_tb.vhd" download>hier</a> downloaden. Deze testbench is, zoals je misschien al vermoedde, **gegenereerd**. Voor de verbetering van de opdracht wordt een soortgelijke testbench gebruikt.

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/300/sim_PSTIM_2.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
Deze aangeleverde testbench controleert ook of de uitgang gelijk is aan de "juiste" uitgang. Hiervoor moet het resultaat kloppen, maar ook de relevante flags.

Na 2&nbsp;ns wordt elke uitgange vergeleken en wordt ofwel de **good_checks** teller ofwel de **bad_checks** teller verhoogd. Op het einde van de testbench worden deze tellers en hun som in de *console* geprint om een overzicht te krijgen.

{{% /column %}}
{{% /multiHcolumn %}}

{{% figure src="/images/300/testbench_outcome.png" title="Voorbeeld van de rapportering" %}}

<!-- {{< include_file "/static/hdlsrc/300/alu_tb.vhd" "vhdl" >}} -->
{{% notice warning %}}
Voor de verbetering van deze taak wordt een soortgelijke testbench gebruikt. Er wordt enkel gekeken naar de *rapportering*.
{{% /notice %}}