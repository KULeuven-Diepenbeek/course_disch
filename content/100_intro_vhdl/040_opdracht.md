---
title: 'Opdracht 1: OR gate'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 40
draft: false
---

Als eerste opdracht in deze labo's gaan jullie zelf een **OR gate** maken. In plaats van gebruik te maken van het **OR** keyword, moét deze gate gemaakt worden met **uitsluitend NAND poorten**. Maak hiervoor een nieuw bestand aan waarin je de beschrijving kwijt kan. Om te weten of de implementatie werkt, moet er ook een **testbench** geschreven worden. Deze kan dan gebruiken om het design te simuleren.

{{% multiHcolumn %}}
{{% column %}}
De schematic voor de OR poort (voor zij die het vergeten zouden zijn) is:
{{% figure src="/images/100/OR_gate.png" title="OR gate"  %}}

{{% /column %}}
{{% column %}}
De entity voor de OR poort moét als volgt zijn:

```vhdl
entity or_gate is
    port(
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Z : OUT STD_LOGIC
    );
end entity or_gate;
```
{{% /column %}}
{{% /multiHcolumn %}}

## Opleveren

Om deze opdracht op te leveren moet je gebruik maken van de Forgejo-server. Behoud hierbij de folderstructuur van de aangeleverde boilerplate code. Mogelijks bijkomende opmerkingen mogen in de README.md geschreven worden.