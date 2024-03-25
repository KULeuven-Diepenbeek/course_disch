---
title: 'C instructie'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 522
draft: false
---

Indien de **MSB** van een 16-bit instructie **'1'** is, dan wilt dit zeggen dat dit een **C-instructie** is. De overige 15 bits dienen als volgt geïnterpreteerd te worden: er zijn 3 *velden* die gekozen worden: 

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

![C instructie](/images/C_instruction.png)

{{< image_courtesy 
  name="N. Nisan and S. Schocken"
  url="https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_b2cad2eea33847869b86c541683551a7.pdf"
  source="The Elements of Computing Systems"
  >}}