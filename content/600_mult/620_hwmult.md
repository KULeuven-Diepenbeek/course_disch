---
title: 'Hardware multiplier'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 620
draft: false
---

Het is altijd een goed idee om een probleem op te splitsen in kleinere probleempjes. De aanpak die in de vorige sectie uitgelegd is, kan opgedeeld worden in 3 fasen. Deze 3 fases zijn eenvoudiger om te vertalen naar hardware.

{{% multiHcolumn %}}
{{% column %}}
![3 fasen](/images/600/mult_phased.png)
{{% /column %}}
{{% column %}}
![3 fasen](/images/600/phases.png)
{{% /column %}}
{{% /multiHcolumn %}}

Met deze analyse zou je in staat moeten zijn om een hardware multiplier te maken. De entity van de multiplier is hieronder weergegeven.

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/600/mult.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
&nbsp;
{{% /column %}}
{{% /multiHcolumn %}}