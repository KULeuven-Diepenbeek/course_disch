---
title: 'Reset'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 440
draft: false
---

Typisch is het gewenst om een **reset** ingang te hebben om alles terug naar een **gekende begintoestand** te brengen. Er zijn typisch 2 manieren om dit te doen, een **synchrone** reset of een **asynchrone** reset.


<div class="multicolumn">
    <div class="column">

<h2>Asynchrone reset </h2>
Onderstaand voorbeeld is van een D flip-flop met asynchrone reset. Je ziet hier dat de reset onderdeel is van de sensitivity list. De reset staat hier als eerste in het process.      
    </div>
    <div class="column">

<h2>Synchrone reset </h2>
Onderstaand voorbeeld is van een D flip-flop met synchrone reset. Je ziet hier dat de reset <b>geen</b> onderdeel is van de sensitivity list. De reset staat hier na de if van de stijgende flank van de clock.   
    </div>
</div>

{{< multiHcolumn >}}
{{< column >}}
{{< include_file "/static/hdlsrc/400/asynchronous_reset.vhd" "vhdl" >}}
{{< /column >}}
{{< column >}}
{{< include_file "/static/hdlsrc/400/synchronous_reset.vhd" "vhdl" >}}
{{< /column >}}
{{< /multiHcolumn >}}
  

{{% notice warning %}}
Voor sequentiële processen zijn er maximaal 2 signalen (clock en eventueel reset) die in de sensitivity list staan. Bij combinatorische processen zijn het alle signalen.
{{% /notice %}}
<br/>
<br/>
![ff_withreset.png](/images/wavedrom/ff_withreset.png)