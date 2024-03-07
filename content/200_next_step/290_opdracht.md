---
title: 'Opdracht 2: Ripple carry adder'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 290
draft: false
---

In deze opdracht moet je een **16 bit ripple-carry adder** te maken. Indien je vergeten bent hoe een full adder en een half adder eruit zien, kan je kijken naar onderstaande schema's. Bij een ripple-carry adder wordt de C out van de eerste adder doorgegeven aan de tweede adder. We werken in little endian.

Het is **niet** de bedoeling dat je de + operator gebruikt van "std_logic_unsigned"  of "std_logic_signed"!

{{% figure src="/images/half_adder.png" title="Half adder, met S = A &oplus; B"  %}}
{{% figure src="/images/full_adder.png" title="Full adder"  %}}

{{% notice warning %}}
Het is altijd een goed idee om eerst een tekening te maken voordat je begint met typen.
{{% /notice %}}

## Opleveren

Om deze opdracht op te leveren moeten jullie volgende bestanden indienen via Toledo:

* één of meerdere bestanden met het design
* **[OPTIONEEL]** een markdown file met nodige uitleg

Merk op dat er **GEEN** testbench mee opgeladen dient te worden.

## Testbench

<!-- Hieronder staat een voorbeeld van een testbench. Vaak is het interesant om enkele specifieke stimuli te hebben tijdens de ontwikkeling. Indien het mogelijk is (zoals hier het geval is), is het ook een optie om simpelweg ALLE opties te verifiëren. Omdat dergelijk bestand nogal groot wordt, is hieronder een verkorte versie weergegeven. De volledige testbench kan [hier](https://github.com/KULeuven-Diepenbeek/course_disch/tree/main/static/hdlsrc/200) gedownload worden. -->

{{% notice tip %}}
Om een component declaratie te doen, kan je eenvoudig de **entity** kopiëren en de keywoorden *entity* vervangen door component.<br/><br/>
Het omgekeerde kan uiteraard ook :smiley:
{{% /notice %}}

{{< include_file "/static/hdlsrc/200/rca_tb.vhd" "vhdl" >}}
