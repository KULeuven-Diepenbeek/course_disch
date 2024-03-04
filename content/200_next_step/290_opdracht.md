---
title: 'Opdracht 2: Ripple carry adder'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 290
draft: false
---

In deze opdracht moet je een **16 bit ripple-carry adder** te maken. Indien je vergeten bent hoe een full adder en een half adder eruit zien, kan je kijken naar onderstaande schema's. Bij een ripple-carry adder wordt de C out van de eerste adder doorgegeven aan de tweede adder. We werken in little endian.

Het is **niet** de bedoeling dat je de + operator gebruikt van "std_logic_unsigned"  of "std_logic_signed"!


{{% figure src="/images/half_adder.png" title="Half adder, met S = A &oplus; B"  %}}
{{% figure src="/images/full_adder.png" title="Full adder"  %}}
<!-- {{% figure src="/images/ripple_carry_adder.png" title="ripple carry adder"  %}} -->

{{% notice warning %}}
Het is altijd een goed idee om eerst een tekening te maken voordat je begint met typen.
{{% /notice %}}

## Testbench

Hieronder staat een voorbeeld van een testbench. Vaak is het interesant om enkele specifieke stimuli te hebben tijdens de ontwikkeling. Indien het mogelijk is (zoals hier het geval is), is het ook een optie om simpelweg ALLE opties te verifiëren. Omdat dergelijk bestand nogal groot wordt, is hieronder een verkorte versie weergegeven. De volledige testbench kan [hier](/hdlsrc/rca_tb.vhd) gedownload worden.

{{< include_file "/static/hdlsrc/200/rca_tb.vhd" "vhdl" >}}
