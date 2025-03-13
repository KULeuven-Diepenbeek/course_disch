---
title: 'Reset'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 440
draft: false
---

Bij het maken van een hardware ontwerp dat registers bevat, is het noodzakelijk om de *begintoestand* te kennen: wat is de initiele waarde? De tekstboek manier om dit te bekomen is door gebruik te maken van een **reset** signaal. Het *actief* worden van dit signaal zorgt ervoor dat de hele schakeling in een  **gekende begintoestand** komt. Er zijn typisch 2 manieren om dit te doen: met een **synchrone** reset of met een **asynchrone** reset.


{{% multiHcolumn %}}
{{% column %}}
<h2>Asynchrone reset </h2>
Onderstaand voorbeeld is van een D flip-flop met asynchrone reset. Je ziet hier dat de reset onderdeel is van de sensitivity list. De reset staat hier als eerste in het process, maar die volgorde is echter niet van belang.
{{% /column %}}
{{% column %}}
## Synchrone reset
Onderstaand voorbeeld is van een D flip-flop met synchrone reset. Je ziet hier dat de reset <b>geen</b> onderdeel is van de sensitivity list. De reset staat hier na de if van de stijgende flank van de clock.   
{{% /column %}}
{{% /multiHcolumn %}}



{{< multiHcolumn >}}
{{< column >}}
{{< include_file "/static/hdlsrc/400/asynchronous_reset.vhd" "vhdl" >}}
{{< /column >}}
{{< column >}}
{{< include_file "/static/hdlsrc/400/synchronous_reset.vhd" "vhdl" >}}
{{< /column >}}
{{< /multiHcolumn >}}

<!-- { signal: [
    {name: "Clock",           wave: '0h.l.h.l.h.l.h.l.h.l.' },
    {name: 'Input',           wave: '1.......0...1........' },
    {name: 'Output (w.o. reset)', wave: 'x1.......0...1.......' },      
    {},
    {name: 'Reset',        wave: '0...1...0.....10.....',  node: '....X.........Y' },
    {name: 'Output (sync reset)',       wave: 'x1...0.......1.......', node: '.....C' },
    {name: 'Output (async reset)',       wave: 'x1..0........10..1...', node: '....D.........E.' }],
  
  edge: [
    'X~>C', 'X->D',
    'Y~>E'
  ]
} 
-->
![ff_withreset.png](/images/400/ff_withreset.png)

Welke reset gebruik je nu best? Dat hangt af van de toepassing. De tabel hieronder vergelijkt enkele belangrijkte criteria.

| | Asynchrone reset | Synchrone reset |
|---|---|---|
| Voorspelbaarheid | <div style="color: #AF0000">Kan op ieder moment komen, dus ook dicht bij klokflanken.</div> | <div style="color: #00AF00">Voorspelbaar (bv. bij een stijgende klokflank)</div> |
| Glitches ... | <div style="color: #AF0000">kunnen een catastrofaal effect hebben omdat ze vals-positief kunnen geven.</div> | <div style="color: #00AF00">worden (tot op zeker hoogte) opgevangen</div> |
| Timing ... | <div style="color: #00AF00">is gemakklijker om te halen aangezien de reset niet meegenomen wordt in de timing-analyse.</div> |<div style="color: #AF0000">is moeilijker om te behalen want de reset signalen kunnen een hoge fan-out hebben.</div> | 
| De afwezigheid van de klok ... | <div style="color: #00AF00">heeft géén impact.</div> |<div style="color: #AF0000">zorgt dat een reset niet gezien wordt.</div> | 


{{% notice tip %}}
De vuistregel voor (beginnende) hardware designers is om een <u>asynchrone reset</u> **ENKEL** te gebruiken waar het niet anders kan (bv. bij IP blokken van third-parties), maar waar mogelijk (en zeker voor FPGA ontwerp) wordt aangeraden om een <u>**synchrone reset**</u> te gebruiken.
{{% /notice %}}



{{% notice warning %}}
Voor **sequentiële** processen zijn er maximaal 2 signalen (clock en eventueel reset) die in de sensitivity list staan. Bij **combinatorische** processen zijn het alle ingangs-signalen.
{{% /notice %}}
<br/>
<br/>



  