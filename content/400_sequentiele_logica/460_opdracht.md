---
title: 'Opdracht 4: Program counter'
chapter: false
weight: 460
pre: "<i class='fas fa-pen-square'></i> "
draft: false
---

De bedoeling van deze opdracht is om de **program counter** van de processor te maken. De program counter heeft 5 input signalen. **data_in, clock, reset, load en inc(rement)**. Als output heeft het data_out. Data_in en Data_out zijn beide 16-bit vectoren. Als de reset hoog wordt moet de program counter **synchroon resetten** naar 0x0. **inc** zorgt dat de program counter met 1 verhoogd wordt en **load** zorgt er voor dat de **data** van data_in **synchroon** wordt **ingeladen**. **Load heeft voorrang op increment**.

De program counter moet aan onderandere aan onderstaande specificaties voldoen:

* Als **reset** 1 is wordt er **synchroon gereset**
* Als reset, load en inc 0 zijn blijft de uitgang zijn waarde **bewaren**
* Als **increment** 1 is dan wordt bij de program counter **1 opgeteld**
* Als **load** 1 wordt de **gesampled**
* De **load** heeft voorang op **inc**

{{% notice note %}}
Je kan de **ripple carry adder van opdracht 2** gebruiken.
{{% /notice %}}

{{% figure src="/images/program_counter.png" title="schema program counter"  %}}