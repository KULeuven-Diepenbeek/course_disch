---
title: 'Latches'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 457
draft: false
---

<!-- { signal: 
    [
      {name: "Clock",           wave: '0h.l.h.l.h.l.h.l.h.l.h.l.' },
      {name: 'Input',           wave: '1...0...1.......0.1......' },
      {name: 'Output (register)',          wave: 'x1...0...1.......0...1...' },    
      {name: 'Output (latch)',          wave: 'x1...0...1.......0.1.....' },    
    ]
} -->

Naast een **register** is het ook mogelijk om een **latch** te hebben. Allebei hebben ze een **geheugenwerking** en werken ze **ten opzichte van een clock**. Toch is er een belangrijk verschil.

{{% figure src="/images/400/wavedrom_reg_vs_latch.png" title="Register vs Latch" %}}

{{% multiHcolumn %}}
{{% column %}}
Een **register** zal op een stijgende (of dalende) **klokflank** een sample nemen van de input.
{{% /column %}}
{{% column %}}
Een **latch** zal tijdens de positieve (of negatieve) **halve klok periode** een sample nemen van de input.
{{% /column %}}
{{% /multiHcolumn %}}

Alhoewel een latch wel de bedoeling kan zijn bij het design van een ASIC, bij het design voor een FPGA zijn Latches **absoluut te vermijden**. De tools kunnen heel slecht om (timing gewijs) met latches en meestal zijn ze ook niet gewenst. 

## Onbedoelde latches

Helaas zijn er een aantal constructies waarbij er een latch gemaakt wordt zonder dat de designer dit wenst. 

{{% multiHcolumn %}}
{{% column %}}
Deze VHDL code probeert een beschrijving te geven van een multiplexer.

De sensitivy list is echter niet compleet. Als de input **rotate_right** verandert, wordt de output (transformed) echter niet aangepast.
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/mux_latch_1.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}


{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/mux_latch_2.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
Deze VHDL code probeert een beschrijving te geven van een multiplexer.

De sensitivy list is correct, maar **niet alle** keuze opties zijn beschreven.

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice note %}}
Wat ontbreekt?
{{% /notice %}}

{{% /column %}}
{{% /multiHcolumn %}}


{{% multiHcolumn %}}
{{% column %}}
In dit voorbeeld is de sensitivy list volledig **en** zijn alle opties van result(0) gecovered. 

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice note %}}
Wat is de waarde van **even** in het geval dat result(0) 1 is?
{{% /notice %}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/even_odd.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}


<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice warning %}}
Even voor de zekerheid ... **latches moeten vermeden worden bij FPGA design**
{{% /notice %}}