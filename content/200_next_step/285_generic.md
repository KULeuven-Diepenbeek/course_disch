---
title: 'Generic'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 285
draft: false
---

Sommige studenten hebben misschien al door dat de componenten tot hiertoe niet goed **schaalbaar** zijn. Wat als er nu nood is aan een 6-bit XOR poort? Moeten we dan voor iedere mogelijke breedte een nieuwe component maken? **Nee!** Dit kunnen we oplossen door **generics** te gebruiken. Als voorbeeld hebben we een 8-bit AND poort die generic is en kan schalen.

{{% figure src="/images/200/generic_and.png" title="Generic AND voorstelling"  %}}

Je kan deze AND poort beschrijven met onderstaand code. De variable N wordt gebruikt als het aantal inputs.

{{< include_file "/static/hdlsrc/200/nbit_and.vhd" "vhdl" >}}


{{% notice warning %}}
Voor **integers** wordt er **:=** gebruikt in VHDL.
{{% /notice %}}

Als we dergelijk beschreven AND poort willen gebruiken, kunnen we de **G_WIDTH** waarde aanpassen. In dit voorbeeld wordt de nbit_and component twee maal geïnstantieerd: een keer op 4 en een keer op 91.

{{< include_file "/static/hdlsrc/200/double_and.vhd" "vhdl" >}}