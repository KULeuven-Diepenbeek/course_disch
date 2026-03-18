---
title: 'Opdracht - testbench'
chapter: false
weight: 560
pre: "<i class='fas fa-book'></i> "
draft: false
---

Zoals bij voorgaande opdrachten, wordt ook bij deze opdracht een testbench voorzien.


{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/500/kr.gif" title="" %}}
{{% /column %}}
{{% column %}}
Het **"programma"** dat in de firmware staat zorgt dat er een waarde in een register geschreven wordt en dat dit horizontaal heen en weer loopt. Het programma is op zo een manier geschreven dat het bestaat uit 64 instructies. Dit heeft tot effect dat enkel de 8 LSBs van de 32-bit program counter bepalen welke instructie uitgevoerd wordt. 

Daardoor zal, bij de overgang van 1111'1100 naar 1'0000'0000, het programma in een oneindige loop komen.

Wanneer dit programma gesimuleerd wordt, zien de waveforms er uit zoals in onderstaande figuure. Het programma zelf staat, louter ter info, onderaan deze pagina en is geschreven in **assembly**.
{{% /column %}}
{{% /multiHcolumn %}}

{{% figure src="/images/500/simulation_kr.png" title="" %}}

{{< include_file "/static/hdlsrc/500/knight_rider.S" "S" >}}



