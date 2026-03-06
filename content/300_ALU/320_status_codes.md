---
title: 'Status codes ALU'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 320
draft: false
---

De ALU gaat dus een arithmetische of logische instructie uitvoeren. Ongeacht de operatie die de ALU moet uitvoeren, zijn er **altijd** twee ingangen. De operatie die uitgevoerd moet worden, wordt aangeduid aan de hand van 3 bits: **ALUop**. De ALU heeft dus, naast **twee 32-bit ingangen** voor de operanden, ook **één 3-bit ingang**. Tenslotte zijn er nog 2 ingangen die aanduiden of de ALU logisch of arithmetisch moet werken; en of de ALU signed of unsigned moet werken.

* **arith_logic_b** wordt in rekening gebracht bij ALUOp="111". Bij een wiskundige operatie ('1') gebeurt de shift-right-operatie **mét** tekenbehoud, bij een logische operatie ('0') gebeurt de shift-right-operatie **zonder** tekenbehoud.
* **signed_unsigned_b** wordt in rekening gebracht bij ALUOp="011". Bij een signed operatie ('1') worden de waardes van x en y geïnterpreteerd als **two's complement** notatie, bij een unsigned operatie ('0') worden de waardes als natuurlijke getallen geïnterpreteerd.

De ALU zal de bewerking uitvoeren die er gevraagd wordt. Naast het resultaat, geeft de ALU ook nog extra informatie. De "extraatjes" zijn:

* is het resultaat gelijk aan 0
* zijn de twee operanden gelijk aan elkaar
* de carry out bit van de RCA (ook wel de *Overflow-bit* genoemd)
* is x kleiner dan y, als we uitgaan van *unsigned* getallen
* is x kleiner dan y, als we uitgaan van *signed* getallen


Deze extra informatie worden vlaggen (flags) genoemd. Een andere vaak gebruikte naam hiervoor zijn *status codes*.

{{% figure src="/images/300/ALU_entity.png" title="" %}}