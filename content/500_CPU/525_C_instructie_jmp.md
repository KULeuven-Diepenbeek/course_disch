---
title: 'C instructie jump'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 525
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

## Jump

{{% multiHcolumn %}}
{{% column %}}
Na het uitvoeren van de instructie, moet er naar de volgende instructie gegaan worden. Dit kan gemakkelijk geïmplementeerd worden door de program counter te verhogen met 1. Het kan echter ook handig zijn om een **jump** te doen naar een ander adres in de **ROM**.

Naast de (standaard) verhoging met 1, of de jump, kan het ook zijn dat er een jump moet gedaan worden **onder bepaalde voorwaarden**. Deze voorwaarden (voor de Hack CPU) zijn de vergelijking met 0 van het resultaat van de bewerking. De tabel hiernaast beschijft welke *voorwaarde* overeenkomt met de keuze van de **conditional jump**.
{{% /column %}}
{{% column %}}
![C instructie aankomst waarheidstabel ](/images/C_instruction_jmp.png)
{{< image_courtesy 
  name="N. Nisan and S. Schocken"
  url="https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_b2cad2eea33847869b86c541683551a7.pdf"
  source="The Elements of Computing Systems"
  >}}
{{% /column %}}
{{% /multiHcolumn %}}
