---
title: 'Opdracht - testbench'
chapter: false
weight: 560
pre: "<i class='fas fa-book'></i> "
draft: false
---

Zoals bij voorgaande opdrachten, wordt ook bij deze opdracht een testbench voorzien. Aangezien de DUT (device-under-test) iets complexer is, is de gebruikte testbench ook iets complexer. 

{{% multiHcolumn %}}
{{% column %}}
De gewoonlijke structuur is natuurlijk wel behouden: **1)** libraries, **2)** entity (zonder poorten), en **3)** de architecture. Tussen de **architecture** en de **begin** staan de declaraties van signalen en componenten. Tussen de **begin** en **end** staat het *ontwerp*. Dit ontwerp staat hiernaast weergegeven. <br/><br/>
Er is een klein stukje code dat een **clock** genereert en een klein stukje code dat een **reset** genereert.
{{% notice tip %}}
Ter herinnering ... alles wordt in parallel uitgevoerd. Beide stukjes code (voor clock en reset) zijn **tegelijk** actief.
{{% /notice %}}
Uiteraard is er de **instantiatie van de DUT**. <br/><br/>

Tenslotte zijn er nog twee instantiaties van **mem_model**. Iets wat vaker gebeurt voor complexere blokken is dat er een *model* beschreven wordt. Dit model probeert de functionaliteit na te bootsen van een effectief hardware-blokje. In dit geval wordt er gebruikt gemaakt van een model voor het geheugen. Een geheugen heeft typisch de volgende poorten:

* (clock & reset)
* binnenkomend adres
* binnenkomende data
* binnenkomend signaal dat aanduidt of het om een lees/schrijf operatie gaat
* buitengaande data


{{% /column %}}
{{% column %}}
![Testbench block diagram](/images/cpu_tb_arch.png)
{{% /column %}}
{{% /multiHcolumn %}}

Dit model van een geheugen is zó beschreven dat het, tijdens reset, zichzelf initialiseert met de inhoud van een bestand. Om dit te kunnen maken, wordt er gebruik gemaakt van een speciale set van instructies uit VHDL. Dit is **niet-synthetiseerbare** code!! Bekijk deze code zeker eens in detail.

Een ander stukje niet-synthetiseerbare code is het volgende:

```vhdl
    signal addr_int : integer range 0 to ((2**DATA_DEPTH_LOG2)-1);
```

Dit gebruikt de operatie "machtsverheffing". De maximale waarde van de integer **addr_int** is (2<sup>DATA_DEPTH_LOG2</sup>-1). Dit is perfect acceptabel om te gebruiken in deze situatie, maar is geen alternatief voor de implementatie van een machtsverheffing in hardware!!

{{< include_file "/static/hdlsrc/500/cpu_tb.vhd" "vhdl" >}}
