---
title: 'Een CPU maken'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 510
draft: false
---

Zoals in het begin van deze lessenreeks reeds vermeld, is het uiteindelijke doel het maken van een processor. In de voorbije labo's is hiervoor de basis gelegd. 

{{% multiHcolumn %}}
{{% column %}}
Een processor kan, met een beetje fantasie, gezien worden als een chef-kok die een recept maakt. De chef volgt het recept stap voor stap. 

1. Schuif een latje of blaadje naar onder voor de volgende regel van het recept te bepalen,
0. lees de volgende regel in het recept,
0. probeer te *ontcijferen* wat deze instructie wilt zeggen,
0. en voer de instructie uit.

Een processor doet hetzelfde rondje als de chef:
1. Verhoog de **program counter**,
0. haal de volgende instructie van het programma op uit **geheugen**,
0. **decodeer** de instructie,
0. en **voer de instructie uit**.

{{% /column %}}
{{% column %}}
{{% figure src="/images/500/chef.png" title="" %}}
{{< image_courtesy 
  name="Untitled"
  url="https://copilot.microsoft.com"
  source="Microsoft Copilot"
>}}

{{% /column %}}
{{% /multiHcolumn %}}

De figuur hieronder geeft het blokschema weer van processor die er gemaakt dient te worden. De <span style="color: #78ad5a; text-decoration: underline">groene blokken</span> in het blokschema zijn componenten die gemaakt zijn in voorgaande hoofdstukken. De <span style="color: #b34b47; text-decoration: underline">rode blokken</span> in het blokschema zijn componenten die voor jullie gemaakt zijn. Wat er nog rest is de (<span style="color: #6e90c1; text-decoration: underline">blauwe blok</span>): de program counter.

{{% figure src="/images/500/processor_blockdiagram.png" title="" %}}

Programmeren is de kunst om goede recepten op te stellen. Deze zullen aan de hand van tools vertaald worden naar *recepten* die de processor kan uitvoeren.

{{% multiHcolumn %}}
{{% column %}}
### Hoge(-re) programmeertaal
Software wordt geschreven in een hoge(-re) programmeertaal. Denk bijvoorbeel aan Python, Java, C, Rust, of GO.
{{% figure src="/images/500/programming_1.png" title="" %}}
{{% /column %}}
{{% column %}}
### Assembly
De software wordt aan de hand van een aantal tussenstappen (afhankelijk van het abstractieniveau van de taal) omgezet naar assembly code. Dit wordt gedaan door een interpreter of een compiler .
{{% figure src="/images/500/programming_2.png" title="" %}}
{{% /column %}}
{{% column %}}
### Machinetaal
De assembler zet tenslotte de gegeneerde assembly om naar machine code 
{{% figure src="/images/500/programming_3.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}

De uiteindelijke machinetaal zal uiteraard afhangen van de processor die deze instructies moet uitvoeren. ISA staat voor **Instruction set architecture** en beschrijft hoe instructies opgebouwd moeten worden zodat de CPU deze kan uitvoeren.