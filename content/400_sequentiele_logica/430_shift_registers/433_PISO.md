---
title: 'PISO'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 433
draft: false
---

Een parallel in, serial out shift register wordt gebruikt als er parallelle data is en dit serieel gebruikt moet worden. Hier hebben we wel een load signal nodig om de data in te laden en multiplexer om te zorgen dat de data ook in de flip-flops kan geraken.

{{% figure src="/images/400/Shift_register_piso.png" title="PISO shift register"  %}}

{{< include_file "/static/hdlsrc/400/piso.vhd" "vhdl" >}}

{{% notice note %}}
Ter herinnering:</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'U' Uninitialized</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'X' Forcing Unknown</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '0' Forcing 0</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '1' Forcing 1</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'Z' High Impedance</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'W' Weak Unknown</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'L' Weak 0</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'H' Weak 1</br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '-' Don't Care</br>
{{% /notice %}}