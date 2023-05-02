---
title: 'Ontwikkel omgeving'
chapter: true
weight: 2
draft: false
---

# Ontwikkel omgeving

Naast de "integrated circuits" (in de volksmond ook wel "chips" genoemd :smiley:) die een vaste functionaliteit hebben, bestaan er ook speciale IC's waarvan je de functionaliteit kan aanpassen. De logische poorten (Gates, in het Engels) in die IC's zijn configureerbaar of programmeerbaar (Programmable, in het Engels). Als er zo een groot aantal gates gebundeld worden (in een Array, in het Engels) en deze kunnen ter plaatste (in the Field, in het Engels) geherprogrammeerd worden, noemen we deze IC's **F**ield **P**rogrammable **G**ate **A**rrays, oftewel FPGAs.

De FPGA-markt wordt gedomineerd door 2 grote fabrikanten van FPGA's: [Xilinx](https://www.xilinx.com/) en [Intel](https://www.intel.com/content/www/us/en/products/programmable.html). Beide spelers samen leveren meer dan 85% van alle FPGAs wereldwijd. Het simuleren en programmeren van FPGAs gebeurt in een speciale ontwikkelomgeving: [Quartus](https://fpgasoftware.intel.com/) voor Intel FPGA's en [Vivado](https://www.xilinx.com/support/download.html) (vroeger [ISE](https://www.xilinx.com/products/design-tools/ise-design-suite.html)) voor Xilinx FPGA's.

## Xilinx Vivado

Wij schrijven de HDL-code voor dit opleidingsonderdeel in Vivado. Vivado is de omgeving van Xilinx en wordt gebruik voor de huidige families van FPGAs. Je kan de software downloaden van de site van [Xilinx](https://www.xilinx.com/support/download.html). Je moet wel een (gratis) account aanmaken om de software te kunnen downloaden. Deze software is enkel beschikbaar voor Windows en Linux.

{{% notice warning %}}
Vivado vereist veel opslagruimte om te installeren **>100 GB**.
{{% /notice %}}