---
title: 'C instructie - compute'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 523
draft: false
---

Indien de **MSB** van een 16-bit instructie **'1'** is, dan wilt dit zeggen dat dit een **C-instructie** is. De overige 15 bits dienen als volgt geïnterpreteerd te worden: er zijn 3 velden die geïnterpreteerd worden: 

{{% multiHcolumn %}}
{{% column %}}
* een berekening (**comp**) welke aanduidt welke berekening gedaan dient te worden;
* een bestemming (**dest**) welke aanduidt waar het resultaat van de berekening opgeslagen dient te worden;
* een wat-hierna (**jump**) welke aanduidt naar waar de program counter moet veranderen, na de uitvoering van deze instuctie.
{{% /column %}}
{{% column %}}
```C
dest := comp; jump
```
{{% /column %}}
{{% /multiHcolumn %}}

![C instructie](/images/500/C_instruction.png)

{{< image_courtesy 
  name="N. Nisan and S. Schocken"
  url="https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_b2cad2eea33847869b86c541683551a7.pdf"
  source="The Elements of Computing Systems"
  >}}

## Compute

Van de 7 bits in de het comp-veld, zullen de 6 minst beduidende wel een belletje doen rinkelen. Dit zijn namelijk de 6 bits die voorheen gebruikt werden om de *functie* aan te duiden die de ALU moet uitvoeren.

De X-operand van de ALU ligt vast en is **altijd** de waarde uit het register D.

De Y-operand van de ALU wordt bepaald door een multiplexer en wordt dus ofwel de waarde uit het register A (bij een '0' als selectie-bit) ofwel de waarde die uit het geheugen komt (bij een '1' als selectie-bit). De MSB van het 7-bit comp-veld (de **a-bit**) geeft de selectie aan voor deze multiplexer.

De waarheidstabel hieronder vat dit veld samen.

![C instructie compute waarheidstabel ](/images/500/C_instruction_comp.png)
{{< image_courtesy 
  name="N. Nisan and S. Schocken"
  url="https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_b2cad2eea33847869b86c541683551a7.pdf"
  source="The Elements of Computing Systems"
  >}}