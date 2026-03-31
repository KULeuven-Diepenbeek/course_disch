---
title: 'Packages'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 630
draft: false
---

De beschrijving van de processor die gemaakt wordt, begint al groter te worden. Van zodra er meerdere **componenten** zijn en deze in verschillende andere componenten geïnstantieerd worden, kunnen de *tekstbestanden* snel groot worden. In software wordt dit opgelost door libraries of soortgelijke equivalenten te gebruiken. VHDL komt hieraan tegemoet met **packages**. De structuur van een package is anders dan die van een *entity*, zoals tot hiertoe gebruikt.

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/600/package.vhd" "vhd" >}}
{{% /column %}}
{{% column %}}
Hiernaast is de structuur van een **VHDL-package** weergegeven. Allereerst wordt er begonnen met het includen van de IEEE library en STD_LOGIC. Deze regels zijn nodig omdat er binnen de package (wellicht) gebruik van gemaakt wordt.

Vervolgens zijn er 2 blokken de **package** en de **package body**.
{{% /column %}}
{{% /multiHcolumn %}}

{{% multiHcolumnT %}}
{{% column %}}
### Package

In de package kunnen zaken beschreven worden die **beschikbaar** zijn:

* Component declaraties
* Constanten
* Types
* Functie/procedure declaraties
{{% /column %}}
{{% column %}}
### Package body

In de package body kan beschreven worden **hoe** zaken werken.

* Hier schrijf je de implementatie van functies/procedures

{{% /column %}}
{{% /multiHcolumnT %}}

{{% multiHcolumn %}}
{{% column %}}
Om een package te gebruiken, volstaat het om de volgende twee lijnen toe te voegen aan het VHDL bestand, boven de entity.
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/600/pacage_usage.vhd" "vhd" >}}
{{% /column %}}
{{% /multiHcolumn %}}


Het gebruik van een package geeft enkele voordelen:

* **declutteren** van code. Doordat declaraties niet meer herhaald moeten worden, wordt er meer overzicht gecreëerd
* **structuur** verbetering door een ietwat meer doorgedreven scheiding van logica en implementatie
* **consistentie** verhoging doordat definities en parameterisatie centraal staan.



<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice tip %}}
Het is **niet** omdat de package de IEEE library en de STD_LOGIC_1164 package body gebruikt, dat de component die deze package gebruikt dat kan **weglaten**.
{{% /notice %}}

{{% notice info %}}
Let op dat de packages *gecompiled* zijn voordat ze gebruikt worden!!
{{% /notice %}}