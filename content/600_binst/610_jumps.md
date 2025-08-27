---
title: 'Jumps'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 610
draft: false
---

Tot hiertoe *liep* het programma gelijk een recept in de keuken. Iedere stap werd één-voor-één uitgevoerd. Iets geavanceerdere software (met de nadruk op *iets*) breken met dit principe. Af en toe wordt er een sprong uitgevoerd. Dit is zelfs al het geval bij een simpele if-constructie.

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/600/if.c" "C" >}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/600/if.ass" "S" >}}
{{% /column %}}
{{% /multiHcolumn %}}

{{% multiHcolumn %}}
{{% column %}}
In dit voorbeeld wordt er een **conditionele jump** gedaan. Dit is *een sprong in het recept*, mits er aan een bepaalde voorwaarde al-dan-niet voldaan is. De voorwaarde in het voorbeeld is: **is deze waarde gelijk aan 16**.

Indien er aan de voorwaarde voldaan is, wordt er <span style="border: 2px solid #d89c06; background-color: #ffe6cc">een bepaalde instructie (of reeks van instructies)</span> uitgevoerd. Indien er *niet* aan de voorwaarde voldaan is, wordt een <span style="border: 2px solid #d7b759; background-color: #fff2cc">andere (set van) instructie(s)</span> uitgevoerd. De pijlen in de tekening de volgorde van de instructies aan en illustreren hoe er een **sprong** gemaakt wordt.

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice warning %}}
In de tekening ontbreekt 1 sprong. Welke?
{{% /notice %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/600/conditional_jump.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}

De processor die gemaakt wordt, moet dit soort **jumps** ook kunnen faciliteren. Dit wordt gedaan door de program counter niet, na elke instructie, te verhogen met 0x4; maar door (wanneer nodig) een andere offset op te tellen of zelfs een volledige load te doen van de 32 bits van de PC.