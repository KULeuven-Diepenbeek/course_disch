---
title: 'Status codes ALU'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 320
draft: false
---

De ALU gaat dus een arithmetische of logische instructie uitvoeren. Ongeacht de operatie die de ALU moet uitvoeren, zijn er **altijd** twee ingangen. Het is niet mogelijk om de *Silicon* even aan te passen indien er een operatie moet gebeuren die maar 1 operand heeft. De operatie die de ALU moet uitvoeren, wordt in de Hack processor gekozen aan de hand van 3 bits: **ALUop**. De ALU heeft dus, naast **twee 32-bit ingangen** voor de operanden, ook **één 3-bit ingang**. Tenslotte zijn er nog 2 ingangen die aanduiden of de ALU logisch of arithmetisch moet werken; en of de ALU signed of unsigned moet werken.

De ALU zal de bewerking uitvoeren die er gevraagd wordt. Naast het resultaat, geeft de ALU ook nog extra informatie. De extraatjes zijn:

* is het resultaat van de uitgevoerde bewerking gelijk aan 0
* zijn de twee operanden gelijk aan elkaar
* de carry-out waarde van de laatste full adder van de RCA
* is x kleiner dan y, als we uitgaan van *unsigned* getallen
* is x kleiner dan y, als we uitgaan van *signed* getallen

Deze extra informatie worden vlaggen (flags) genoemd. Een andere vaak gebruikte naam hiervoor zijn *status codes*.

{{% figure src="/images/300/ALU_entity.png" title="" %}}