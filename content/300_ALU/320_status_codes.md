---
title: 'Status codes ALU'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 320
draft: false
---

De ALU gaat dus een arithmetische of logische instructie uitvoeren. Ongeacht de operatie die de ALU moet uitvoeren, zijn er **altijd** twee ingangen. Het is niet mogelijk om de *Silicon* even aan te passen indien er een operatie moet gebeuren die maar 1 operand heeft. De operatie die de ALU moet uitvoeren, wordt in de Hack processor gekozen aan de hand van 6 bits: de **status code**. De ALU heeft dus, naast **2 ingangen van 16-bit registers** voor de operanden, ook 6 controle bits.

Tenslotte wordt ter typisch ook verwacht van de ALU dat deze wat extra informatie deelt over de uitgevoerde operatie. De processor die ontwikkeld wordt in de labo verwacht dat de ALU 2 status codes deelt: 1) is het resultaat van de operatie 0x0 (**zr-flag**), en 2) is het resultaat van de operatie negatief (**ng-flag**).

Onze ALU geeft ook status codes uit die we later in de processor nog gebruiken.

{{% figure src="/images/300/ALU_principle_better.png" title="" %}}