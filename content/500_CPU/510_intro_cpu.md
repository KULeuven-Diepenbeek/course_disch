---
title: 'Een CPU maken'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 510
draft: false
---

Zoals in het begin van deze lessenreeks reeds vermeld, is het uiteindelijke doel het maken van een processor. De voorbij labo's hebben de basis hiervoor gelegd. De volgende componenten, die jullie reeds gemaakt hebben, dienen samengebracht te worden:

* registers
* multiplexers
* een ALU
* een program counter

De architectuur van de Central Processing Unit (CPU) die we voor ogen hebben is reeds ontworpen. Deze maakt deel uit van de **Hack computer**. Deze bevat, naast de cpu, ook 2 geheugens (1 voor instructies en 1 voor data), een toetsenbord en scherm (voor in- en output, resptievelijk) en (uiteraard) een clock. Het blok-diagram van de CPU staat hieronder ook weergegeven. 


Bij de ingang van de ALU, de bovenkant (register D) is ALU ingang x en de onderkant is ALU ingang Y.

{{% multiHcolumn %}}
{{% column %}}
### Hack computer
![hack CPU](https://upload.wikimedia.org/wikipedia/commons/7/76/Hack_Computer_Block_Diagram_2.png)
{{% /column %}}

{{% column %}}
### Hack CPU
![hack CPU](https://upload.wikimedia.org/wikipedia/commons/2/2c/Hack_Computer_CPU_Block_Diagram.png)
{{% /column %}}
{{% /multiHcolumn %}}

{{< image_courtesy 
  name="Rleininger"
  url="https://en.wikipedia.org/wiki/Hack_computer"
  source="Wikipedia"
  >}}

## De nooit-eindigende lus

Een computer is eigenlijk een dom beest. Hij draait rondjes, zolang hij aan staat. Het rondje dat de computer (in dit geval de **Hack computer**) maakt is het volgende:

1. Haal de instructie op
2. Voer de instructie uit
3. Bepaal de volgende instructie

Zoals we in het voorgaande hoofdstuk gezien hebben, is er één signaal dat ervoor zorgt dat alles in goede banen geleid wordt: **de klok**. Alles gebeurt synchroon ten opzicht van deze klok.

De instructie wordt opgehaald uit het instructie geheugen (**ROM**). Om te bepalen welke instructie opgehaald dient worden, fungeert de **program counter** als *pointer*. De program counter die jullie in het vorige hoofdstuk gemaakt hebben voldoet hiervoor, met deze uitzondering dat het ROM geheugen maar 32'768 instructies diep is (en dus maar 15 bits breed is).

Om de instructie uit te voeren, wordt er gebruik gemaakt van de **ALU**. Deze hebben jullie reeds 2 hoofdstukken geleden gemaakt.

Omdat er soms meer geheugen nodig is om bewerkingen te kunnen doen en omdat er *randapparatuur* aanwezig is, is er nog een data geheugen (**RAM**) aanwezig. Instructies die uitgevoerd worden kunnen hun inputs hieruit halen en/of hun resultaat hiernaar schrijven. De breedte van deze RAM is dan ook 16 bits. Een eenvoudige manier om de randapparatuur te gebruiken is om deze een sectie uit het RAM geheugen toe te kennen. Aangezien er 2 *toestellen* zijn, zijn er ook 2 vast-gedefinieerde regio's hiervoor:

* **0x4000-0x5FFFF** Deze ruimte in de RAM (of "werkgeheugen") is gereserveerd voor het scherm;
* **0x6000** Dit adres is gereserveerd voor het toetsenbord.

Tenslotte, na het ophalen en uitvoeren van een instructie, dient de program counter aangepast te worden naar de volgende instructie.