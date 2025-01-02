---
title: 'Intro Sequentiële logica'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 410
draft: false
---

Zoals er eerder al aangehaald worden alle componenten **tegelijkertijd** uitgevoerd. Net zoals op een breadboard, zijn alle componenten en poorten gelijktijdig actief. Wanneer het ontwerp complexer wordt, is het bijna onmogelijk om iets realiseren als er geen *orde* of *volgorde* is. Hiervoor is het **klok-signaal** ontstaan. Dit signaal speelt een soortgelijke rol zoals die van een dirigent bij een concert.

{{% multiHcolumn %}}

{{% column %}}
Als we bij combinatorische logica de ingang veranderen, duurt het een zekere tijd voordat dat de uitgang (mogelijks) verandert. Bij sequentiële logica gaan we wachten met de ingang in te lezen tot de stijgende flank van de clock. Als de timings van het design goed zijn dan is de ingang van een systeem altijd stabiel op het moment dat er een stijgende flank van een clock is.

We gaan beginnen met een simpele <strong>D flip-flop</strong> te maken. Het enige dat deze flip-flop doet is de ingang <i>onthouden</i> op de uitgang tot de volgende stijgende flank van de clock.
{{% /column %}}

{{% column %}}
  {{% figure src="/images/400/D_flipflop.png" title="Symbool van een D-flipflop"  %}}<br/>
  <!-- { signal: 
    [
      {name: "Clock",  wave: '0h.l.h.l.h.l.h.l.h' },
      {name: 'Input',  wave: '1.......0....1....' },
      {name: 'Output', wave: 'x1.......0.....1..' },
]} -->

{{% /column %}}

{{% /multiHcolumn %}}

{{% figure src="/images/400/ff.png" title="Timing van een  D-flipflop"  %}}
<!-- { signal: 
    [
      {name: "Clock",           wave: '0h.l.h.l.h.l.h.l.h.l.h.l.' },
      {name: 'Input',           wave: '1...0...1.......0.1......' },
      {name: 'Output', wave: 'x1...0...1.......0...1...' },    
    ]
} -->


Onderstaande vhdl code is een voorbeeld van een flip-flop. Het is hier belangrijk om te zien dat bij het process alleen de clock in de sensitivity list zit. Ook al zou jouw buikgevoel zeggen *"Jamaar, als de input wijzigt moet ook de inhoud van de flipflop wijzigen!!"* ... toch is dit géén reden om die input in de sensitivity list te zetten. **Het enige moment dat er gesampled mag worden, is als de dirigent het zegt.** In dit geval is dat op de *rising edge* van de het kloksignaal.

{{< include_file "/static/hdlsrc/400/d_flipflop.vhd" "vhdl" >}}

Een alternatief voor ```if clock_i'event and clock_i = '1' then``` is ```if rising_edge(clock_i) then```.