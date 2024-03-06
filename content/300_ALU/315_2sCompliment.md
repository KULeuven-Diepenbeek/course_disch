---
title: "2's Compliment"
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 315
draft: false
---

## &#8469;

Gezien je voor een richting electronica gekozen hebt, gaan we er van uit dat je geen schrik hebt van binaire getallen. Hopelijk zie je dat **0b1010** hetzelfde is als **0xA**, of <b><i>tien</i></b> zoals men in de volksmond zegt. Hieronder vind je nog een overzichtstabel voor de eerste 16 **natuurlijke** getallen.

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

In tegenstelling tot bij de natuurlijke getallen, kunnen hier **niet** de breedte verlengen door links nullen toe voegen. In het kort kan gezegd worden dat je MSB kunt herhalen aan de linkerkant.

Wat is het effect van 2's complement op ? Juist, ja: 0.

Tenslotte dient er nog even gemeld te worden dat de conversie ook op een andere manier kan gebeuren: verminder het getal met 1 en voer dan een bits-gewijze inversie uit.

<!-- [Wikipedia](https://en.wikipedia.org/wiki/Two%27s_complement) heeft ook goede uitleg over 2's compliment. -->

## Add/sub

Eén van de mogelijke ALU instructies is **f(x,y) = x-y**. Wiskundig gezien weten wechter dat: **x - y = x + (-y)**. Dus in het kort kan je stellen dat een aftrekking hetzelfde is als een optelling met de negatieve waarde.

Hadden jullie nu net geen Ripple Carry Adder gemaakt? <b><i>#Chance-ke</i></b>.