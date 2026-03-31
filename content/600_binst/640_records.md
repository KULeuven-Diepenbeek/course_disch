---
title: 'Records'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 640
draft: false
---

In voorgaande cursustekst is het al meermaals aangehaald dat VHDL "sterk getypeerd" is. Een STD_LOGIC_VECTOR en een STD_LOGIC_UNSIGNED (bijvoorbeeld) kunnen niet zonder meer aan elkaar gekoppeld worden, zonder type-conversie.

{{% multiHcolumn %}}
{{% column %}}
Er is al gebruikt gemaakt ([in hoofdstuk 4](/400_sequentiele_logica/455_arrays/)) van het feit dat een type zelf gecreeerd kan worden. Ook samengestelde vormen kunnen soms een meerwaarde bieden, zoals een struct in C. In VHDL kan dit bekomen worden door een **record** te maken.
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/600/record.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

Door een record aan te maken (zoals in het voorbeeld) kunnen een groep signalen samengenomen worden. Van zo een record wordt vervolgens een type gemaakt zodat dit ook gebruikt worden in VHDL beschrijvingen. **Merk op** dat er hier geen sprake is van een *richting* (in en out).

### Voorbeeld

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/600/processor.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
In dit voorbeeld heeft de processor een **bus_o** en een **bus_i** port. De *bus_o*-poort is van het type zoals hierboven gedeclareerd. Deze "ene poort" is eigenlijk 3 bussen: 'data', 'address' en 'we'.

Om één bepaalde bus (of veld) te selecteren is de syntax als volgt:

```vhdl
bus_o.data <= (others => '1');
```
{{% /column %}}
{{% /multiHcolumn %}}

De voordelen van het gebruik van records komen pas wanneer er veel losse signalen "samen horen". Dit is typisch het geval bij **interface** zoals AXI4 of wishbone bussen. Wanneer je bovendien een array aan records maakt als type, dan kan er veel type-werk bespaard worden. 

Het gebruik van records zal geen impact hebben op het design dat gemaakt wordt, maar is eerder bedoeld om de "arme designer" te helpen met de beschrijving van het design.


<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice tip %}}
Voor de volledigheid dient er vermeld te worden dat records genest kunnen worden. Een record kan dus bestaan uit verschillende types van velden waaronder dus ook een (andere) record.
{{% /notice %}}

