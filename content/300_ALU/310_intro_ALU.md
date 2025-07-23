---
title: 'Wat is een ALU?'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 310
draft: false
---

Het doel van dit labo is om uiteindelijk een werkende RISC-V processor te maken, ook al is het in een simpele vorm. In dit OPO gaan we de beschrijving uiteraard wel maken in VHDL.

Eén van de componenten die in iedere processor zit is een **Arithmetic Logic Unit (ALU)**. Een ALU neemt **2 (of 1) input(s)** en voert hier een bepaalde instructie mee uit. Deze instructie kan een logische operatie zijn zoals AND, OR, XOR,.. of een wiskundige operatie zoals een optelling of een verschil. 

{{% figure src="/images/300/ALU_principle.png" title="Principe schema van een ALU" %}}

De ALU die gebruikt wordt in de RISC-V processor, biedt de mogelijkheid om 10 verschillende instructies uit te voeren. De operatie die uitgevoerd wordt, wordt omgeschreven als *f(x,y)*.


{{% multiHcolumn %}}
{{% column %}}
### Aritmetische operaties
<table>
<tr><th>f(x,y) = </th><th>Omschrijving</th></tr>
<tr><td>&nbsp; &nbsp; x+y</td><td>&nbsp; &nbsp; Het resultaat is de som van x en y</td></tr>
<tr><td>&nbsp; &nbsp; x-y</td><td>&nbsp; &nbsp; Het resultaat is het verschil van x en y</td></tr>
</table>
{{% /column %}}

{{% column %}}
### Logische operaties
<table>
<tr><th>f(x,y) = </th><th>Omschrijving</th></tr>
<tr><td>&nbsp; &nbsp; x&y</td><td>&nbsp; &nbsp; Het resultaat is <u>x AND y</u></td></tr>
<tr><td>&nbsp; &nbsp; x|y</td><td>&nbsp; &nbsp; Het resultaat is <u>x OR y</u></td></tr>
<tr><td>&nbsp; &nbsp; x^y</td><td>&nbsp; &nbsp; Het resultaat is <u>x XOR y</u></td></tr>
<tr><td>&nbsp; &nbsp; x&lt;&lt;y</td><td>&nbsp; &nbsp; Het resultaat is <u>x</u>, y posities naar links geschoven en aangevuld met 0-en</td></tr>
<tr><td>&nbsp; &nbsp; x&gt;&gt;y</td><td>&nbsp; &nbsp; Het resultaat is <u>x</u>, y posities naar rechts geschoven en aangevuld met 0-en</td></tr>
<tr><td>&nbsp; &nbsp; x&gt;&gt;y</td><td>&nbsp; &nbsp; Het resultaat is <u>x</u>, y posities naar rechts geschoven (mét tekenbehoud)</td></tr>
<tr><td>&nbsp; &nbsp; (x&lt;y)</td><td>&nbsp; &nbsp; Het resultaat is <u>1</u> als x&lt;y, anders <u>0</u></td></tr>
<tr><td>&nbsp; &nbsp; (x&lt;y)<sub>U</sub></td><td>&nbsp; &nbsp; Het resultaat is <u>1</u> als x&lt;y, anders <u>0</u>. X en y worden gezien als <b>unsigned</b></td></tr>
</table>
{{% /column %}}
{{% /multiHcolumn %}}


<!-- Wie goed telt, ziet dat er 18 verschillende instructies mogelijk zijn. Om 18 instructies binair weer te geven hebben we 5 bits nodig ( &#8968;log<sub>2</sub>18&#8969; = 5 ). -->
