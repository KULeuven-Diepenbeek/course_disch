---
title: 'Generate'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 280
draft: false
---

De meeste designs hebben ergens wel een bus, of een signaal dat een vector is. Daarom kan het ook vaak voorkomen dat VHDL-code nogal veel herhalingen heeft. Neem bijvoorbeeld het design hier onder, waarbij er een and gedaan wordt voor elke input-paar. Rechts zie je een beschrijving hiervan in VHDL.

{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/200/generate_1.png" title="Design voor for-generate" %}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/200/generate_1.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

Zolang dat het aantal bits in deze X-vector behapbaar blijft, kan je dat volledig uitschrijven. Als deze vector te breed wordt, dan begint het pijnlijk te worden. In VHDL wordt hieraan tegemoet gekomen mbv een **for-generate**. Deze constructie bespaart aanzienlijk veel *"beschrijf werkt"* zonder aan de functionaliteit te komen. <br/><br/>**Het uiteindelijke design verandert niet omdat een for-generate gebruikt wordt.**

{{< include_file "/static/hdlsrc/200/generate_2.vhd" "vhdl" >}}

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice tip %}}
Het kan, voor beginnende VHDL-gebruikers soms verwarrend zijn hoe deze indices gebruikt moeten worden. Een goede tip is om de eerste 2-3 instanties volledig uit te schrijven. Hiermee kan het patroon van de indices gemakkelijker herkend worden.
{{% /notice %}}

#### Componenten instantiëren mbv een for-generate

Ook het instantiëren van een component kan gebeuren met een for-generate. Indien men het bovenstaande voorbeeld willen beschrijven met de AND-poort uit het vorige hoofdstuk, kan dit als volgt:

{{< include_file "/static/hdlsrc/200/generate_3.vhd" "vhdl" >}}


{{% notice note %}}
Vivado kan een schematische voorstelling maken van de hardware beschrijving met RTL analysis elaborate design.
{{% /notice %}}