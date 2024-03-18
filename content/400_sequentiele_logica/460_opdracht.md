---
title: 'Opdracht 3: Program counter'
chapter: false
weight: 460
pre: "<i class='fas fa-pen-square'></i> "
draft: false
---

## program counter
De bedoeling van deze opdracht is om de program counter van de processor te maken. De program counter heeft 5 input signalen. **data_in, clock, reset, load en inc (increment)**. Als output heeft het data_out. Data_in en Data_out zijn beide 16 bit vectoren. Als de reset hoog wordt moet de program counter **synchroon resetten** naar 0. **load** zorgt er voor dat, ook weer **synchroon**, de **data** van data_in wordt **ingeladen**. **Load heeft voorrang op increment**.

De program counter moet aan onderandere aan onderstaande specificaties voldoen:

* Als reset, load en inc 0 zijn blijft de uitgang zijn waarde **bewaren**
* Als **reset** 1 is wordt er **synchroon gereset**
* Als **load** 1 wordt de **data_in ingeladen** en op data_out gezet op de stijgende flank van de klok
* Als **increment** 1 is dan wordt er iedere klok cyclus bij de uitgang **1 opgeteld**
* De **reset** heeft altijd **voorang op alles**

{{% notice note %}}
Je kan de **ripple carry adder van opdracht 2** gebruiken als je die aanpast!
{{% /notice %}}

{{% figure src="/images/program_counter.png" title="schema program counter"  %}}