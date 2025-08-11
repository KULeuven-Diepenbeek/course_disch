---
title: 'Opdracht 5: Processor'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 540
draft: false
---

Voor deze opdracht is het de bedoeling om zelf de **processor** te maken. Je mag, maar dit is niet verplicht, eerder gebruikte code (voor ALU, program counter, ...) hergebruiken.

{{% multiHcolumn %}}
{{% column %}}
![RISC-V](/images/500/processor_blockdiagram_v3.png)
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/500/entity.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

De controle blok kan <a href="/hdlsrc/500/control.vhd" download>hier</a> gedownload worden.