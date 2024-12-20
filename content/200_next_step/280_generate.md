---
title: 'Generate'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 280
draft: false
---

Een generate is handig als je vaak VHDL-code moet herhalen. Meestal kan je dan een generate statement gebruiken om te voorkomen dat je te veel moet kopiëren en plakken.

De generate gaat in dit voorbeeld van 0 tot 6 omdat 6+1 al 7 is, wat het laatste element van de array is.

{{< include_file "/static/hdlsrc/200/generate_example.vhd" "vhdl" >}}

{{% figure src="/images/200/screenshot_generate.png" title="Schematische voorstelling"  %}}

{{% notice note %}}
Vivado kan een schematische voorstelling maken van de hardware beschrijving met RTL analysis elaborate design.
{{% /notice %}}