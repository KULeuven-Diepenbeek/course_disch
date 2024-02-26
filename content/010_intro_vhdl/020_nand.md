---
title: 'NAND poort'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 20
draft: false
---

De volgende stap is de beschrijving van een logisch NAND poort. Hiervoor maak je een nieuwe component aan in het Vivado project. Het grootste deel van de code van de invertor kunnen we overnemen als startpunt voor deze beschrijving.

We passen de entity aan zodat we **2 inputs** hebben in plaats van 1. De behuizing van de nieuwe component zegt nu dat er 3 pinnen zijn: 2 input pinnen en 1 output pin. 

Uiteraard moet het gedrag van deze component ook aangepast worden. In de architecture schrijven we dat we een NAND operatie willen doen. De basis poort **NAND** is ook beschikbaar als keyword in VHDL.

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/100/nand_gate.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/drawio_new_nand.png" title="NAND gate"  %}}
{{% /column %}}
{{% /multiHcolumn %}}

### Nog enkele bijkomende opmerkingen:

* VHDL is case-insensitive. Je mag dus hoofdletters en kleine letters verwisselen.
* commentaar wordt vooraf gegaan van 2 min-tekens ```--```
* Het is good-practice om niet meteen te werken met de in- en uitgangen, maar met lokale signalen. Daarom wordt in dit voorbeeld deze "vertaalslag" gemaakt.
* **commentaar kan NOOIT kwaad**

{{% notice tip %}}
Voor deze simpele voorbeelden lijkt het banaal om de link met de discrete component (en de bijhorende schematic) te leggen. Een goede designer verliest echter het volledige schema **NOOIT** uit het oog.
{{% /notice  %}}