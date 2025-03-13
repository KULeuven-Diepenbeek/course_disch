---
title: 'Meerdere registers'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 450
draft: false
---

Het aantal ontwerpen dat je ooit zal maken dat minder dan 2 registers heeft, zal eerder beperkt zijn. Het **beschrijven** van registers neemt nogal wat regels HDL code in beslag. Stel dat er 2 registers in een design zijn: regA en regB. Een VHDL beschrijving van dit design zal ergens onderstaande twee stukken code bevatten.

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/regA.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/regB.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

Beide registers hebben een **synchrone, actief hoge reset**. Als, op een **rising edge**, de respectievelijke **load signalen** hoog zijn, zullen de register de inkomende data **samplen**..

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice info %}}
Merk op dat labels niet dubbel gebruikt mogen worden. De 2 labels in bovenstaand voorbeeld zijn **PREGA** en **PREGB**.
{{% /notice %}}

{{% multiHcolumn %}}
{{% column %}}
Een compactere manier om deze twee registers te beschrijven is hier weergegeven. Aangezien de 2 beschrijvingen van register A en register B veel op elkaar lijken, kunnen deze beschrijvingen gemakkelijk samengenomen worden.

Extra aandacht moet besteed worden aan de if-then(-else) structuur. Wees jezelf er bewust van dat (in dit voorbeeld) het **load_A** signaal totaal <u>geen effect</u> heeft op register B. Er mag dus géén **else** gebruikt worden. 

**Dit zou echter geen syntax-fouten geven.** 

Met een *else-beschrijving* zou er immers beschreven worden dat register B enkel mag laden als **load_A** <u>laag</u> is <u>EN</u> **load_B** <u>hoog</u> is. Dit is een perfect plausible gedrag, maar niet het gedrag dat in dit voorbeeld beoogd is.
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/regAB.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}