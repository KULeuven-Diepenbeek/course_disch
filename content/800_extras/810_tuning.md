---
title: 'Tuning'
weight: 810
draft: false
---

De **latency** is de tijd die er nodig is tussen het starten van een operatie en het verkrijgen van het resultaat.

De **throughput** is de hoeveelheid bits die een operatie verwerkt in een gegeven tijdseenheid.

De **cost** is de kost van een ontwerp. Hoe meer componenten, hoe meer oppervlakte er ingenomen wordt op chip, en hoe duurder het ontwerp wordt.

Het **kritische pad** is het langste combinatorische pad tussen 2 registers/flip-flops.

<hr/>

### Design in de Hack Processor

![16-bit](/images/800/16_bit.png)

De latency is 1 clock cycle. Als we aannemen dat het kritische pad de *ripple carry* is en dat de minimale klok periode 2 ns is, dan is de **latency = 2ns**.

Aangezien er iedere clock cycle een optelling gedaan kan worden, is <br/>
**de througput = 8 Gbps** (= 16 bits / 1CC = 16 bits / 2 ns = 16 / (2 * 10<sup>-9</sup>) bits/s = 8 x 10<sup>9</sup> bits / s )

<hr/>

### Halvering van de breedte

![8-bit](/images/800/8_bit.png)

De latency is 1 clock cycle. Als we aannemen dat het kritische pad de *ripple carry* lineair mee krimpt, wordt de minimale klok periode <span style="color: red; font-weight: bold">1 ns</span> is en dan is de **latency = 1ns**.

Aangezien er iedere clock cycle een optelling gedaan kan worden, is <br/>
**de througput = 8 Gbps** (= 8 bits / 1CC = 8 bits / 1 ns = 8 x 10<sup>9</sup> bits / s )

<hr/>

### Unrolled

![Unrolled](/images/800/unrolled.png)

De latency is 1 clock cycle. Als we aannemen dat het kritische pad de *ripple carry* niet wijzigt, dan is de **latency = 2ns**.

Aangezien er iedere clock cycle een optelling gedaan kan worden, is <br/>
**de througput = 8 Gbps** (= 16 bits / 1CC = 16 bits / 2 ns = 16 / (2 * 10<sup>-9</sup>) bits/s = 8 x 10<sup>9</sup> bits / s )

<hr/>

### Pipelined

![Pipelined](/images/800/pipelined.png)

De latency is <span style="color: red; font-weight: bold">2 clock cycles</span>. Als we aannemen dat het kritische pad de *ripple carry* lineair mee krimpt, wordt de minimale klok periode <span style="color: red; font-weight: bold">1 ns</span> is en dan is de **latency = 2ns**.

Aangezien er, bij een volled pipeline, iedere clock cycle een optelling gedaan kan worden, is <br/>
**de througput = 16 Gbps** (= 16 bits / 1CC = 16 bits / 1 ns = 16 / (1 * 10<sup>-9</sup>) bits/s)

<hr/>

### Sequential

![Sequential](/images/800/sequential.png)

De latency is <span style="color: red; font-weight: bold">2 clock cycles</span>. Als we aannemen dat het kritische pad de *ripple carry* lineair mee krimpt, wordt de minimale klok periode <span style="color: red; font-weight: bold">1 ns</span> is en dan is de **latency = 2ns**.

Aangezien er iedere <span style="color: red; font-weight: bold">2 clock cycles</span> een optelling gedaan kan worden, is <br/>
**de througput = 8 Gbps** (= 16 bits / 2CC = 16 bits / 2 ns = 16 / (2 * 10<sup>-9</sup>) bits/s = 8 x 10<sup>9</sup> bits / s )

<hr/>

## Samenvatting

| | 16-bit | 8-bit | Unrolled | Pipelined | Sequential |
|---|---|---|---|---|---|
| T<sub>min</sub> [ns] | 2  | 1  | 2 | 1 | 1 |
| Latency [CC] | 1  | 1  | 1 | 2 | 2 |
| Latency [ns] | 2  | **1**  | 2 | 2 | 2 |
| Throughput [Gbps] | 8 | 8 | 8 | **16** | 8 |
| Aantal FF | 3x16 + 2x1 = 50 | 3x8 + 2x1 = 26 | 3x16 + 2x1 = 50 | (3x16 + 2x1) + (3x8 + 1x1) = **75** | 2x16 + 2x1 + 2x8 = 50 |
| Kan 16-bit optelling | &#x2713; | &#x2717;| &#x2713; | &#x2713; | &#x2713; |
| Extra controle pad | &#x2717; | &#x2717;| &#x2717; | &#x2713; | &#x2713; |
| F<sub>max</sub> [MHz] | 500  | 1000  | 500 | 1000 | 1000 |

* De resultaten van de 8-bit versie zijn louter voor de volledigheid;
* Unrolled geeft geen meerwaarde in dit geval
* Pipelined geeft betere throughput en klok snelheid, ten kosten van extra oppervlakte
* Sequential geeft betere klok snelheid, ten kosten van extra controle-logica

{{% notice tip %}}
Functionaliteit, kost, performantie ... Je kan voor **maximaal 2** prioriteiten optimaliseren, maar niet voor *alle* prioriteiten.
{{% /notice %}}