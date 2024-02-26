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
{{% figure src="/images/intro/OR_gate.png" title="OR gate"  %}}

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

Om deze opdracht op te leveren moeten jullie volgende bestanden indienen via Toledo:

* één (of meerdere) bestanden met het design
* één bestand met de testbench
* **[OPTIONEEL]** een markdown file met nodige uitleg

Deze laatste is misschien nog niet nuttig voor deze opdracht, maar mogelijks wel voor latere opdrachten. Deze file geeft je de mogelijkheid om extra info mee te sturen.

{{% notice warning %}}
Laad enkel de bovenvernomende bestanden op in Toledo. Het is **NIET** de bedoeling om een **volledig Vivado project** te zippen en in te dienen !!
{{% /notice %}}

{{% notice tip %}}
De VHDL broncode van de voorbeelden uit dit hoofdstuk kun je vinden op [GitHub](https://github.com/KULeuven-Diepenbeek/course_disch/tree/main/static/hdlsrc/100).
{{% /notice %}}