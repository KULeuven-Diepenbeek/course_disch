---
title: 'Opdracht 3: ALU'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 330
draft: false
---

De ALU die je moet maken voor deze opdracht, ziet er uit zoals hieronder afgebeeld:

{{% multiHcolumn %}}
{{% column %}}

* Ingangen x en y zijn 16 bits; 
* De input status bits zijn:
  * zx (zero x)
  * nx (negate x)
  * zy (zero y)
  * ny (negate y)
  * f (function)
  * no (negate output)
* De output status zijn: 
  * zr (zero)
  * ng (negative).

{{% /column %}}
{{% column %}}
{{% figure src="/images/300/ALU_inputs_outputs.png" title="De ALU met alle in- en uitgangen" %}}
{{% /column %}}
{{% /multiHcolumn %}}


Later worden de input status codes juist gezet op basis van de binnenkomende instructie en worden de output status codes gebruikt.

De opdracht is om zelf een ALU te maken die aan onderstaande waarheidstabel voldoet, met de volgende *entity*.

{{% multiHcolumn %}}
{{% column %}}

{{% figure src="/images/300/screenshot_truth_table_ALU.png" title="" %}}

<div class="image_courtesy">
  Bron: 
   <a href="https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_f0eaab042ba042dcb58f3e08b46bb4d7.pdf" target="_blank">nand2tetris</a>
</div>

<style>
  div.image_courtesy {
    text-align: center;
    font-size: 100%;
    font-style: italic;
  }
</style>

{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/300/alu.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}


{{% notice warning %}}
Een ALU is volledig combinatorisch.
{{% /notice %}}
