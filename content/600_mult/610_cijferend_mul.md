---
title: 'Cijferend vermenigvuldigen'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 610
draft: false
---

Weet je nog? Cijfer-rekenen op de lagere school? Misschien had je nooit gedacht dat je dit nog ooit nodig had, maar nu zit je hier :wink:.

{{% multiHcolumn %}}
{{% column %}}
![Cijferend vermenigvuldigen](/images/600/mult.png)
<hr/>

![Cijferend vermenigvuldigen gearceerd](/images/600/mult2.png)
{{% /column %}}
{{% column %}}
Voor zij die het zich niet meer helemaal herinneren is hier een snelle opfrissing. De 123 heet de **vermenigvuldiger** en de 45 het het **vermenigvuldigtal**.
Het protocol:

1. begin met het meest linkse karakter van het vermenigvuldigtal (<span style="color: #B85450; font-weight: bold">rood</span>)
0. vermenigvuldig dit, van links naar rechts, met ieder karakter van de de vermendigvuldiger
0. noteer het partiële produkt
0. schuif 1 karakter naar rechts in het vermenigvuldigtal (<span style="color: #6C8EBF; font-weight: bold">blauw</span>)
0. herhaal stap 2.
0. noteer het partiële produkt, maar begin 1 karakter meer naar links
0. herhaal de stappen 4- 6 tot het vermenigvuldigtal helemaal afgehandeld is
0. Tel, tenslotte, alle partiële produkten op
{{% /column %}}
{{% /multiHcolumn %}}

## Waarom moet dit opgefrist worden?

Het doel hiervan is dat er extra functionaliteit toegevoegd dient te worden aan de ALU: **de vermenigvuldiging**. Eerder in deze labo's is er gekeken hoe een optelling uitgevoerd kan worden in hardware. Voor de vermenigvuldiging wordt een gelijkaardig pad gevolgd. Een mogelijke manier om dit te implementeren verschilt namelijk niet veel van de de manuele manier in het voorbeeld hierboven.

{{% multiHcolumn %}}
{{% column %}}
1. begin met de meest linkse **bit** van het vermenigvuldigtal (<span style="color: #B85450; font-weight: bold">rood</span>)
0. vermenigvuldig dit, van links naar rechts, met iedere **bit** van de de vermendigvuldiger
0. noteer het partiële produkt
0. schuif 1 karakter naar rechts in het vermenigvuldigtal (<span style="color: #6C8EBF; font-weight: bold">blauw</span>)
0. herhaal stap 2.
0. noteer het partiële produkt, maar begin 1 karakter meer naar links (ook <span style="color: #D79B00; font-weight: bold">geel</span> en <span style="color: #82B366; font-weight: bold">groen</span> )
0. herhaal de stappen 4- 6 tot het vermenigvuldigtal helemaal afgehandeld is
0. Tel, tenslotte, alle partiële produkten op
{{% /column %}}
{{% column %}}
![Cijferend vermenigvuldigen](/images/600/mult_bin.png)
{{% /column %}}
{{% /multiHcolumn %}}

Enkele opmerkingen die gemaakt kunnen worden:

* merk op dat het *recept* hetzelfde blijft voor binair als met decimaal
* wat is het effect van de breedte van de inputs op de breedte van produkt?
  * een *n-bit* getal <u>plus</u> een *n-bit* getal wordt een *n+1-bit* getal
  * een *n-bit* getal <u>maal</u> een *n-bit* getal wordt een ... *2n-bit* getal
* wat zijn het aantal verschillende uitkomsten die een partieel produkt kan hebben?