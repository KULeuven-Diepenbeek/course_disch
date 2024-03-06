---
title: 'Opdracht 4: ALU'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 330
draft: false
---

De ALU die je moet maken voor deze opdracht ziet er uit zoals hieronder afgebeeld:

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
  * ng (negativee).

{{% /column %}}
{{% column %}}
![schame nand2tetris ALU](/images/ALU/ALU_inputs_outputs.png)
{{% /column %}}
{{% /multiHcolumn %}}


Later zetten we de input status code juist op basis van de binnenkomende instructie en optioneel doen we iets met de output status codes.


De opdracht is om zelf een ALU te maken die aan onderstaande waarheidstabel voldoet.

![waarheidstabel ALU](/images/ALU/screenshot_truth_table_ALU.png)
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


{{% notice warning %}}
Een ALU is volledig combinatorisch.
{{% /notice %}}
