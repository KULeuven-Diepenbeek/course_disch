---
title: 'Alternatieve omgeving'
chapter: true
weight: 2
draft: false
---

## Alternatief voor thuis

Als het niet mogellijk is om Vivado te installaren op je eigen laptop, dan kan je de site [EDA playground](https://www.edaplayground.com/) om toch thuis verder te kunnen werken.
Je kan hierop inloggen met je Google account (van  UHasselt). Zorg dat je bij testbench + design VHDL hebt geselecteerd. Nu kan je de code in de testbench (links) en het design (rechts) zetten. Als de code er in zit moet je ook de top entity van het design aangeven, deze naam moet je bij **Top entity** invulllen. Bij **tools & simulators** selecteren we **GHDL**. GHDL is een gratis simulator die niet zelf detecteert wanneer de code stopt dus bij de **simulator options** moet je nog zetten  **--stop-time=50ns** om aan te geven hoe lang er gesimuleerd moet worden. Als laatste moeten we nog aanvinken dat we de EPWave willen openen na de run. De eind tijd van stop-time moet je natuurlijk aanpassen als je langer wil simuleren.

Om de simulatie te starten druk je vanboven op de **run** knop.

#### screenshot hoe een nand gate simuleren met EDA playground

![Screenshot Vivado](/images/intro/eda_playground.png)