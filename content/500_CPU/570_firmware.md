---
title: 'Opdracht - firmware'
chapter: false
weight: 570
pre: "<i class='fas fa-book'></i> "
draft: false
---

Ten slotte zijn hier nog enkele voorbeelden waarmee het **instructie geheugen** geïnitialiseerd kan worden. Let er op dat je de **generic map** zo aanpast dat de simulator een geldig pad heeft naar deze files op jouw computer/laptop.



Het is een goed idee om, net zoals bij de ALU, eerst enkele specifieke instructies te testen. Bijvoorbeeld: 
{{% multiHcolumn %}}
{{% column %}}
* Laad de waarde 314 in register A
  * Het is een A-instructie: **0**&#45;&#45;&#45; &#45;&#45;&#45;&#45; &#45;&#45;&#45;&#45; &#45;&#45;&#45;&#45;
  * 314, binair genoteerd met 15 digits is: 
    * <i>(000 000)</i>1 0011 1010
  * Machine code: 0000 0001 0011 1010
    * of **0x013A** in hex
* Stel D gelijk aan A
  * Het is een C-instructie: **111**&#45; &#45;&#45;&#45;&#45; &#45;&#45;&#45;&#45; &#45;&#45;&#45;&#45;
  * De compute doet ```D=A``` 
    * de *a-bit* is **0**
    * de *c-bits* zijn **110000**
  * De destination is ```D```
    * de *d-bits* zijn **010**
  * Er is géén jump nodig
    * de *j-bits* zijn **000**
  * Machine code: 111 0 110000 010 000
    * of **0xEC10** in hex
{{% /column %}}
{{% column %}}
Een simpel programmaatje kan zijn:
* instructie 1: ```A = 314 ``` (**0x013A**)
* instructie 2: ```D = A ``` (**0xEC10**)
* instructie 3: ```A = 6 ``` (**0x0006**)
* instructie 4: ```D = D+A ``` (**0xE090**) 111 0 000010 010 000
* instructie 5: ```A = 4```  (**0x0004**)
  * A wordt geladen omdat dit in de volgende instructie gebruikt wordt
* instructie 6: ```Mem[A] = D``` (**0xFC08**) 111 1 110000 001 000
* instructie 7: ```A = 0 ``` (**0x0000**)
  * A wordt geladen omdat dit in de volgende instructie gebruikt wordt
* instructie 8: ```0; JMP``` (**0xEA87**) 111 0 101010 000 111
{{% /column %}}
{{% /multiHcolumn %}}

Als een degelijk klein programmaatje werkt, kan je proberen om een iets complexer stukje software te runnen.

{{% notice tip %}}
Er bestaan websites, zoals [deze](https://alienkevin.github.io/hack-assembler-web/) die hulp kunnen bieden bij het *assembleren*.
{{% /notice %}}

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/500/fibonaci.asm" "asm" >}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/500/fibonaci.hack" "bin" >}}
{{% /column %}}
{{% /multiHcolumn %}}
