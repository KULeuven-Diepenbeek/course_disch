---
title: 'Integratie'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 530
---

Met het laatste ontbrekende bouwblokje (de program counter (PC)) geïmplementeerd, is het tijd om alles te integreren.

{{% figure src="/images/500/processor_blockdiagram_v2.png" title="" %}}

Een RISC-V processor heeft verschillende types van instructies. Om de zaken niet nodeloos complex te maken, wordt er voor deze implementatie enkel naar R-type (een deel van) de I-type instructies gekeken.

* Een **I-type** instructie (althans het deel van de I-types die in scoop ligt) voert een ALU operatie uit met <u>1 register en 1 argument</u>
* Een **R-type** instructie voert een ALU operatie uit met <u>2 registers</u>


Hier zijn 4 assembly instructies. Hoe deze uitgevoerd worden door de processor wordt hieronder uitgelegd.
{{% multiHcolumn %}}
{{% column %}}
```armasm
0x0:    addi x1, x0, 1
0x4:    addi x2, x0, 1
0x8:    add x3, x2, x1
0xC:    add x4, x3, x2
```
{{% /column %}}
{{% column %}}
1. Tel 1 op bij register 0 (x0) en sla het resultaat op in register 1 (x1)
0. Tel 1 op bij register 0 (x0) en sla het resultaat op in register 2 (x2)
0. Tel de inhouden van registers 2 (x2) en 1 (x1) op en sla de som op in register 3 (x3)
0. Tel de inhouden van registers 3 (x3) en 2 (x2) op en sla de som op in register 4 (x4)
{{% /column %}}
{{% /multiHcolumn %}}


De **PC** start op 0x0. Deze waarde wordt aan het **instructie geheugen** gegeven en deze stuurt de instructie ```addi x1, x0, 1``` terug. De **control** blok ontleedt de instructie en maakt de bijpassende controle-signalen:

* de selectie-signalen van de register file voor beide operanden
* de keuze van de operatie van de ALU
* de keuze voor de tweede operand die naar de ALU gaat
* de aansturing van de *write-enable* van de register file
* de aansturing van de register selectie voor de opslag van het resultaat
* de correcte instructie voor de PC

Hierdoor geeft de **register file** de juiste waardes, ontvangt de **ALU** de correcte operanden om de instructie op uit te voeren en wordt het resultaat op de juiste plaats weggeschreven.

De tabel hieronder illustreert hoe de waardes veranderen in de implementatie.

{{% figure src="/images/500/table.png" title="" %}}

In simulatie ziet er dit ongeveer als volgt uit:
![Simulation](/images/500/simulation.png)

{{% notice note %}}
De inhoud van register 0 (x0) MAG nooit overschreven worden en zal altijd de waarde 0x0 hebben.
{{% /notice %}}