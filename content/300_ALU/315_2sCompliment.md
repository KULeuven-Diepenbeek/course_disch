---
title: "2's Compliment"
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 315
draft: false
---

## &#8469;

Gezien je voor een ingenieurs-richting gekozen hebt, gaan we er van uit dat je geen schrik hebt van binaire getallen. Hopelijk zie je dat **0b1010** hetzelfde is als **0xA**, of <b><i>tien</i></b> zoals men in de volksmond zegt. Hieronder vind je nog een overzichtstabel voor de eerste 16 **natuurlijke** getallen.

<table>
<tr><th>Dec</th><th>Bin</th><th>Hex</th><th>Dec</th><th>Bin</th><th>Hex</th><th>Dec</th><th>Bin</th><th>Hex</th><th>Dec</th><th>Bin</th><th>Hex</th></tr>
<tr>
    <th>0</th><td>0b0</td><td>0x0</td>
    <th>4</th><td>0b100</td><td>0x4</td>
    <th>8</th><td>0b1000</td><td>0x8</td>
    <th>12</th><td>0b1100</td><td>0xC</td>
</tr>
<tr>
    <th>1</th><td>0b1</td><td>0x1</td>
    <th>5</th><td>0b101</td><td>0x5</td>
    <th>9</th><td>0b1001</td><td>0x9</td>
    <th>13</th><td>0b1101</td><td>0xD</td>
</tr>
<tr>
    <th>2</th><td>0b10</td><td>0x2</td>
    <th>6</th><td>0b110</td><td>0x6</td>
    <th>10</th><td>0b1010</td><td>0xA</td>
    <th>14</th><td>0b1110</td><td>0xE</td>
</tr>
<tr>
    <th>3</th><td>0b11</td><td>0x3</td>
    <th>7</th><td>0b111</td><td>0x7</td>
    <th>11</th><td>0b1011</td><td>0xB</td>
    <th>15</th><td>0b1111</td><td>0xF</td>
</tr>
</table>

Merk op dat alle 16 mogelijkheden binair te vervatten zijn in 4 tekens (=digits). In het geval dat de voorstelling korter is dan 4 digits, kunnen we altijd 0-en toevegen **aan de linkerkant**.

## &#8484;
Stel dat we de verzameling van natuurlijke getallen willen uitbreiden naar de **gehele** getallen, hebben we ook negatieve getallen nodig. De meest gebruikte manier om negatieve getallen weer te geven is met behulp van **2's compliment**. De conversie naar 2's complement kan bekomen worden door <u>de binaire voorstelling te inverteren en dan 1 bit op te tellen</u>. Merk op dat de terugomzetting van 2's complement bekomen kan worden met **dezelfde** conversietechiek. 

<table>
    <tr><th>Decimaal</th><th>Binair</th><td>&nbsp;</td><th>Decimaal</th><th>Binair</th></tr>
    <tr><th>1</th><td>0b0001</td><td>&nbsp;</tb><th>-1</th><td>0b1111</td></tr>
    <tr><th>2</th><td>0b0010</td><td>&nbsp;</tb><th>-2</th><td>0b1110</td></tr>
    <tr><th>3</th><td>0b0011</td><td>&nbsp;</tb><th>-3</th><td>0b1101</td></tr>
    <tr><th>4</th><td>0b0100</td><td>&nbsp;</tb><th>-4</th><td>0b1100</td></tr>
    <tr><th>5</th><td>0b0101</td><td>&nbsp;</tb><th>-5</th><td>0b1011</td></tr>
    <tr><th>6</th><td>0b0110</td><td>&nbsp;</tb><th>-6</th><td>0b1010</td></tr>
    <tr><th>7</th><td>0b0111</td><td>&nbsp;</tb><th>-7</th><td>0b1001</td></tr>
</table>

In tegenstelling tot bij de natuurlijke getallen, kunnen we hier **niet** de breedte verlengen door links nullen toe voegen. In het kort kan gezegd worden dat je MSB kunt herhalen aan de linkerkant.

Wat is het effect van 2's complement op 0? Juist, ja: 0.

Tenslotte dient er nog even gemeld te worden dat de conversie ook op een andere manier kan gebeuren: verminder het getal met 1 en voer dan een bits-gewijze inversie uit.

<!-- [Wikipedia](https://en.wikipedia.org/wiki/Two%27s_complement) heeft ook goede uitleg over 2's compliment. -->

## Signed vs Unsigned

{{% multiHcolumn %}}
{{% column %}}
Een basis concept van programmeren is het idee van een **type**. Als een variable gedeclareerd wordt, dient hierbij een type meegegeven te worden. Een voorbeeld hiervan in C is: ```char mychar;``` Een char is een variabele van 8 bits. Indien we enkel de natuurlijke getallen in acht nemen, kunnen er 256 (=2<sup>8</sup>) verschillende positieve getallen (én 0) weergegeven worden: <span style="border-radius: 2px; white-space: nowrap; color: #5e5e5e; background: #FFF7DD; border: 1px solid #fbf0cb; padding: 0px 2px; font-family: Consolas, menlo, monospace; font-size: 92%;">0 &le; mychar &lt; 256</span>. Omdat er hier geen rekening gehouden wordt met het *teken* van het getal, noemen we dit een **unsigned** type.

Indien we echter de gehele getallen in acht nemen, kunnen er 256 (=2<sup>8</sup>) verschillende positieve en negatieve getallen (én 0) weergegeven worden. Doordat de 2's complement methode gebruikt wordt, wordt het bereik: <span style="border-radius: 2px; white-space: nowrap; color: #5e5e5e; background: #FFF7DD; border: 1px solid #fbf0cb; padding: 0px 2px; font-family: Consolas, menlo, monospace; font-size: 92%;">-128 &le; mychar &lt; 128</span>. Omdat er hier wél rekening gehouden wordt met het *teken* van het getal, noemen we dit een **signed** type.

Ook in VHDL bestaan de types **signed** en **unsigned**. Deze kunnen gebruikt worden nadat de package **NUMERIC_STD** uit de **IEEE** library toegevoegd wordt. Zowel de types **signed** als **unsigned** worden gemaakt door een array te maken van **STD_LOGIC** waardes. Het voordeel hiervan is dat vergelijkingen (&lt;, &ge;, ...) correct uitgevoerd worden.

{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/300/signed_unsigned_2.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

Een computer (of een hardware dezign) ziet enkel een reeks van 1-en en 0-en. De interpretatie die eraan gegeven wordt, ligt bij de gebruiker. Het is dus van belang dat men dit wéét bij het ontwerp van hardware, of bij het schrijven van (low-end) software.


## Add/sub

Eén van de mogelijke ALU instructies is **f(x,y) = x-y**. Wiskundig gezien weten we echter dat: **x - y = x + (-y)**. Dus, je kan stellen dat een aftrekking hetzelfde is als een optelling met de negatieve waarde.

Hadden jullie nu net geen Ripple Carry Adder gemaakt? <b><i>#Chance-ke</i></b>.

