---
title: 'Wat is een ALU?'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 310
draft: false
---

Het doel van dit labo is om uiteindelijk een werkende microprocessor te maken, ook al is het in een simpele vorm. Het doel is om de [hack processor](https://en.wikipedia.org/wiki/Hack_computer)  te maken van de cursus [nand2tetris](https://www.nand2tetris.org/). In dit OPO gaan we de beschrijving uiteraard wel maken in VHDL.

Eén van de componenten die in iedere processor zit is een **Arithmetic Logic Unit (ALU)**. Een ALU neemt **2 (of 1) input(s)** en voert hier een bepaalde instructie mee uit. Deze instructie kan iets logisch zijn zoals AND, OR, XOR,.. of iets wiskundig zoals plus of min. 
![Foto ALU](/images/ALU/ALU_Principle.png)

De ALU die gebruikt wordt in de hack computer biedt de mogelijkheid om 18 verschillende instructies uit te voeren. De operatie die uitgevoerd wordt, wordt omgeschreven als *f(x,y)*.


{{% multiHcolumn %}}
{{% column %}}
### Aritmetische operaties
<table>
<tr><th>f(x,y) = </th><th>Omschrijving</th></tr>
<tr><td>&nbsp; &nbsp; x</td><td>&nbsp; &nbsp; Het resultaat is altijd x</td></tr>
<tr><td>&nbsp; &nbsp; y</td><td>&nbsp; &nbsp; Het resultaat is altijd y</td></tr>
<tr><td>&nbsp; &nbsp; x+1</td><td>&nbsp; &nbsp; Het resultaat is x+1</td></tr>
<tr><td>&nbsp; &nbsp; y+1</td><td>&nbsp; &nbsp; Het resultaat is y+1</td></tr>
<tr><td>&nbsp; &nbsp; x-1</td><td>&nbsp; &nbsp; Het resultaat is x-1</td></tr>
<tr><td>&nbsp; &nbsp; y-1</td><td>&nbsp; &nbsp; Het resultaat is y-1</td></tr>
<tr><td>&nbsp; &nbsp; x+y</td><td>&nbsp; &nbsp; Het resultaat is de som van x en y</td></tr>
<tr><td>&nbsp; &nbsp; x-y</td><td>&nbsp; &nbsp; Het resultaat is het verschil van x en y</td></tr>
<tr><td>&nbsp; &nbsp; y-x</td><td>&nbsp; &nbsp; Het resultaat is het verschil van y en x</td></tr>
</table>
{{% /column %}}

{{% column %}}
### Logische operaties
<table>
<tr><th>f(x,y) = </th><th>Omschrijving</th></tr>
<tr><td>&nbsp; &nbsp; 0</td><td>&nbsp; &nbsp; Het resultaat is altijd 0</td></tr>
<tr><td>&nbsp; &nbsp; 1</td><td>&nbsp; &nbsp; Het resultaat is altijd 1</td></tr>
<tr><td>&nbsp; &nbsp; -1</td><td>&nbsp; &nbsp; Het resultaat is altijd -1</td></tr>
<tr><td>&nbsp; &nbsp; !x</td><td>&nbsp; &nbsp; Het resultaat is de inverse van x</td></tr>
<tr><td>&nbsp; &nbsp; !y</td><td>&nbsp; &nbsp; Het resultaat is de inverse van y</td></tr>
<tr><td>&nbsp; &nbsp; -x</td><td>&nbsp; &nbsp; Het resultaat is het negatieve van x</td></tr>
<tr><td>&nbsp; &nbsp; -y</td><td>&nbsp; &nbsp; Het resultaat is het negatieve van y</td></tr>
<tr><td>&nbsp; &nbsp; x&y</td><td>&nbsp; &nbsp; Het resultaat is <u>x AND y</u></td></tr>
<tr><td>&nbsp; &nbsp; x|y</td><td>&nbsp; &nbsp; Het resultaat is <u>x OR y</u></td></tr>
</table>
{{% /column %}}
{{% /multiHcolumn %}}

<!-- Wie goed telt, ziet dat er 18 verschillende instructies mogelijk zijn. Om 18 instructies binair weer te geven hebben we 5 bits nodig ( &#8968;log<sub>2</sub>18&#8969; = 5 ). -->
