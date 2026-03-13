---
title: 'Arrays'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 455
draft: false
---

Zoals wellicht geweten, is het bij het programmeren van software mogelijk om een array te maken. Als, bijvoorbeeld in C, je een *groep* van 10 characters hebt, kun je hiervoor een array maken. Elke index van de groep wijst hierbij naar één enkel element van het hetzelfde type. Toekenningen gebeuren ook op een index-gebaseerde manier

```C
  char groep_van_chars[10];

  groep_van_chars[3] = 0x36;
```

VHDL is een **strongly typed** taal. Dit wil zeggen dat iedere object één, welgedefinieerd type heeft. Zo zagen we al **STD_LOGIC**. Een object (signal, port, variable, ...) van het type **STD_LOGIC** kan de volgende waardes hebben: 

* **U** (Uninitialized): Default waarde bij de start van een simulatie.
* **X** (Forcing Unknown): Resultaat van een conflict van meerdere drivers.
* **0** (Forcing Low): *Sterke* logische 0.
* **1** (Forcing High): *Sterke* logische 1.
* **Z** (High Impedance): Hoog-impedant
* **W** (Weak Unknown): Weak signaal, ongekende waarde.
* **L** (Weak Low): Weak 0 (b.v., pull-down).
* **H** (Weak High): Weak 1 (b.v., pull-up).
* **-** (Don't Care): Gebruik om de synthese tool mogelijkheden te geven tot optimalisatie.

**STD_LOGIC_VECTOR** is een type dat ook al gebruikt is in deze labo-reeks. Het is gedefinieerd in de **IEEE** standaard **STD_LOGIC_1164** als een array van STD_LOGIC's.

```VHDL
    type STD_LOGIC_VECTOR is array (NATURAL range <>) of STD_LOGIC;
```

## Zelf types maken

Soms voelt het als een nadeel dat VHDL stronly typed is, maar dat kan ook in het voordeel gedraaid worden. Als er bijvoorbeeld nodig is aan 2D-type (en dat is er niet, by default), kan dat zélf gemaakt worden.

{{% multiHcolumn %}}
{{% column %}}
```VHDL
    -- A new type for an array of SLV's
    type T_memory is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
```
{{% /column %}}
{{% column %}}
Deze lijn VHDL-code **definieert een nieuw type: T_memory**. Het type is een array met 64 posities van STD_LOGIC_VECTORs met lengte 32.<br/>De plaats in het VHDL bestand waar deze typedef moet komen is **tussen de architecture en de begin**.
{{% /column %}}
{{% /multiHcolumn %}}

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice info %}}
Merk op dat de STD_LOGIC_VECTOR gedefinieerd is met **downto** terwijl de array gedefinieerd is met **to**. Dit is echter geen must en het is mogelijk om andere combinaties te maken.
{{% /notice %}}


{{% multiHcolumn %}}
{{% column %}}
Deze lijn VHDL-code **definieert een signaal van het type T_memory**. Het type is een array met 64 posities van STD_LOGIC_VECTORs met lengte 32.
{{% /column %}}
{{% column %}}

```VHDL
    signal mijn_DISCH_geheugen: T_memory;
```
{{% /column %}}
{{% /multiHcolumn %}}

<hr/>
{{% multiHcolumn %}}
{{% column %}}
Net zoals in software, kan een element uit een array geselecteerd worden mbv indices. Deze indices *moeten* van het type **integer** zijn. Let hierbij op dat er *ronde* haakjes gebruikt worden <div class="mark"> ( ) </div> en geen *vierkante* haakjes <div class="mark"> [ ] </div>.

```VHDL
    mijn_DISCH_geheugen(5) <= x"FEDCBA98";
```
{{% /column %}}
{{% column %}}

Het is ook mogelijk om alle indices tegelijkertijd aan te spreken.
```VHDL
    mijn_DISCH_geheugen <= (others => x"FEDCBA98");
```
{{% /column %}}
{{% /multiHcolumn %}}
