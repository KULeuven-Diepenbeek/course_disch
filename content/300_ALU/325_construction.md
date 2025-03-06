---
title: 'ALU Design'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 325
---

Het design van de 16-bit ALU wordt hier stap-per-stap toegelicht. Voor de logische operaties wordt alles gebouwd rond de **AND-gate**. Voor de aritmetische operaties wordt alles gebouwd rond de **ripple-carry adder**. 

### X and Y
{{% multiHcolumn %}}
{{% column %}}
Dit is voor de hand liggend.

* f(x,y) = x **and** y
{{% /column %}}
{{% column %}}
{{% figure src="/images/300/ALUdesign_1.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}

### X or Y
{{% multiHcolumn %}}
{{% column %}}

Door gebruik te maken van de wetten van De Morgan, kan een **OR-gate** gebouwd worden met de AND-gate.

{{% multiHcolumn %}}
{{% column %}}
![De_Morgan](/images/300/demorgan.png)
{{% /column %}}
{{% column %}}
Als beide inputs, A en B, geïnverteerd worden, geeft de logische AND-gate een geïnverteerde OR-gate.
{{% /column %}}
{{% /multiHcolumn %}}

* f(x,y) = <span class=overline_l2><span class=overline>x</span> **and** <span class=overline>y</span></span>

{{% /column %}}
{{% column %}}
{{% figure src="/images/300/ALUdesign_2.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}


### X, Y, !X, !Y
{{% multiHcolumn %}}
{{% column %}}
Om de uitgang op één van de waardes aan de ingang te zetten, zijn er twee opties: <br/>Z = X **or** 0x0000, of Z = X **and** 0xFFFF.<br/>In beide gevallen gaat er een mogelijkheid moeten zijn om een *vaste* input te kiezen.

Aangezien er reeds een mogelijkheid is om de ingangen te inverteren, gaat deze aanpassing ook de mogelijkheid bieden om de uitgang op de geïnverteerde waarde van één van de waardes aan de ingang te zetten.

{{% multiHcolumn %}}
{{% column %}}
* f(x,y) = x = x **and** <span class=overline>0x0</span>
* f(x,y) = y = <span class=overline>0x0</span> **and** y
{{% /column %}}
{{% column %}}
* f(x,y) = <span class=overline>x</span> = <span class=overline_l2>x **and** <span class=overline>0x0</span></span>
* f(x,y) = <span class=overline>y</span> = <span class=overline_l2> <span class=overline>0x0</span> **and** y</span> 
{{% /column %}}
{{% /multiHcolumn %}}


{{% /column %}}
{{% column %}}
{{% figure src="/images/300/ALUdesign_3.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}

### X + Y
{{% multiHcolumn %}}
{{% column %}}
Dit is voor de hand liggend.

* f(x,y) = x **+** y
{{% /column %}}
{{% column %}}
{{% figure src="/images/300/ALUdesign_4.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}

### X - Y, Y - X
{{% multiHcolumn %}}
{{% column %}}

Om x-y te berekenen, zou het mooi zijn als de weergegeven architectuur zou passen. **#spoiler:** dat kan :smiley: De belangrijkste regel die hiervoor gebuikt wordt is -y =  <span class=overline>y</span> +1

* x+<span class=overline>y</span> = x + (-y-1) = x - (y+1)

Indien de uitgang nu geïnverteerd wordt, wilt dat **opnieuw** zeggen dat de waarde negatief en met 1 verminderd wordt.

* <span class="overline_l2">x+<span class=overline>y</span></span> = -1 * [ x - (y+1) ] -1 = -x + (y+1) -1 = -x + y = y - x

Uiteraard kunnen x en y omgewisseld worden. Dit geeft volgende opties:

* f(x,y) = x **-** y
* f(x,y) = y **-** x

{{% /column %}}
{{% column %}}
{{% figure src="/images/300/ALUdesign_5.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}


### -X, -Y, 0, X-1, Y-1, -1, 1, X+1, Y+1
{{% multiHcolumn %}}
{{% column %}}
Als de waarde van het *positieve getal* in van de aftrekking op 0x0 gezet wordt, kan de negatieve waarde van het andere getal berekend worden.

Beide waardes op 0x0 zetten, zal er uiteraard voor zorgen dat de som 0x0 blijft.

Indien x verminderd wordt met <span class="overline">0x0</span>, wordt er van de waarde van x eigenlijk 1 afgetrokken.

Deze vermindering met 1 doen op de waarde 0x0, geeft altijd -1.

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice note %}}
Je kan zelf verifiëren dat <span class="overline">-1 + (-1)</span> altijd 1 geeft.
{{% /notice %}}

Tenslotte kan <span class="overline">x</span> + <span class="overline">0</span> = (-x-1)+(-1) = (-x-2), ook geïnverteerd worden wat resulteert in <span class="overline">-x-2</span> = -(-x-2) -1 = x+2-1 = x+1.

* f(x,y) = **-** y
* f(x,y) = **-** x
* f(x,y) = **0**
* f(x,y) = x **-** 1
* f(x,y) = y **-** 1
* f(x,y) = **-1**
* f(x,y) = **1**
* f(x,y) = x **+** 1
* f(x,y) = y **+** 1

{{% /column %}}
{{% column %}}
{{% figure src="/images/300/ALUdesign_6.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}


## ALU design

Hoog tijd om de vruchten te plukken van het design werk. Alle 18 operaties die vermeld staan aan het begin van dit hoofdstuk, kunnen gemaakt worden met de hierboven beschreven methode. Het uiteindelijke design van de ALU is hieronder weergegeven.

{{% figure src="/images/300/ALUdesign_7.png" title="" %}}

De benodigheden zijn dus:

* **16x** zes 2-naar-1 multiplexer
* **16x** 3 invertor
* **1x** 16-bit AND-gate
* **1x** 16-bit ripple-carry adder