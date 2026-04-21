---
title: 'FSM in HW'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 715
draft: false
---

Om een FSM in hardware te implementeren moet onderstaande redenering gemaakt worden. De redening wordt uitgelegd aan de hand van een voorbeeld: verkeerslichten.

{{% multiHcolumn %}}
{{% column %}}
Stel dat het hardware-ontwerp vraag voor de hiernaast afgebeelde FSM. Zolang er geen **halt** gebeurt, volgende volgende toestanden elkaar op: **sGroen**, **sOranje** en **sRood**. In iedere van deze 3 toestanden brandt 1 lamp is juist kleur.

Van zodra een reset signaal optreedt, wordt de cyclus afgehandeld tot aan de red_state. Vervolgens komt de FSM in de **sReset**, waarin de FSM blijft tot de halt wegvalt. In de reset state branden alle lampen.


De eerste stap die genomen moet worden is het <span style="color: #c14f4c; font-weight: bold;">coderen van de toestanden</span>.
{{% /column %}}
{{% column %}}
{{% figure src="/images/700/demo_fsm_v1_states.png" %}}
{{% /column %}}
{{% /multiHcolumn %}}

{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/700/demo_fsm_v1_tt.png" %}}
{{% /column %}}
{{% column %}}
Met de geïntroduceerde codering en de gekende uitgangen van de FSM, kan er een waarheidstabel opgesteld worden.
{{% /column %}}
{{% /multiHcolumn %}}

{{% multiHcolumn %}}

{{% column %}}
Tenslotte moeten er Booleaanse expressies gevonden worden. Dit moet gedaan worden voor iedere uitgang. Daarnaast moet dit ook gebeuren voor elke bit in de toestands-encodering
{{% /column %}}
{{% column %}}
{{% figure src="/images/700/demo_fsm_v1_hw.png" %}}
{{% /column %}}
{{% /multiHcolumn %}}

Samenvattend, kan er besloten worden dat het controle pad gemaakt kan worden met <u> 2 flipflops, 3 NOT, 1 EXOR, 1 NEXOR, 3 and en 2 or-poorten</u>.

<hr/>

Gebruik makend van een andere codering, kan een ander resultaat bekomen worden met dezelfde functionaliteit.

{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/700/demo_fsm_v2_states.png" %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/700/demo_fsm_v2_tt.png" %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/700/demo_fsm_v2_hw.png" %}}
{{% /column %}}
{{% /multiHcolumn %}}

Dit alternatief van het controle pad kan gemaakt worden met <u> 3 flipflops, 2 NOT, 3 and en 2 or-poorten</u>.


### Toestandsencodering

Encoderen van de toestanden in een FSM:

* willekeurig
    * bv. 000, 111, 011, 110, 101
* minimale bitverandering (= Gray encodering)
    * bv. 00, 01, 11, 10
* one-hot
    * bv. 0001, 0010, 0100, 1000
