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

De controle blok kan <a href="/hdlsrc/500/control.vhd" download>hier</a> gedownload worden. Hieronder vind je een woordje uitleg over de poorten van de controle blok.

| Poort naam | Dimensie en richting | Bron / Doel | Uitleg |
|---|---|---|---|
| inst | 32-bit input | van IMEM | de instructie die uitgevoerd moet worden |
| alu_equal | 1-bit input | van ALU | de vlag die aangeeft dat de twee operanden gelijk zijn |
| alu_x_lt_y_s | 1-bit input | van ALU | de vlag die aangeeft dat de x kleiner is dan y (als er uitgegaan wordt van signed getallen |
| alu_x_lt_y_u | 1-bit input | van ALU | de vlag die aangeeft dat de x kleiner is dan y (als er uitgegaan wordt van unsigned getallen |
| abs_rel_b | 1-bit output | naar PC | controle-signaal dat aanduidt of er absolute ('1') of relatieve sprong ('0') is |
| immediate_four_b | 1-bit output | naar PC | controle-signaal dat aanduidt of de relatieve sprong immediate ('1') of 0x4 ('0') gebruikt als tweede operand |
| immediate | 32-bit output | naar PC en ALU | data die: <ul><li>de grootte van de relatieve sprong immediate aangeeft (PC)</li><li>de tweede operand aanbiedt (ALU) |
| regfile_we | 1-bit output | naar register file | controle-signaal dat de write-enable stuurt van de register file |
| alu_op | 3-bit output | naar ALU | controle-signaal de operatie van de ALU kiest |
| alu_arith_logic_b | 1-bit output | naar ALU | controle-signaal dat het onderscheid maakt tussen een arithmetische ('1') en een logische ('0') operatie |
| alu_signed_unsigned_b | 1-bit output | naar ALU | controle-signaal dat het onderscheid maakt tussen een signed ('1') en een unsigned ('0') operatie |
| second_operand_selector | 1-bit output | naar multiplexer | controle-signaal dat de selectie maakt van de MUX ('1' voor de 32-bit immediate bus ; '0' voor de tweede data uitgang van register file), die de tweede operand bepaalt van de ALU |
