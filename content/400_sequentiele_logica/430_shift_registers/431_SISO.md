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

Er zijn verschillende manieren op dit te beschrijven in VHDL. Onderstaande beschrijvingen zijn 2 voorbeelden. Merk hierbij op dat de volgorde dat de buffer beschreven wordt en de toekenning aan de output **irrelevant** zijn. Alles wordt immers tegelijk uitgevoerd in hardware.

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/siso.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/siso_v2.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}


{{% notice note %}}
In deze voorbeelden is er geen **Y_i** signaal. De uitgang **Y** wordt aangedreven door een signal **buf** of **buffer_output**. Het is niet nodig om hier nog een signal aan toe te voegen, maar dat mág altijd.
{{% /notice %}}