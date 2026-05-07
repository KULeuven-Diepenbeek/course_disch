---
title: 'Metrics'
weight: 805
draft: false
---

Om elektronische ontwerpen te vergelijken is er een **metric** nodig. Vooralleer die besproken worden, wordt er eerst wat opfrissing gedaan.

## Kritisch pad (critical path)

> Het kritische pad is het langste combinatorische pad tussen 2 registers/flip-flops.

Wat zou het kritische pad zijn in onderstaande ripple-carry adder?

![Ripple Carray Adder](/images/800/adder.png)

{{% multiHcolumn %}}
{{% column %}}
Het langste pad dat gevonden kan worden is dat van de *"rimpelende carry"*.

* deze ontstaat bij de eerste adder
* loopt door iedere andere adder

De meest beduidende bit van de RCA is dus pas bekend van zodra deze carry aankomt en verwerkt is in de laatste adder. De opteller kan niet sneller werken zonder zichzelf voor de voet te lopen.
{{% /column %}}
{{% column %}}
![Different clocks](/images/800/clocks.png)
{{% /column %}}
{{% /multiHcolumn %}}

{{% multiHcolumn %}}
{{% column %}}
![Ripple Carray Adder](/images/800/adder_with_cp.png)
{{% /column %}}
{{% column %}}
Het langst mogelijke kritische pad in deze RCA is:
* de poortvertraging van 1 AND poort
* **PLUS** n-1 keren de poortvertragingen van de AND poort plus de XOR poort

Stel dat de totale som van alle poortvertragingen (+ overhead<sup>1</sup> ) 2 ns is, dan heeft dit een impact op de **minimale klok-period**. Het heeft bijgevolg dus rechtstreeks impact op de **maximale klokfrequentie**.
{{% /column %}}
{{% /multiHcolumn %}}

> <sup>1</sup> Met overhead wordt bedoeld dat ook setup-en-hold tijd in rekening gebracht moet worden alsook de routing.


## Latency

**Latency** is de tijd die nodig is tussen het aanbieden van een input en het ontvangen van een output. De latency kan uitgedrukt worden in **aantal klok-cycli**. Wanneer de maximale klokfrequentie gekend is, kan de latency simpel in "tijd" omgezet worden.