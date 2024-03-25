---
title: 'C instructie - destination'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 524
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

## Destination

{{% multiHcolumn %}}
{{% column %}}
In het totaal zijn er 3 verschillend bestemmingen waarin het resultaat opgeslagen kan worden:

* het D-register
* het A-register
* het werk geheugen (RAM) (ook wel **M** genoemd)

Als er aangenomen wordt dat een resultaat op meerdere plaatsen opgeslagen kan worden, of helemaal niet opgeslagen dient te worden zijn er 2<sup>3</sup> = 8 verschillende mogelijkheden. De tabel hiernaast beschijft welke *code* overeenkomt met de keuze van de 'te-laden-registers'. 
{{% /column %}}
{{% column %}}
![C instructie aankomst waarheidstabel ](/images/C_instruction_dest.png)
{{< image_courtesy 
  name="N. Nisan and S. Schocken"
  url="https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_b2cad2eea33847869b86c541683551a7.pdf"
  source="The Elements of Computing Systems"
  >}}
{{% /column %}}
{{% /multiHcolumn %}}
