---
title: 'SISO'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 431
draft: false
---

## SISO

Bij een serial in, serial out shift register komt de data erin en iedere clock cyclus wordt het 1 plaats verder geshift. Dus in onderstaand voorbeeld komt de data er na 4 clock cycli terug uit.

{{% figure src="/images/400/Shift_register_siso.png" title="SISO shift register" %}}

Er zijn verschillende manier op dit te beschrijven in VHDL. Onderstaande beschrijving is een voorbeeld. Merk hierbij op dat de volgorde dat de buffer beschreven wordt en de toekenning aan de output **irrelevant** zijn. Alles wordt immers tegelijk uitgevoerd in hardware.
{{< include_file "/static/hdlsrc/400/siso.vhd" "vhdl" >}}

{{% notice note %}}

{{% /notice %}}