---
title: 'ALU Design'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 325
---

Voordat er begonnen kan worden aan de beschrijving van de ALU, moet eerst het hardware ontwerp gemaakt worden.
{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/300/ALUdesign.png" title="" %}}
{{% /column %}}
{{% column %}}
In wezen gebeurt hier niets spectaculairs. Alle mogelijks gevraagde bewerkingen worden allemaal berekend. Met behulp van een multiplexer wordt het gewenste resultaat uitgefilterd aan de uitgang aangelegd.

De basis-logische poorten, <span style="background-color: #d5e8d4">gearceerd in groen</span>, zijn reeds besproken in het eerste hoofdstuk.

De ripple-carry adders voor het berekenen van de som en het verschil, <span style="background-color: #fff2cc">gearceerd in geel</span>, zijn het resultaat van de opdracht van hoofdstuk 2.

De *vergelijkers* (of comparatoren), <span style="background-color: #f8cecc">gearceerd in rood</span>, kunnen beschreven worden aan de hand van een demultiplexer zoals die gezien is in hoofdstuk 2.
{{% /column %}}
{{% /multiHcolumn %}}

### Shifting

Voor het *shiften* kan een extra woordje uitleg misschien wel helpen. Vaak kan het een hulp zijn om <u>*"er een tekeningetje bij te maken"*</u>. Neem, bijvoorbeeld, een shift-left-3 operatie.
{{% multiHcolumn %}}
{{% column %}}
Het gewenste resultaat is dat **my_vector** verschoven wordt met 3 plaatsen. De waarde die ingeschoven moet worden is '0'. Er zijn verschillende manieren om dit te beschrijven.

**Expliciet**
{{< include_file "/static/hdlsrc/300/shift_1.vhd" "vhdl" >}}

**One-liner**
{{< include_file "/static/hdlsrc/300/shift_2.vhd" "vhdl" >}}

**Generisch**
{{< include_file "/static/hdlsrc/300/shift_3.vhd" "vhdl" >}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/300/ALU_shift.png" title="" %}}
{{% /column %}}
{{% /multiHcolumn %}}

Indien het gewenste resultaat is dat **my_vector** verschoven wordt met 3 plaatsen naar rechts, met behoud van het teken; dan dient de *sign-bit* gekopieerd en ingeschoven te worden. Hiervoor kan een nieuwe vector gemaakt worden die volledige bestaat uit *kopies* van de tekenbit.

{{< include_file "/static/hdlsrc/300/shift_4.vhd" "vhdl" >}}

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice tip %}}
Merk op dat bovenstaande beschrijving uitgaat van een declaratie (x downto y). Indien je liever werkt met (x to y), moet je de indices aanpassen.
{{% /notice %}}

De beschrijvingen hierboven leiden tot het correct berekenen van het gewenste resultaat. Dit wordt **het datapad** genoemd. Het deel van het ontwerp dat ervoor zorgt dat de juiste uitkomsten verschijnen en alle *controle* signalen juist staan, heet **het controlepad**.

### Controle pad

| ALUop | Resultaat |
|---|---|
|000| x & y |
|001| x &#124; y |
|010| x ^ y |
|011| x &lt; y ? 1 : 0 (signed) | signed_unsigned_b_o <= '1';
|011| x &lt; y ? 1 : 0 (unsigned) | signed_unsigned_b_o <= '0';
|100| x + y |
|101| x - y |
|110| x &lt;&lt; y|
|111| x &gt;&gt; y (met tekenbehoud)| arith_logic_b_o <= '1';    
|111| x &gt;&gt; y (zonder tekenbehoud)| arith_logic_b_o <= '0';


